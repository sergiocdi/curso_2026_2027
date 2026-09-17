---
tipo: concepto
modulo: "Acceso a Datos"
ud: "UD02"
ra_asociados: ["RA2"]
tags: [concepto, java, jdbc, metadatos, databasemetadata, resultsetmetadata]
dificultad: media
estado: revisado
---

# 💡 Concepto: Metadatos en JDBC: DatabaseMetaData y ResultSetMetaData

> **Módulo**: [[MOC-Acceso-a-Datos|Acceso a Datos]] | **UD**: [[UD02-Conectores-BBDD-Relacionales|UD02 / UT2]] | **RA**: [[RA02-Conectores-BBDD|RA2]]

---

## 📌 1. Datos frente a Metadatos

En el desarrollo de software y persistencia:
- **Datos**: Son los registros y valores almacenados en las filas de las tablas (ejemplo: *"María Pérez"*, *2450.50*).
- **Metadatos**: Son los **datos que describen la estructura y naturaleza de los datos y del motor**:
  - ¿Qué tablas existen en el esquema del usuario?
  - ¿Qué columnas tiene una tabla, de qué tipos de datos SQL y si admiten nulos?
  - ¿Qué motor de base de datos estamos ejecutando y qué versión de driver?
  - En una consulta dinámica arbitraria, ¿cuántas columnas han retornado y cómo se titulan?

JDBC ofrece dos interfaces fundamentales para consultar metadatos: `DatabaseMetaData` (a nivel de motor y esquema) y `ResultSetMetaData` (a nivel de conjunto de resultados).

---

## 🏛️ 2. `DatabaseMetaData`: Inspección del Motor y Catálogo

Se obtiene directamente desde la conexión activa: `DatabaseMetaData dbmd = connection.getMetaData();`.

### Consultas más Utilizadas:
1. **Información del Sistema**:
   - `dbmd.getDatabaseProductName()` -> ej. *"Oracle"*
   - `dbmd.getDatabaseProductVersion()` -> ej. *"Oracle Database 21c Express Edition Release 21.0.0.0.0"*
   - `dbmd.getDriverName()` y `dbmd.getDriverVersion()`
2. **Listado de Tablas del Esquema**:
   - `dbmd.getTables(catalog, schemaPattern, tableNamePattern, types)`
3. **Claves Primarias y Foráneas**:
   - `dbmd.getPrimaryKeys(catalog, schema, table)`
   - `dbmd.getImportedKeys(catalog, schema, table)` / `getExportedKeys(...)`

```java
// Ejemplo: Listar todas las tablas de usuario en el esquema de Oracle
DatabaseMetaData dbmd = con.getMetaData();
String[] tipos = {"TABLE"};
try (ResultSet rs = dbmd.getTables(null, "C##DAM2_USER", "%", tipos)) {
    while (rs.next()) {
        String nombreTabla = rs.getString("TABLE_NAME");
        String tipoTabla   = rs.getString("TABLE_TYPE");
        System.out.printf("📁 Tabla encontrada: %-25s [%s]%n", nombreTabla, tipoTabla);
    }
}
```

---

## 📊 3. `ResultSetMetaData`: Estructura Dinámica de Consultas

Cuando un programa ejecuta una consulta SQL dinámica o arbitraria (como en una consola de administración o herramienta CLI de consulta), no sabemos de antemano cuántas columnas vendrán ni cómo se llaman.

`ResultSetMetaData rsmd = rs.getMetaData();` permite inspeccionar la cabecera de la respuesta:

### Métodos Principales de `ResultSetMetaData`:
- `rsmd.getColumnCount()`: Número total de columnas en el resultado.
- `rsmd.getColumnLabel(int i)`: Nombre o alias de la columna $i$ (los índices empiezan en 1).
- `rsmd.getColumnTypeName(int i)`: Nombre del tipo SQL nativo (ej. `VARCHAR2`, `NUMBER`, `DATE`).
- `rsmd.getColumnDisplaySize(int i)`: Ancho visual recomendado en caracteres.
- `rsmd.isNullable(int i)`: Indica si la columna admite valores `NULL`.

---

## 💻 4. Ejemplo Práctico: Generador Universal de Tablas de Consola

```java
import java.sql.*;

public class VisualizadorUniversalSQL {

    public static void imprimirConsulta(Connection con, String sql) throws SQLException {
        try (Statement st = con.createStatement();
             ResultSet rs = st.executeQuery(sql)) {

            ResultSetMetaData rsmd = rs.getMetaData();
            int numColumnas = rsmd.getColumnCount();

            System.out.println("=========================================================================");
            System.out.println("SQL: " + sql);
            System.out.println("=========================================================================");

            // 1. Imprimir nombres de columnas
            for (int i = 1; i <= numColumnas; i++) {
                System.out.printf("%-18s", rsmd.getColumnLabel(i));
            }
            System.out.println();

            // 2. Línea divisoria
            for (int i = 1; i <= numColumnas; i++) {
                System.out.print("------------------ ");
            }
            System.out.println();

            // 3. Imprimir filas de datos
            int filas = 0;
            while (rs.next()) {
                filas++;
                for (int i = 1; i <= numColumnas; i++) {
                    String valor = rs.getString(i);
                    System.out.printf("%-18s", valor != null ? valor : "<NULL>");
                }
                System.out.println();
            }

            System.out.println("=========================================================================");
            System.out.printf("Total filas recuperadas: %d%n%n", filas);
        }
    }
}
```
