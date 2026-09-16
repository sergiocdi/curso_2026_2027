---
tipo: cuaderno_calificaciones
grupo: "DAW1-Virtual-Sostenibilidad"
modulo: "Sostenibilidad"
---

# 📊 Calificaciones: DAW1 Virtual - Sostenibilidad

```dataview
TABLE 
  nombre_completo as "Alumno", 
  nota_ra1 as "RA1 (16.7%)", 
  nota_ra2 as "RA2 (16.7%)", 
  nota_ra3 as "RA3 (16.7%)", 
  nota_ra4 as "RA4 (16.7%)",
  nota_ra5 as "RA5 (16.7%)",
  nota_ra6 as "RA6 (16.7%)",
  round((default(nota_ra1, 0) + default(nota_ra2, 0) + default(nota_ra3, 0) + default(nota_ra4, 0) + default(nota_ra5, 0) + default(nota_ra6, 0)) / 6, 2) as "Nota Final"
FROM "02-Grupos/DAW1-Virtual-Sostenibilidad/Alumnos"
WHERE tipo = "alumno"
```
