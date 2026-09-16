---
tipo: apartado_programacion
modulo: "Acceso a Datos"
modalidad: "Presencial"
apartado_num: "04"
titulo: "Contenidos y Saberes Básicos"
---

# 4. Contenidos y Saberes Básicos

## Bloque 1: Manejo de Ficheros (UT1)
- Clases para gestión de ficheros y directorios: paquete `java.io` y API moderna `java.nio.file` (`Path`, `Files`).
- Flujos de datos (Streams): flujos basados en caracteres y flujos basados en bytes.
- Ficheros de acceso aleatorio (`RandomAccessFile`).
- Serialización y deserialización de objetos en Java.
- Manejo de documentos XML: parsers DOM y SAX. Serialización con JAXB.

## Bloque 2: Conectores y Bases de Datos Relacionales (UT2)
- Arquitectura JDBC. Tipos de drivers (Driver Thin para Oracle Database).
- Establecimiento de conexiones y gestión de pools con HikariCP.
- Ejecución de sentencias: `Statement`, `PreparedStatement` y `CallableStatement`.
- Procesamiento de resultados: `ResultSet` y metadatos.
- Control de transacciones ACID y niveles de aislamiento.
- Patrones arquitectónicos: Singleton, DAO (Data Access Object) y DTO.

## Bloque 3: Mapeo Objeto-Relacional - ORM (UT3)
- Concepto de desfase objeto-relacional.
- Framework Hibernate y especificación Jakarta Persistence (JPA).
- Configuración y arranque con Spring Boot 3 y Spring Data JPA.
- Mapeo de entidades: anotaciones `@Entity`, `@Table`, `@Id`, `@GeneratedValue`.
- Mapeo de relaciones: 1:1, 1:N, N:1 y N:M con `@JoinColumn` y colecciones.
- Lenguaje de consultas JPQL y Native SQL.
- Repositorios `JpaRepository` y métodos derivados.

## Bloque 4: Bases de Datos Objeto-Relacionales y XML (UT4)
- Conceptos fundamentales de persistencia orientada a objetos (db4o).
- Tipos de datos estructurados en bases de datos objeto-relacionales.
- Almacenamiento y consulta de documentos XML en base de datos.

## Bloque 5: Bases de Datos NoSQL (UT5)
- Clasificación de bases de datos NoSQL: documentales, clave-valor, grafos y columnares.
- Teorema CAP y modelo BASE.
- MongoDB: arquitectura, colecciones, documentos y formato BSON.
- Conexión mediante Java Driver oficial y Spring Data MongoDB.
- Operaciones CRUD, filtros y pipeline de agregación.

## Bloque 6: Componentes de Acceso a Datos (UT6)
- Concepto de componente software y especificación JavaBeans.
- Propiedades, métodos y eventos en componentes de persistencia.
- Empaquetado y distribución de librerías en formato JAR.
