---
tipo: ra
modulo: "Acceso a Datos"
codigo: "RA2"
peso_porcentaje: 20
descripcion: "Desarrolla aplicaciones que gestionan información almacenada en bases de datos relacionales identificando el campo de aplicación de los mismos y utilizando conectores específicos."
---

# RA2: Acceso a Bases de Datos Relacionales mediante Conectores (JDBC)

> **Enunciado Oficial**: Desarrolla aplicaciones que gestionan información almacenada en bases de datos relacionales identificando el campo de aplicación de los mismos y utilizando conectores específicos.  
> **Ponderación en el Módulo**: **20%**

---

## 🎯 Criterios de Evaluación Oficiales

| Código | Criterio de Evaluación | Ponderación en RA | Instrumento |
| :---: | :--- | :---: | :--- |
| **CE2.a** | Se ha establecido la conexión con el motor de base de datos utilizando el driver y parámetros adecuados. | 15% | Práctica de aula |
| **CE2.b** | Se han ejecutado consultas y sentencias DML utilizando sentencias parametrizadas (`PreparedStatement`). | 30% | Práctica evaluable |
| **CE2.c** | Se han recuperado y procesado conjuntos de resultados gestionando cursores y metadatos (`ResultSetMetaData`). | 20% | Ejercicio guiado |
| **CE2.d** | Se han gestionado transacciones asegurando propiedades ACID y puntos de restauración (`Savepoint`). | 25% | Examen práctico |
| **CE2.e** | Se han configurado pools de conexiones analizando su impacto en el rendimiento. | 10% | Reto / Proyecto |

---

## 📦 Unidades Didácticas Asociadas
- [[UD02-Conectores-BBDD-Relacionales]]

---

## 📝 Banco de Preguntas y Ejercicios Vinculados
```dataview
TABLE tipo as "Tipo", subtipo as "Subtipo", dificultad as "Dificultad", file.name as "Ficha"
FROM "01-Modulos/Acceso-a-Datos"
WHERE contains(ra_asociados, "RA2")
```
