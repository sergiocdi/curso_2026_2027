---
tipo: unidad_didactica
modulo: "Acceso a Datos"
numero_ud: "UD02"
titulo: "UT2: Manejo de Conectores (JDBC y Oracle Database)"
horas_estimadas: 35
ra_asociados: ["RA2"]
ce_asociados: ["CE2.a", "CE2.b", "CE2.c", "CE2.d", "CE2.e"]
trimestre: 1
estado: en_desarrollo
---

# UT2 / UD02: Manejo de Conectores (JDBC y Oracle Database)

> **Módulo**: [[MOC-Acceso-a-Datos|Acceso a Datos]] | **Horas**: `35 h` | **Trimestre**: `1º` | **RA**: `RA2`

---

## 💡 Justificación y Reto Inicial
El estándar de facto para la interacción programática con bases de datos relacionales en el ecosistema Java es **JDBC (Java Database Connectivity)**. En esta unidad, los alumnos aprenderán a interactuar directamente con un motor empresarial como **Oracle Database**, aplicando buenas prácticas de ingeniería de software y patrones de diseño esenciales (**Singleton**, **DAO** y **DTO**) para estructurar aplicaciones profesionales desacopladas y mantenibles.

---

## 🧱 Bloques de Contenidos Principales

### 1. Conexión y Uso de Base de Datos Relacional con JDBC (Oracle)
- Arquitectura general de JDBC: `DriverManager`, `Driver`, `Connection`, `Statement`, `PreparedStatement` y `ResultSet`.
- Conexión específica a **Oracle Database**:
  - Configuración de dependencias Maven/Gradle del driver oficial `ojdbc` (`com.oracle.database.jdbc:ojdbc8` o `ojdbc11`).
  - Cadenas de conexión (URL JDBC): `jdbc:oracle:thin:@localhost:1521:xe` o servicios de bases de datos conectables (PDB).
  - Autenticación, esquemas y permisos de usuario en Oracle.
- Ejecución de consultas y operaciones de manipulación de datos:
  - Sentencias de lectura: `executeQuery()` y navegación segura por el `ResultSet`.
  - Sentencias de modificación (DML): `executeUpdate()` (INSERT, UPDATE, DELETE).
  - Sentencias preparadas (`PreparedStatement`) con parámetros parametrizados para la prevención radical de ataques de **Inyección SQL**.
- Gestión avanzada de JDBC en Oracle:
  - Tratamiento de excepciones `SQLException` y códigos de error propios de Oracle (`ORA-XXXXX`).
  - Control manual de transacciones ACID en Oracle: `setAutoCommit(false)`, `commit()`, `rollback()` y `Savepoint`.
  - Liberación segura y automática de conexiones y cursores mediante bloques `try-with-resources`.

### 2. Patrones de Diseño en el Uso de Bases de Datos
- **Patrón Singleton**:
  - Propósito: Asegurar una única instancia centralizada del gestor de conexiones a la base de datos Oracle.
  - Implementación thread-safe (doble verificación de bloqueo o *Bill Pugh Singleton*).
  - Evolución hacia `DataSource` y pools de conexiones para optimizar el coste de apertura de sesiones físicas en Oracle.
- **Patrón DTO (Data Transfer Object)**:
  - Propósito: Modelar y transportar datos puros entre las capas de persistencia y de negocio sin exponer lógica ni detalles SQL.
  - Implementación mediante POJOs tradicionales (getters/setters, `equals`, `hashCode`, `toString`) y modernos **Java Records**.
- **Patrón DAO (Data Access Object)**:
  - Propósito: Desacoplar completamente la lógica de negocio de la implementación tecnológica concreta de acceso a Oracle.
  - Diseño de interfaces genéricas de operaciones CRUD (`GenericDAO<T, ID>`).
  - Implementación concreta para Oracle (`ClienteDAOOracleImpl`, `ProductoDAOOracleImpl`).
  - Coordinación de la arquitectura completa: Controlador / Servicio -> DTO -> DAO -> Singleton / Conexión Oracle.

---

## 🧠 Conceptos Clave
```dataview
TABLE dificultad, estado
FROM "01-Modulos/Acceso-a-Datos/02-Conceptos"
WHERE tipo = "concepto" AND ud = "UD02"
SORT file.name ASC
```

---

## 💻 Actividades y Prácticas
```dataview
TABLE tipo_actividad, dificultad, tiempo_estimado_min + " min" as "Tiempo"
FROM "01-Modulos/Acceso-a-Datos/03-Ejercicios"
WHERE tipo = "ejercicio" AND ud = "UD02"
SORT file.name ASC
```

---

## ❓ Preguntas de Evaluación y Test Asociadas
```dataview
TABLE subtipo, dificultad, correcta as "Solución"
FROM "01-Modulos/Acceso-a-Datos/04-Banco-Items"
WHERE tipo = "item_evaluacion" AND ud = "UD02"
```
