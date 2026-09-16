---
tipo: cuaderno_calificaciones
grupo: "SMR-Presencial-Redes"
modulo: "Redes Locales"
---

# 📊 Cuaderno de Calificaciones: SMR Redes Locales

```dataview
TABLE 
  nombre_completo as "Alumno", 
  estado_matricula as "Matrícula",
  nota_ra1 as "RA1 (15%)", 
  nota_ra2 as "RA2 (20%)", 
  nota_ra3 as "RA3 (25%)", 
  nota_ra4 as "RA4 (25%)", 
  nota_ra5 as "RA5 (15%)",
  round(default(nota_ra1, 0)*0.15 + default(nota_ra2, 0)*0.20 + default(nota_ra3, 0)*0.25 + default(nota_ra4, 0)*0.25 + default(nota_ra5, 0)*0.15, 2) as "Nota Final"
FROM "02-Grupos/SMR-Presencial-Redes/Alumnos"
WHERE tipo = "alumno"
SORT nombre_completo ASC
```
