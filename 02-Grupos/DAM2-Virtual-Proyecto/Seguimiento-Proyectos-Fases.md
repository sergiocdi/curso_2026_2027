---
tipo: seguimiento_fases
grupo: "DAM2-Virtual-Proyecto"
modulo: "Proyecto Intermodular 2"
individual: true
---

# 📌 Seguimiento de Entregas: Proyectos Intermodulares (DAM2 Virtual)

> **Régimen**: Estrictamente individual.
> **Docencia**: 1 clase semanal síncrona por Microsoft Teams.

---

## 🏷️ Entrega 1: Intermedia - Anteproyecto y Prototipo MVP (Enero/Febrero)
```dataview
TABLE alumno as "Alumno/a", fecha_entrega1 as "Fecha Entrega", estado_entrega1 as "Estado", nota_entrega1 as "Nota MVP"
FROM "02-Grupos/DAM2-Virtual-Proyecto/Alumnos-Proyectos"
WHERE tipo = "proyecto_alumno"
SORT file.name ASC
```

---

## 🏷️ Entrega 2: Final - Software v1.0, Memoria y Vídeo (Marzo Ordinaria / Junio Extraordinaria)
```dataview
TABLE alumno as "Alumno/a", estado_entrega2 as "Estado", nota_entrega2 as "Calificación Final"
FROM "02-Grupos/DAM2-Virtual-Proyecto/Alumnos-Proyectos"
WHERE tipo = "proyecto_alumno"
SORT file.name ASC
```
