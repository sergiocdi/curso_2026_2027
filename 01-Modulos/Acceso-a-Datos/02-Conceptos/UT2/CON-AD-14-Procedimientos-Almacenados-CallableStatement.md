---
tipo: concepto
modulo: "Acceso a Datos"
ud: "UD02"
ra_asociados: ["RA2"]
tags: [concepto, java, jdbc, oracle, plsql, callablestatement, stored-procedure]
dificultad: avanzada
estado: revisado
---

# 💡 Concepto: Invocación de Procedimientos y Funciones Almacenadas con CallableStatement

> **Módulo**: [[MOC-Acceso-a-Datos|Acceso a Datos]] | **UD**: [[UD02-Conectores-BBDD-Relacionales|UD02 / UT2]] | **RA**: [[RA02-Conectores-BBDD|RA2]]

---

## 📌 1. ¿Por qué Procedimientos Almacenados en Entornos Empresariales?

En grandes infraestructuras corporativas gobernadas por **Oracle Database**, es muy común que las reglas de negocio más críticas o las operaciones que procesan millones de registros no se implementen en Java, sino directamente en el motor mediante **procedimientos y funciones PL/SQL** (*Stored Procedures*):
1. **Rendimiento Máximo**: El código PL/SQL corre en el mismo proceso del servidor de base de datos; no hay tráfico de red de ida y vuelta para cada fila.
2. **Seguridad y Control de Acceso**: La cuenta de aplicación Java no tiene permisos directos de `INSERT` o `DELETE` sobre las tablas, sino únicamente permiso `EXECUTE` sobre los procedimientos auditados.
3. **Mantenibilidad Centralizada**: Un cambio en la fórmula de cálculo de un impuesto se actualiza en el procedimiento de Oracle sin necesidad de volver a compilar y desplegar las aplicaciones cliente Java.

---

## ⚙️ 2. La Interfaz `CallableStatement`

Para ejecutar llamadas a PL/SQL desde JDBC se utiliza la interfaz `java.sql.CallableStatement`, que hereda de `PreparedStatement`.

### Sintaxis de Escape Estándar JDBC:
- **Para un Procedimiento**: `"{call NOMBRE_PROCEDIMIENTO(?, ?, ?)}"`
- **Para una Función con Valor de Retorno**: `"{? = call NOMBRE_FUNCION(?, ?)}"`

### Tipos de Parámetros:
- **`IN` (Entrada)**: Se establecen mediante `cs.setInt(pos, valor)`, `cs.setString(pos, texto)`, etc.
- **`OUT` (Salida)**: Se deben registrar obligatoriamente **antes** de ejecutar mediante `cs.registerOutParameter(pos, java.sql.Types...)` y se leen **después** de `cs.execute()` con `cs.getInt(pos)`.
- **`IN OUT`**: Parámetros que envían un valor inicial y devuelven un valor modificado.

---

## 💻 3. Ejemplo Práctico en Oracle Database

### Definición del Procedimiento en Oracle PL/SQL:
```sql
CREATE OR REPLACE PROCEDURE sp_calcular_liquidacion (
    p_id_empleado   IN  NUMBER,
    p_salario_base  OUT NUMBER,
    p_bonificacion  OUT NUMBER,
    p_total_neto    OUT NUMBER
) AS
BEGIN
    SELECT salario INTO p_salario_base FROM empleados WHERE id = p_id_empleado;
    p_bonificacion := p_salario_base * 0.15;
    p_total_neto   := p_salario_base + p_bonificacion;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RAISE_APPLICATION_ERROR(-20001, 'El empleado no existe en la plantilla.');
END;
/
```

### Invocación desde Java con JDBC:
```java
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Types;

public class GestorNominaOracle {

    public static void liquidarEmpleado(Connection con, int idEmpleado) {
        String callSql = "{call sp_calcular_liquidacion(?, ?, ?, ?)}";

        try (CallableStatement cs = con.prepareCall(callSql)) {
            // 1. Establecer parámetro de entrada (IN)
            cs.setInt(1, idEmpleado);

            // 2. Registrar parámetros de salida (OUT) con tipos de java.sql.Types
            cs.registerOutParameter(2, Types.NUMERIC);
            cs.registerOutParameter(3, Types.NUMERIC);
            cs.registerOutParameter(4, Types.NUMERIC);

            // 3. Ejecutar la llamada en el motor Oracle
            cs.execute();

            // 4. Recuperar los valores devueltos por el procedimiento
            double salarioBase  = cs.getDouble(2);
            double bonificacion = cs.getDouble(3);
            double totalNeto    = cs.getDouble(4);

            System.out.printf("📋 Liquidación Empleado #%d:%n", idEmpleado);
            System.out.printf("   - Salario Base : %.2f €%n", salarioBase);
            System.out.printf("   - Bonificación : %.2f €%n", bonificacion);
            System.out.printf("   - Total Neto   : %.2f €%n", totalNeto);

        } catch (SQLException e) {
            System.err.printf("Error Oracle (Código %d): %s%n", e.getErrorCode(), e.getMessage());
        }
    }
}
```

---

## 🔄 4. Devolución de Cursores de Consulta (`SYS_REFCURSOR`)

Cuando un procedimiento en Oracle debe devolver un conjunto de filas (un `ResultSet`), se utiliza un cursor de referencia (`SYS_REFCURSOR`):

```java
// En Oracle: PROCEDURE sp_listar_por_departamento(p_depto IN VARCHAR2, p_cursor OUT SYS_REFCURSOR)
String call = "{call sp_listar_por_departamento(?, ?)}";
try (CallableStatement cs = con.prepareCall(call)) {
    cs.setString(1, "Ventas");
    cs.registerOutParameter(2, java.sql.Types.REF_CURSOR); // o Types.OTHER en drivers antiguos

    cs.execute();

    try (ResultSet rs = (ResultSet) cs.getObject(2)) {
        while (rs.next()) {
            System.out.println("Empleado: " + rs.getString("nombre"));
        }
    }
}
```
