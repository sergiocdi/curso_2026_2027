---
tipo: apartado_programacion
modulo: "Acceso a Datos"
apartado_num: "03"
titulo: "Resultados de Aprendizaje y Criterios de Evaluación"
---

# 3. Resultados de Aprendizaje y Criterios de Evaluación

El currículo oficial del módulo profesional de **Acceso a Datos** (0486) se articula en torno a 6 Resultados de Aprendizaje (RAs). A continuación se establece la ponderación de cada Resultado de Aprendizaje dentro del cómputo global del módulo (sumando el 100%), así como el desglose pormenorizado de los **Criterios de Evaluación (CE)** asociados, indicando el **peso específico de cada criterio dentro de su correspondiente RA** y su contribución efectiva a la calificación global del módulo.

---

## 3.1. Resumen de Ponderación Curricular por Resultados de Aprendizaje

| Código RA | Denominación Oficial del Resultado de Aprendizaje | Peso en el Módulo (%) | Criterios Asociados |
| :---: | :--- | :---: | :---: |
| **RA1** | Desarrolla aplicaciones que gestionan información almacenada en ficheros identificando el campo de aplicación de los mismos y utilizando clases específicas. | **15%** | CE1.a – CE1.e (5 criterios) |
| **RA2** | Desarrolla aplicaciones que gestionan información almacenada en bases de datos relacionales identificando el campo de aplicación de los mismos y utilizando conectores específicos (JDBC). | **20%** | CE2.a – CE2.e (5 criterios) |
| **RA3** | Gestiona la persistencia de los datos identificando herramientas de mapeo objeto relacional (ORM) y desarrollando aplicaciones que las utilizan (Hibernate / JPA). | **25%** | CE3.a – CE3.e (5 criterios) |
| **RA4** | Desarrolla aplicaciones que gestionan la información almacenada en bases de datos objeto-relacionales y nativas XML analizando sus características y utilizando los motores y lenguajes de consulta específicos. | **10%** | CE4.a – CE4.d (4 criterios) |
| **RA5** | Desarrolla aplicaciones que gestionan la información almacenada en bases de datos no relacionales (NoSQL) analizando sus características y seleccionando motores según requisitos (MongoDB / Redis). | **20%** | CE5.a – CE5.d (4 criterios) |
| **RA6** | Desarrolla componentes de acceso a datos empaquetables y reutilizables integrándolos en aplicaciones cliente. | **10%** | CE6.a – CE6.c (3 criterios) |
| **TOTAL** | **Carga Curricular Total del Módulo Profesional** | **100%** | **26 Criterios de Evaluación** |

---

## 3.2. Desglose Pormenorizado de Criterios de Evaluación y Ponderación Interna

### 🔹 RA1: Gestión de Información en Ficheros y Formatos Estructurados (Ponderación en Módulo: 15%)
*Enunciado*: Desarrolla aplicaciones que gestionan información almacenada en ficheros identificando el campo de aplicación de los mismos y utilizando clases específicas.

| Criterio | Descripción Oficial del Criterio de Evaluación | Peso dentro del RA (%) | Peso en Módulo (%) |
| :---: | :--- | :---: | :---: |
| **CE1.a** | Se han utilizado clases para la gestión de ficheros y directorios (paquete `java.io` y API moderna `java.nio.file`). | **20%** | 3,00% |
| **CE1.b** | Se han utilizado flujos de caracteres y bytes para leer y escribir información en ficheros de texto y binarios tipados. | **25%** | 3,75% |
| **CE1.c** | Se han implementado mecanismos de acceso secuencial y aleatorio gestionando punteros de lectura/escritura (`RandomAccessFile`). | **20%** | 3,00% |
| **CE1.d** | Se han serializado y deserializado objetos en flujos binarios gestionando versiones con `serialVersionUID`. | **15%** | 2,25% |
| **CE1.e** | Se han procesado documentos XML y JSON utilizando parsers estándar y herramientas de binding (DOM, SAX, JAXB). | **20%** | 3,00% |
| **Subtotal** | **Total Criterios RA1** | **100%** | **15,00%** |

---

### 🔹 RA2: Conectores y Bases de Datos Relacionales - JDBC (Ponderación en Módulo: 20%)
*Enunciado*: Desarrolla aplicaciones que gestionan información almacenada en bases de datos relacionales identificando el campo de aplicación de los mismos y utilizando conectores específicos.

| Criterio | Descripción Oficial del Criterio de Evaluación | Peso dentro del RA (%) | Peso en Módulo (%) |
| :---: | :--- | :---: | :---: |
| **CE2.a** | Se ha establecido la conexión con el motor de base de datos utilizando el driver y parámetros adecuados (Driver Thin en Oracle Database). | **15%** | 3,00% |
| **CE2.b** | Se han ejecutado consultas y sentencias DML utilizando sentencias preparadas y parametrizadas (`PreparedStatement`) para evitar inyección SQL. | **30%** | 6,00% |
| **CE2.c** | Se han recuperado y procesado conjuntos de resultados gestionando cursores y metadatos (`ResultSetMetaData` y `DatabaseMetaData`). | **20%** | 4,00% |
| **CE2.d** | Se han gestionado transacciones asegurando propiedades ACID, puntos de restauración (`Savepoint`) y control de rollbacks. | **25%** | 5,00% |
| **CE2.e** | Se han configurado piscinas de conexiones de alto rendimiento (HikariCP) analizando su impacto en la escalabilidad y evitando fugas. | **10%** | 2,00% |
| **Subtotal** | **Total Criterios RA2** | **100%** | **20,00%** |

