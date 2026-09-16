---
tipo: unidad_didactica
modulo: "Acceso a Datos"
numero_ud: "UD04"
titulo: "UT4: Bases de Datos Objeto-Relacionales y Nativas XML"
horas_estimadas: 15
ra_asociados: ["RA4"]
ce_asociados: ["CE4.a", "CE4.b", "CE4.c", "CE4.d"]
trimestre: 2
estado: en_desarrollo
---

# UT4 / UD04: Bases de Datos Objeto-Relacionales y Nativas XML

> **Módulo**: [[MOC-Acceso-a-Datos|Acceso a Datos]] | **Horas**: `15 h` | **Trimestre**: `2º` | **RA**: `RA4`

---

## 💡 Justificación y Reto Inicial
El estándar relacional puro presenta limitaciones para representar estructuras jerárquicas o modelos de dominio complejos. Para cubrir el **Resultado de Aprendizaje 4 (RA4)** del currículo oficial, en esta unidad se analizan dos extensiones clave de la persistencia:
1. La extensión **Objeto-Relacional en Oracle Database** (aprovechando el motor que los alumnos ya dominan de UT2 y UT3), donde se crean tipos de usuario (`OBJECT TYPES`), colecciones (`VARRAY`, `TABLE`) y tablas de objetos.
2. El almacenamiento y consulta de datos jerárquicos nativos en formato **XML** mediante lenguajes declarativos de navegación (**XPath** y **XQuery**), tanto dentro del propio motor de base de datos (`XMLType` de Oracle) como en gestores nativos XML.

---

## 🧱 Bloques de Contenidos Principales

### 1. Fundamentos de las Bases de Datos Objeto-Relacionales (BDO-R)
- Evolución desde el modelo relacional puro (Codd) hacia el estándar SQL:1999 / SQL:2003.
- Características del modelo objeto-relacional: tipos abstractos de datos (ADTs), encapsulamiento, herencia de tipos y referencias de objetos (`REF`).
- Diferencias y comparativa entre:
  - Bases de datos relacionales puras (RDBMS).
  - Bases de datos objeto-relacionales (ORDBMS como Oracle o PostgreSQL).
  - Persistencia mediante frameworks ORM (JPA/Hibernate) sobre tablas relacionales.

### 2. Extensión Objeto-Relacional en Oracle Database
- Creación y gestión de tipos de usuario:
  - Definición de tipos estructurados: `CREATE OR REPLACE TYPE direccion_t AS OBJECT (...)`.
  - Definición de métodos de tipo (funciones miembro y procedimientos): `MEMBER FUNCTION`.
- Colecciones y arrays nativos en Oracle:
  - Arrays de tamaño fijo: `CREATE TYPE telefonos_arr AS VARRAY(5) OF VARCHAR2(15)`.
  - Tablas anidadas (*Nested Tables*): `CREATE TYPE lineas_ped_tab AS TABLE OF linea_pedido_t`.
- Tablas de objetos y vistas de objetos:
  - Creación de tablas basadas en tipos: `CREATE TABLE clientes OF cliente_t (...)`.
  - Identificadores de objetos (`OID`) y punteros de referencia con el operador `REF` y función `DEREF()`.
- Manipulación con JDBC desde Java:
  - Mapeo de tipos estructurados con interfaces estándar `java.sql.Struct` y arrays con `java.sql.Array`.

### 3. Bases de Datos Nativas XML y Consultas Jerárquicas
- Almacenamiento nativo de documentos XML frente al almacenamiento relacional descompuesto.
- El tipo nativo `XMLType` en Oracle Database:
  - Almacenamiento de documentos XML en columnas de tablas relacionales.
  - Funciones nativas de consulta y extracción de datos XML en Oracle (`XMLQuery`, `XMLTable`, `XMLExists`).
- Lenguajes de consulta sobre documentos XML:
  - **XPath**: Expresiones de ruta, ejes, nodos, predicados y funciones para localizar fragmentos en el árbol XML.
  - **XQuery**: Construcción de consultas complejas, expresiones FLWOR (*For, Let, Where, Order by, Return*) y generación de nuevos formatos de salida.
- Gestores de bases de datos nativas XML (eXist-db / BaseX):
  - Conexión y ejecución de consultas XPath/XQuery mediante APIs Java (XQJ - XQuery API for Java / XML:DB API).

---

## 🧠 Conceptos Clave
```dataview
TABLE dificultad, estado
FROM "01-Modulos/Acceso-a-Datos/02-Conceptos"
WHERE tipo = "concepto" AND ud = "UD04"
SORT file.name ASC
```

---

## 💻 Actividades y Prácticas
```dataview
TABLE tipo_actividad, dificultad, tiempo_estimado_min + " min" as "Tiempo"
FROM "01-Modulos/Acceso-a-Datos/03-Ejercicios"
WHERE tipo = "ejercicio" AND ud = "UD04"
SORT file.name ASC
```

---

## ❓ Preguntas de Evaluación y Test Asociadas
```dataview
TABLE subtipo, dificultad, correcta as "Solución"
FROM "01-Modulos/Acceso-a-Datos/04-Banco-Items"
WHERE tipo = "item_evaluacion" AND ud = "UD04"
```
