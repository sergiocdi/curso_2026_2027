---
tipo: apartado_programacion
modulo: "Acceso a Datos"
apartado_num: "04"
titulo: "Contenidos y Saberes Básicos"
---

# 4. Contenidos y Saberes Básicos

Los contenidos se agrupan en los siguientes bloques temáticos, articulados de lo simple a lo complejo:

## Bloque 1 (UT1): Manejo de ficheros
- Gestión de ficheros y directorios con `java.io.File` y la API moderna `java.nio.file` (`Path`, `Files`).
- Lectura y escritura de ficheros de texto: `FileReader`, `FileWriter`, `BufferedReader`, `BufferedWriter`, `Scanner`, `PrintWriter`.
- Lectura y escritura de ficheros de datos y flujos binarios: `FileInputStream`, `FileOutputStream`, `DataInputStream`, `DataOutputStream`, `RandomAccessFile`.
- Serialización de objetos: interfaz `Serializable`, canales de objetos `ObjectInputStream` / `ObjectOutputStream` y modificador `transient`.
- Lectura y escritura en ficheros XML: parsers DOM (`DocumentBuilder`, `Transformer`), parsers SAX por eventos y mapeo declarativo con JAXB.

## Bloque 2 (UT2): Manejo de conectores (JDBC y Oracle)
- Arquitectura JDBC. Carga de drivers y conexión a **Oracle Database** mediante `ojdbc`.
- Cadenas de conexión (URL JDBC), autenticación y esquemas de usuario en Oracle.
- Ejecución de sentencias: `Statement`, `PreparedStatement` (parametrización y prevención de SQL Injection) y procesamiento con `ResultSet`.
- Gestión de transacciones ACID en Oracle: control manual (`setAutoCommit(false)`), `commit()`, `rollback()` y puntos de guardado (`Savepoint`).
- Patrones de diseño de persistencia:
  - **Singleton**: Instancia única del gestor de conexiones/pool.
  - **DTO (Data Transfer Object)**: Transporte de datos estructurados entre capas (POJOs / Java Records).
  - **DAO (Data Access Object)**: Interfaces genéricas y clases de acceso a datos desacopladas de la lógica de negocio.

## Bloque 3 (UT3): Mapeo Objeto-Relacional (Spring Boot, JPA y Hibernate)
- Fundamentos de ORM y problemática del desajuste de impedancia objeto-relacional.
- Integración en **Spring Boot** con **Spring Data JPA** e **Hibernate** como proveedor para **Oracle Database**.
- Configuración de conexión y dialecto Oracle (`OracleDialect`) en `application.properties`.
- Mapeos de entidades: anotaciones `@Entity`, `@Table`, `@Id`, secuencias de Oracle (`@SequenceGenerator`), `@Column`, `@Temporal`, `@Enumerated` y `@Transient`.
- Mapeo de relaciones: `@ManyToOne`, `@OneToMany`, `@OneToOne`, `@ManyToMany` con tablas intermedias (`@JoinTable`), cascadas (`CascadeType`) y carga perezosa (`FetchType.LAZY`).
- Consultas y persistencia en Spring Data: interfaces `JpaRepository`, consultas derivadas por convención de nombres (*query methods*), consultas JPQL y consultas nativas SQL con `@Query`, ordenación y paginación (`Pageable`).

## Bloque 4 (UT4): Bases de datos objeto-relacionales y nativas XML
- Evolución desde el modelo relacional hacia el estándar objeto-relacional (SQL:1999 / SQL:2003).
- Extensión objeto-relacional en **Oracle Database**:
  - Tipos estructurados de usuario (`CREATE TYPE ... AS OBJECT`) y métodos miembro.
  - Colecciones y arrays nativos: `VARRAY` y tablas anidadas (*Nested Tables*).
  - Tablas de objetos y referencias OID (`REF`, `DEREF`).
  - Mapeo y manipulación con JDBC en Java (`java.sql.Struct`, `java.sql.Array`).
- Almacenamiento nativo XML y consultas jerárquicas:
  - El tipo de datos `XMLType` en Oracle Database y funciones nativas (`XMLQuery`, `XMLTable`).
  - Lenguajes de consulta: navegación jerárquica con **XPath** y construcción de consultas con **XQuery** (expresiones FLWOR).
  - Gestores nativos XML (eXist-db / BaseX) y conectividad mediante APIs Java (XQJ / XML:DB).

## Bloque 5 (UT5): Bases de datos no relacionales (NoSQL) con MongoDB
- Fundamentos y justificación de NoSQL: limitaciones del modelo relacional, escalabilidad horizontal y Teorema CAP.
- Taxonomía NoSQL: clave-valor, columnares, grafos y orientadas a documentos (**MongoDB**).
- Arquitectura y operaciones en MongoDB:
  - Estructura: bases de datos, colecciones y documentos **BSON/JSON** con identificador `_id` (`ObjectId`).
  - Entorno de trabajo: consola interactiva `mongosh` y MongoDB Compass.
  - Conexión: cadenas de conexión URI, driver Java oficial `mongodb-driver-sync` e integración en **Spring Boot (Spring Data MongoDB)**.
  - Operaciones CRUD fundamentales: `insertOne()`, `insertMany()`, `find()`, `updateOne()`, `deleteMany()` y operadores (`$gt`, `$in`, `$set`, etc.).
  - Consultas avanzadas: filtros por campos anidados, búsquedas en arrays y proyección de campos.
  - Consultas con Spring Data: repositorios `MongoRepository`, métodos derivados (*Query Methods*) y consultas JSON con `@Query`.

## Bloque 6 (UT6): Componentes de acceso a datos (Conceptos básicos y reutilización)
- Concepto de componente software y desarrollo basado en componentes (caja negra y desacoplamiento).
- El estándar canónico **JavaBeans**: reglas de diseño (constructor vacío, encapsulación de propiedades privadas y serialización).
- Empaquetado y distribución en librerías estándar `.jar` con Maven (`mvn clean package`).
- Integración y uso directo de librerías de componentes desde aplicaciones cliente independientes.
