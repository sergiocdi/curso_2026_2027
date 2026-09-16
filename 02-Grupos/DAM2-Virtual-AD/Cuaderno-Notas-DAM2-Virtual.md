---
tipo: cuaderno_calificaciones
grupo: "DAM2-Virtual-AD"
modulo: "Acceso a Datos"
---

# 📊 Cuaderno de Calificaciones: DAM2 Virtual

> Calificaciones de tareas en plataforma Moodle y pruebas presenciales de validación.

```dataview
TABLE 
  nombre_completo as "Alumno", 
  nota_ra1 as "RA1 (15%)", 
  nota_ra2 as "RA2 (20%)", 
  nota_ra3 as "RA3 (25%)", 
  round(default(nota_ra1, 0)*0.15 + default(nota_ra2, 0)*0.20 + default(nota_ra3, 0)*0.25, 2) as "Media Progresiva"
FROM "02-Grupos/DAM2-Virtual-AD/Alumnos"
WHERE tipo = "alumno"
SORT nombre_completo ASC
```
