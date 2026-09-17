---
tipo: ejercicio
modulo: "Acceso a Datos"
ud: "UD05"
ra_asociados: ["RA5"]
ce_asociados: ["CE5.a", "CE5.b", "CE5.c", "CE5.d", "CE5.e"]
tipo_actividad: practica_afianzamiento
dificultad: media
tiempo_estimado_min: 180
rubrica: "[[Rubrica-Practicas-Programacion]]"
---

# 🚀 Práctica de Afianzamiento UT5: Repositorio Documental y Analytics con MongoDB y Java

> **Módulo**: [[MOC-Acceso-a-Datos|Acceso a Datos]] | **UD**: [[UD05-Bases-de-Datos-NoSQL-MongoDB|UD05 / UT5]] | **RAs**: `RA5 (CE5.a al CE5.e)` | **Tiempo**: `180 min (3 sesiones)` | **Carácter**: `Formativo (No evaluable numéricamente - Afianzamiento previo a examen)`

---

## 🎯 Contexto del Proyecto

Una plataforma de contenidos en streaming almacena las interacciones y visualizaciones de sus usuarios en formato JSON no estructurado. Se requiere implementar un servicio en Java que se conecte a **MongoDB** para almacenar eventos de reproducción, actualizar valoraciones y realizar consultas agregadas de consumo.

---

## 📋 Requerimientos Funcionales y Técnicos

### 1. Inserción de Eventos de Streaming
- Almacenar documentos con esquema flexible en la colección `reproducciones`:
  - `usuario_id`, `pelicula_id`, `titulo`, `duracion_minutos`, `minutos_vistos`, `completada` (`boolean`), `tags` (`array de strings`) y metadatos anidados de dispositivo (`ip`, `sistema_operativo`, `navegador`).

### 2. Consultas y Actualizaciones Específicas
- Localizar todas las sesiones donde `completada` sea `true` y el dispositivo sea `"Android"`.
- Incrementar el contador de visualizaciones y añadir un tag de recomendación mediante operadores atómicos (`$inc`, `$addToSet`).

### 3. Pipeline de Agregación (*Aggregation Pipeline*)
- Implementar una consulta de agregación (`col.aggregate(...)`) que:
  1. Filtre las reproducciones del último mes (`$match`).
  2. Agrupe por `titulo` (`$group`) calculando la suma de `minutos_vistos` y el promedio de valoración.
  3. Ordene los contenidos más populares descendentemente (`$sort`).
  4. Limite a los 5 títulos más vistos (`$limit`).

---

## 📊 Guía de Autoevaluación y Rúbrica Formativa de Competencias (RA5)
> Esta rúbrica permite al alumno comprobar su nivel de dominio técnico antes de la prueba escrita/práctica de evaluación.

| Indicador de Dominio Técnico | Nivel Esperado para el Examen |
| :--- | :--- |
| **CE5.a / CE5.b: Despliegue y Conexión MongoDB** | Conexión robusta mediante URI, gestión adecuada de `MongoClient` y manejo de la colección. |
| **CE5.c: CRUD y Operadores BSON** | Filtros avanzados (`$gte`, `$in`, subdocumentos) y actualizaciones atómicas sin sobrescribir el documento completo. |
| **CE5.d / CE5.e: Pipeline de Agregación** | Pipeline `$match -> $group -> $sort -> $limit` perfectamente estructurado en Java. |
