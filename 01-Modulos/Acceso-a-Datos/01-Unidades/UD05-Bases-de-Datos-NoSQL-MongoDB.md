---
tipo: unidad_didactica
modulo: "Acceso a Datos"
numero_ud: "UD05"
titulo: "UT5: Bases de Datos No Relacionales (NoSQL) con MongoDB"
horas_estimadas: 30
ra_asociados: ["RA5"]
ce_asociados: ["CE5.a", "CE5.b", "CE5.c", "CE5.d", "CE5.e"]
trimestre: 2
estado: en_desarrollo
---

# UT5 / UD05: Bases de Datos No Relacionales (NoSQL) con MongoDB

> **Módulo**: [[MOC-Acceso-a-Datos|Acceso a Datos]] | **Horas**: `30 h` | **Trimestre**: `2º` | **RA**: `RA5`

---

## 💡 Justificación y Reto Inicial
El crecimiento masivo de datos no estructurados, las aplicaciones en tiempo real y la computación en la nube han consolidado el paradigma **NoSQL**. En esta unidad se analiza qué son las bases de datos no relacionales, su enorme relevancia e impacto en la industria del software moderna, y se aprende a crear, administrar, conectar y consultar una base de datos utilizando el motor documental de referencia: **MongoDB**.

---

## 🧱 Bloques de Contenidos Principales

### 1. ¿Qué son las Bases de Datos NoSQL y por qué son Importantes?
- Origen y necesidad histórica: limitaciones del modelo relacional tradicional (esquemas rígidos, dificultad para escalar horizontalmente y cuellos de botella en operaciones masivas de I/O).
- Ventajas fundamentales del paradigma NoSQL:
  - **Escalabilidad horizontal (Scale-out)**: Distribución de datos en múltiples nodos y clústeres (*sharding*).
  - **Esquema dinámico y flexible (*Schemaless*)**: Capacidad de almacenar documentos heterogéneos sin migraciones complejas de tablas.
  - **Alto rendimiento y baja latencia**: Optimización para lecturas y escrituras masivas.
- Compromisos arquitectónicos: El **Teorema CAP** (Consistencia, Disponibilidad, Tolerancia a Particiones) y el modelo **BASE** frente a las garantías ACID estrictas.
- Familias de bases de datos NoSQL y sus casos de uso:
  - Clave-Valor (Redis): Caché y sesiones en memoria.
  - Orientadas a Columnas (Apache Cassandra): Series temporales y Big Data.
  - Orientadas a Grafos (Neo4j): Redes sociales, detección de fraude y recomendadores.
  - Orientadas a Documentos (**MongoDB**): Aplicaciones web, catálogos, registros y microservicios.

### 2. MongoDB: Creación y Gestión de una Base de Datos
- Arquitectura básica de MongoDB: bases de datos, **colecciones** (equivalente a tablas) y **documentos BSON / JSON** (equivalente a registros).
- Tipos de datos en BSON y generación de claves primarias únicas `_id` (`ObjectId`).
- Despliegue y entorno de trabajo:
  - Puesta en marcha del servidor `mongod` (local o contenedor Docker).
  - Herramientas de interacción: consola oficial **`mongosh`** y entorno visual **MongoDB Compass**.
- Creación y administración:
  - Creación y cambio de base de datos activa: `use mi_tienda`.
  - Creación de colecciones: `db.createCollection("productos")` y creación implícita.
  - Comandos de inspección: `show dbs`, `show collections`, `db.stats()`.
  - Inserción de documentos: `insertOne()`, `insertMany()`.

### 3. Conexión a MongoDB
- **Conexión mediante URI estándar**: Estructura `mongodb://[usuario:password@]host[:puerto]/[base_datos]`.
- **Conexión programática desde Java**:
  - Inclusión del driver oficial: `org.mongodb:mongodb-driver-sync`.
  - Apertura del cliente con `MongoClients.create(connectionString)`.
  - Selección de base de datos y obtención de colección tipada: `MongoDatabase` y `MongoCollection<Document>`.
- **Conexión moderna en Spring Boot**:
  - Starter oficial `spring-boot-starter-data-mongodb`.
  - Configuración centralizada en `application.properties`: `spring.data.mongodb.uri=mongodb://localhost:27017/ad_empresa`.
  - Configuración de repositorios automáticos con `@EnableMongoRepositories`.

### 4. Consultas y Operaciones en MongoDB
- **Operaciones de Lectura y Filtrado (`find`)**:
  - Búsqueda total: `db.productos.find()`.
  - Filtros exactos y por campos anidados: `db.productos.find({ "precio": 50, "detalles.marca": "Sony" })`.
  - Operadores de comparación: `$gt`, `$gte`, `$lt`, `$lte`, `$ne`, `$in`, `$nin`.
  - Operadores lógicos: `$and`, `$or`, `$not`, `$nor`.
  - Búsqueda en arrays y elementos embebidos: `$all`, `$size`, `$elemMatch`.
  - Proyecciones (seleccionar qué campos mostrar/ocultar): `{ nombre: 1, precio: 1, _id: 0 }`.
  - Modificadores de consulta: `.sort({ precio: -1 })`, `.limit(10)`, `.skip(5)` (paginación).
- **Operaciones de Modificación y Borrado**:
  - Actualizaciones atómicas: `updateOne()`, `updateMany()` con operadores `$set`, `$unset`, `$inc`, `$push`, `$pull`.
  - Borrado seguro de documentos: `deleteOne()`, `deleteMany()`.
- **Consultas desde Java y Spring Boot**:
  - Mapeo declarativo con `@Document(collection = "productos")`, `@Id`, `@Field`.
  - Uso de interfaces `MongoRepository<Producto, String>` con métodos derivados (*Query Methods*).
  - Consultas personalizadas mediante la anotación `@Query("{ 'precio': { $lt: ?0 } }")`.
  - Consultas dinámicas avanzadas con `MongoTemplate` y `Criteria`.

---

## 🧠 Conceptos Clave
```dataview
TABLE dificultad, estado
FROM "01-Modulos/Acceso-a-Datos/02-Conceptos"
WHERE tipo = "concepto" AND ud = "UD05"
SORT file.name ASC
```

---

## 💻 Actividades y Prácticas
```dataview
TABLE tipo_actividad, dificultad, tiempo_estimado_min + " min" as "Tiempo"
FROM "01-Modulos/Acceso-a-Datos/03-Ejercicios"
WHERE tipo = "ejercicio" AND ud = "UD05"
SORT file.name ASC
```

---

## ❓ Preguntas de Evaluación y Test Asociadas
```dataview
TABLE subtipo, dificultad, correcta as "Solución"
FROM "01-Modulos/Acceso-a-Datos/04-Banco-Items"
WHERE tipo = "item_evaluacion" AND ud = "UD05"
```