---

### 🔹 RA3: Mapeo Objeto-Relacional - ORM (Ponderación en Módulo: 25%)
*Enunciado*: Gestiona la persistencia de los datos identificando herramientas de mapeo objeto relacional (ORM) y desarrollando aplicaciones que las utilizan.

| Criterio | Descripción Oficial del Criterio de Evaluación | Peso dentro del RA (%) | Peso en Módulo (%) |
| :---: | :--- | :---: | :---: |
| **CE3.a** | Se han analizado las ventajas del mapeo objeto-relacional y la arquitectura de la especificación JPA frente a Hibernate nativo. | **15%** | 3,75% |
| **CE3.b** | Se han mapeado clases y atributos a tablas relacionales mediante anotaciones JPA (`@Entity`, `@Table`, `@Id`, `@GeneratedValue`). | **25%** | 6,25% |
| **CE3.c** | Se han mapeado asociaciones y relaciones complejas (1:1, 1:N, N:M) y definido estrategias de carga (`LAZY` vs `EAGER`). | **25%** | 6,25% |
| **CE3.d** | Se han realizado consultas complejas orientadas a objetos mediante JPQL / HQL y repositorios Spring Data JPA. | **25%** | 6,25% |
| **CE3.e** | Se ha gestionado el ciclo de vida de las entidades (New, Managed, Detached, Removed) y las transacciones en el contexto de persistencia. | **10%** | 2,50% |
| **Subtotal** | **Total Criterios RA3** | **100%** | **25,00%** |

---

### 🔹 RA4: Bases de Datos Objeto-Relacionales y Nativas XML (Ponderación en Módulo: 10%)
*Enunciado*: Desarrolla aplicaciones que gestionan la información almacenada en bases de datos objeto-relacionales y nativas XML analizando sus características y utilizando los motores y lenguajes de consulta específicos.

| Criterio | Descripción Oficial del Criterio de Evaluación | Peso dentro del RA (%) | Peso en Módulo (%) |
| :---: | :--- | :---: | :---: |
| **CE4.a** | Se han identificado las características diferenciales de las bases de datos objeto-relacionales y orientadas a objetos. | **25%** | 2,50% |
| **CE4.b** | Se han utilizado tipos estructurados y colecciones de objetos en motores de bases de datos relacionales avanzados. | **25%** | 2,50% |
| **CE4.c** | Se han realizado consultas sobre repositorios y bases de datos nativas XML mediante lenguajes de navegación y filtrado (XPath / XQuery). | **30%** | 3,00% |
| **CE4.d** | Se han integrado sentencias XML en aplicaciones Java mediante APIs específicas de persistencia y colecciones documentales. | **20%** | 2,00% |
| **Subtotal** | **Total Criterios RA4** | **100%** | **10,00%** |

---

### 🔹 RA5: Bases de Datos No Relacionales - NoSQL (Ponderación en Módulo: 20%)
*Enunciado*: Desarrolla aplicaciones que gestionan la información almacenada en bases de datos no relacionales (NoSQL) analizando sus características y seleccionando motores según requisitos.

| Criterio | Descripción Oficial del Criterio de Evaluación | Peso dentro del RA (%) | Peso en Módulo (%) |
| :---: | :--- | :---: | :---: |
| **CE5.a** | Se han clasificado los tipos de bases de datos NoSQL (documentales, clave-valor, columnas, grafos), el teorema CAP y el modelo BASE. | **20%** | 4,00% |
| **CE5.b** | Se han realizado operaciones CRUD sobre colecciones y documentos en formato BSON/JSON en MongoDB. | **30%** | 6,00% |
| **CE5.c** | Se han diseñado pipelines de agregación, ordenaciones, índices y filtros complejos sobre bases de datos documentales. | **25%** | 5,00% |
| **CE5.d** | Se han conectado aplicaciones Java a bases de datos NoSQL utilizando controladores nativos (Java Driver) y Spring Data MongoDB. | **25%** | 5,00% |
| **Subtotal** | **Total Criterios RA5** | **100%** | **20,00%** |

---

### 🔹 RA6: Componentes de Acceso a Datos y Reutilización (Ponderación en Módulo: 10%)
*Enunciado*: Desarrolla componentes de acceso a datos empaquetables y reutilizables integrándolos en aplicaciones cliente.

| Criterio | Descripción Oficial del Criterio de Evaluación | Peso dentro del RA (%) | Peso en Módulo (%) |
| :---: | :--- | :---: | :---: |
| **CE6.a** | Se han diseñado componentes reutilizables de acceso a datos aplicando la especificación JavaBeans y empaquetado en librerías JAR. | **35%** | 3,50% |
| **CE6.b** | Se han definido propiedades (simples, indexadas, ligadas), eventos personalizados y métodos de acceso persistente. | **35%** | 3,50% |
| **CE6.c** | Se han integrado y probado los componentes empaquetados en proyectos cliente independientes verificando su desacoplamiento. | **30%** | 3,00% |
| **Subtotal** | **Total Criterios RA6** | **100%** | **10,00%** |
