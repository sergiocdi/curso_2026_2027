---
tipo: concepto
modulo: "Acceso a Datos"
ud: "UD02"
ra_asociados: ["RA2"]
tags: [concepto, java, jdbc, transacciones, acid, savepoint, oracle]
dificultad: media
estado: revisado
---

# 💡 Concepto: Transacciones ACID en JDBC y Puntos de Restauración (Savepoint)

> **Módulo**: [[MOC-Acceso-a-Datos|Acceso a Datos]] | **UD**: [[UD02-Conectores-BBDD-Relacionales|UD02 / UT2]] | **RA**: [[RA02-Conectores-BBDD|RA2]]

---

## 📌 1. ¿Qué es una Transacción y por qué es Crítica?

En los sistemas gestores de bases de datos relacionales empresariales (como **Oracle Database**), una **transacción** es una secuencia de una o varias operaciones SQL que se ejecutan como una **única unidad atómica de trabajo lógico**.

Una transacción debe cumplir estrictamente las propiedades **ACID**:
- **Atomicidad (Atomicity)**: O se ejecutan todas las operaciones con éxito, o no se ejecuta ninguna. No pueden existir estados a medias.
- **Consistencia (Consistency)**: La base de datos pasa de un estado válido a otro estado válido, respetando todas las restricciones de integridad (`FOREIGN KEY`, `CHECK`, `UNIQUE`, `NOT NULL`).
- **Aislamiento (Isolation)**: Las operaciones de una transacción en curso son invisibles para otras transacciones simultáneas hasta que se confirman.
- **Durabilidad (Durability)**: Una vez confirmada la transacción con `COMMIT`, los cambios persisten de manera irreversible, incluso ante caídas de corriente o fallos del servidor.

### El Problema del Auto-Commit por Defecto en JDBC
Por defecto, la especificación JDBC establece `connection.getAutoCommit() == true`. Esto significa que **cada instrucción SQL individual (`executeUpdate`) se confirma automáticamente en disco nada más enviarse**. Si una transferencia bancaria implica un `UPDATE` de débito en la cuenta origen y un segundo `UPDATE` de abono en la cuenta destino, una caída entre ambas sentencias dejaría el dinero evaporado.

---

## 🛠️ 2. Control Manual de Transacciones en JDBC

Para coordinar transacciones compuestas se sigue el patrón sistemático:
1. **Desactivar Auto-Commit**: `connection.setAutoCommit(false);`
2. **Ejecutar sentencias DML** dentro de un bloque `try`.
3. **Confirmar Cambios**: `connection.commit();` al finalizar con éxito todas las operaciones.
4. **Reversión Total**: `connection.rollback();` dentro del bloque `catch (SQLException e)` para restaurar el estado previo.
5. **Restaurar Estado**: `connection.setAutoCommit(true);` en el bloque `finally`.

```java
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class ServicioTransferencia {

    public static void transferir(Connection con, String origen, String destino, double importe) throws SQLException {
        String sqlDebito = "UPDATE cuentas SET saldo = saldo - ? WHERE iban = ? AND saldo >= ?";
        String sqlAbono  = "UPDATE cuentas SET saldo = saldo + ? WHERE iban = ?";

        // 1. Desactivar confirmación automática
        con.setAutoCommit(false);

        try (PreparedStatement psDebito = con.prepareStatement(sqlDebito);
             PreparedStatement psAbono  = con.prepareStatement(sqlAbono)) {

            // Operación 1: Retirar fondos
            psDebito.setDouble(1, importe);
            psDebito.setString(2, origen);
            psDebito.setDouble(3, importe);
            int filasDebito = psDebito.executeUpdate();

            if (filasDebito == 0) {
                throw new SQLException("Saldo insuficiente o cuenta origen inexistente: " + origen);
            }

            // Operación 2: Abonar fondos
            psAbono.setDouble(1, importe);
            psAbono.setString(2, destino);
            int filasAbono = psAbono.executeUpdate();

            if (filasAbono == 0) {
                throw new SQLException("Cuenta destino no encontrada: " + destino);
            }

            // 2. Si ambas tienen éxito, confirmar permanentemente en Oracle
            con.commit();
            System.out.printf("✅ Transferencia de %.2f € confirmada con éxito (COMMIT).%n", importe);

        } catch (SQLException e) {
            // 3. Ante cualquier fallo, deshacer todos los cambios de la transacción
            con.rollback();
            System.err.println("⚠️ Error en transferencia. Cambios revertidos (ROLLBACK): " + e.getMessage());
            throw e; // Relanzar excepción para la capa superior
        } finally {
            // 4. Dejar la conexión en su estado habitual antes de devolverla al pool
            con.setAutoCommit(true);
        }
    }
}
```

---

## 📍 3. Puntos de Restauración Parciales (`Savepoint`)

En operaciones transaccionales complejas con múltiples etapas (por ejemplo, el procesamiento de un pedido con 20 líneas de artículos), es posible que deseemos **deshacer únicamente una parte de la transacción** sin perder todo el trabajo previo.

Para ello, JDBC proporciona la interfaz `Savepoint`:

```java
// Crear un punto de guardado antes de una operación arriesgada
Savepoint punto1 = con.setSavepoint("PuntoAntesDePromociones");

try {
    // Intentar aplicar descuento especial optativo
    aplicarDescuento(con, idCliente);
} catch (SQLException e) {
    // Si falla la promoción, no cancelamos todo el pedido: revertimos solo hasta el savepoint
    con.rollback(punto1);
    System.out.println("Promoción no aplicable, continuando con el pedido base.");
}

// Confirmamos el pedido base (y la promoción si tuvo éxito)
con.commit();
```

---

## 🔒 4. Niveles de Aislamiento de Transacciones (`Transaction Isolation Levels`)

JDBC permite configurar el grado de aislamiento frente a concurrencia mediante `con.setTransactionIsolation(...)`:

| Nivel de Aislamiento | Lectura Sucia (*Dirty Read*) | Lectura No Repetible (*Non-Repeatable*) | Lectura Fantasma (*Phantom Read*) |
| :--- | :---: | :---: | :---: |
| `TRANSACTION_READ_UNCOMMITTED` | Sí | Sí | Sí |
| `TRANSACTION_READ_COMMITTED` *(Por defecto en Oracle)* | **No** | Sí | Sí |
| `TRANSACTION_REPEATABLE_READ` | **No** | **No** | Sí |
| `TRANSACTION_SERIALIZABLE` | **No** | **No** | **No** |

> [!NOTE]
> En Oracle Database, el nivel estándar por defecto es `TRANSACTION_READ_COMMITTED`, donde las consultas solo ven datos confirmados mediante `commit` previo, garantizando consistencia sin bloquear excesivamente la concurrencia.
