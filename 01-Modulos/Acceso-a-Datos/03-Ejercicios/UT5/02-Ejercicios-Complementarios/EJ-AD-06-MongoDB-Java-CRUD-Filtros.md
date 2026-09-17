---
tipo: ejercicio
modulo: "Acceso a Datos"
ud: "UD05"
ra_asociados: ["RA5"]
ce_asociados: ["CE5.a", "CE5.b", "CE5.c"]
tipo_actividad: reto
dificultad: media
tiempo_estimado_min: 75
rubrica: "[[Rubrica-Practicas-Programacion]]"
---

# 💻 Ejercicio Guiado: CRUD y Consultas con Filtros en MongoDB desde Java

> **Módulo**: [[MOC-Acceso-a-Datos|Acceso a Datos]] | **UD**: [[UD05-Bases-de-Datos-NoSQL-MongoDB|UD05 / UT5]] | **RAs**: `RA5 (CE5.a, CE5.b, CE5.c)` | **Tiempo**: `75 min`

---

## 📋 Enunciado

Desarrollar una aplicación en Java conectada a una instancia local de **MongoDB** para gestionar el catálogo de juegos de una tienda digital:

1. **Configuración y Conexión**:
   - Conectarse al host `localhost:27017` y seleccionar la base de datos `game_store` y la colección `videojuegos`.
2. **Operaciones CRUD**:
   - Insertar 3 videojuegos con los campos: `titulo` (`String`), `plataforma` (`String`), `precio` (`double`), `generos` (`List<String>`) y `disponible` (`boolean`).
   - Consultar todos los juegos cuyo precio sea inferior a `30.0` euros.
   - Consultar los juegos que incluyan el género `"RPG"` dentro de su array de géneros.
   - Aplicar una rebaja del 15% a todos los juegos de la plataforma `"PC"`.
   - Eliminar los juegos marcados como `disponible: false`.

---

## 🛠️ Requisitos Técnicos
- Utilizar el driver oficial síncrono `org.mongodb:mongodb-driver-sync`.
- Emplear la clase `Filters` (`eq`, `lt`, `in`) y la clase `Updates` (`set`, `mul`).
- Cerrar la instancia de `MongoClient` al terminar la ejecución.
