---
tipo: concepto
modulo: "Acceso a Datos"
ud: "UD05"
ra_asociados: ["RA5"]
tags: [concepto, nosql, mongodb, bson, cap]
dificultad: basica
estado: revisado
---

# 💡 Concepto: Bases de Datos NoSQL y Arquitectura Documental en MongoDB

> **Módulo**: [[MOC-Acceso-a-Datos|Acceso a Datos]] | **UD**: [[UD05-Bases-de-Datos-NoSQL-MongoDB|UD05 / UT5]] | **RA**: [[RA05-Bases-Datos-NoSQL|RA5]]

---

## 📌 1. ¿Por qué surgen las Bases de Datos NoSQL?

Las bases de datos relacionales tradicionales (SQL) exigen esquemas fijos y relaciones costosas mediante claves foráneas y operaciones `JOIN`. Al escalar horizontalmente (*sharding*) sobre clústeres distribuidos de cientos de servidores, mantener las garantías ACID estrictas se vuelve extremadamente costoso y ralentiza las operaciones.

El movimiento **NoSQL (Not Only SQL)** ofrece:
- **Esquema dinámico (*Schemaless*)**: Los registros pueden tener estructuras heterogéneas sin necesidad de alterar la definición de la tabla.
- **Escalabilidad horizontal nativa (*Scale-out*)**: Distribución de datos en múltiples nodos sin penalización severa.
- **Modelo BASE**: *Basically Available* (disponibilidad garantizada), *Soft state* (el estado del sistema puede fluctuar), *Eventual consistency* (consistencia eventual en lugar de inmediata).

---

## 📄 2. Modelo de Documentos en MongoDB

MongoDB es un motor orientado a **documentos**. Sus conceptos fundamentales se mapean respecto al mundo relacional de la siguiente forma:

| Modelo Relacional (SQL) | Modelo Documental (MongoDB) |
| :--- | :--- |
| Base de Datos (*Database*) | Base de Datos (*Database*) |
| Tabla (*Table*) | **Colección (*Collection*)** |
| Fila / Tupla (*Row*) | **Documento (*Document - BSON*)** |
| Columna (*Column*) | **Campo (*Field: Value*)** |
| Clave Primaria (`PRIMARY KEY`) | Identificador único `_id` (`ObjectId`) |
| Uniones (`JOIN`) | **Documentos embebidos (*Embedded*)** o Referencias (`$lookup`) |

Un documento BSON (Binary JSON) permite anidar subdocumentos y arrays:

```json
{
  "_id": ObjectId("64f1a2b3c4d5e6f7a8b9c0d1"),
  "sku": "LAPTOP-PRO-15",
  "nombre": "Ultrabook 15 pulgadas",
  "precio": 999.95,
  "activo": true,
  "especificaciones": {
    "ram_gb": 32,
    "disco": "1TB NVMe",
    "cpu": "Intel i7"
  },
  "tags": ["informatica", "profesional", "portatil"]
}
```

---

## 🖥️ 3. Comandos Esenciales en la Consola `mongosh`

```javascript
// 1. Conectarse y usar una base de datos
use tienda_electronica

// 2. Insertar documentos
db.productos.insertOne({
  referencia: "DISC-SSD-2TB",
  precio: 145.0,
  stock: 25
})

// 3. Consultar con filtros
db.productos.find({ precio: { $gte: 100 } })

// 4. Actualizar campos
db.productos.updateOne(
  { referencia: "DISC-SSD-2TB" },
  { $inc: { stock: -1 } } // Decrementa en 1 de forma atómica
)

// 5. Eliminar
db.productos.deleteOne({ referencia: "DISC-SSD-2TB" })
```
