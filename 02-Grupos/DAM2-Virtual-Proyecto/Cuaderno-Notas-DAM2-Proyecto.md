---
tipo: cuaderno_calificaciones
grupo: "DAM2-Virtual-Proyecto"
modulo: "Proyecto Intermodular 2"
---

# 📊 Calificaciones y Rúbricas: DAM2 Virtual - Proyecto

```dataview
TABLE 
  integrantes as "Equipo", 
  nota_fase1 as "Fase 1 (15%)", 
  nota_fase2 as "Fase 2 (25%)", 
  nota_fase3 as "Fase 3 (35%)", 
  nota_fase4 as "Fase 4 (25%)",
  round(default(nota_fase1, 0)*0.15 + default(nota_fase2, 0)*0.25 + default(nota_fase3, 0)*0.35 + default(nota_fase4, 0)*0.25, 2) as "Nota Final"
FROM "02-Grupos/DAM2-Virtual-Proyecto/Alumnos-Proyectos"
WHERE tipo = "proyecto_alumno"
```
