---
tipo: cuaderno_calificaciones
grupo: "DAM2-Virtual-AD"
modulo: "Acceso a Datos"
---

# 📊 Cuaderno de Calificaciones: DAM2 Virtual (Acceso a Datos)

> **Criterio de Evaluación Oficial**: 100% Pruebas Prácticas Presenciales en CIFP Avilés.  
> **Estructura**: Dos Parciales Liberatorios ($\ge 5.0$). Quien no supere un parcial acude a las Convocatorias Finales Ordinarias (1ª y 2ª) a recuperar exclusivamente la parte pendiente. En la 3ª evaluación el alumnado realiza la FCT.

---

### 📝 1ª Evaluación · 1ª Prueba Parcial Presencial (60% del Módulo)
*Bloque 1: Ficheros, JDBC y ORM Hibernate (RA1 15% + RA2 20% + RA3 25% = 60%)*

```dataview
TABLE 
  nombre_completo as "Alumno", 
  default(nota_ra1, "-") as "RA1 Ficheros (15%)", 
  default(nota_ra2, "-") as "RA2 JDBC (20%)", 
  default(nota_ra3, "-") as "RA3 ORM (25%)", 
  choice(nota_ra1 != null and nota_ra2 != null and nota_ra3 != null, 
    round((nota_ra1 * 0.15 + nota_ra2 * 0.20 + nota_ra3 * 0.25) / 0.60, 2), 
    "-") as "Nota Parcial 1 (sobre 10)",
  choice(nota_ra1 != null and nota_ra2 != null and nota_ra3 != null,
    choice((nota_ra1 * 0.15 + nota_ra2 * 0.20 + nota_ra3 * 0.25) / 0.60 >= 5.0, "✅ LIBERADO", "❌ PENDIENTE"),
    "⏳ Pendiente") as "Estado"
FROM "02-Grupos/DAM2-Virtual-AD/Alumnos"
WHERE tipo = "alumno"
SORT nombre_completo ASC
```

---

### 📝 2ª Evaluación · 2ª Prueba Parcial Presencial (40% del Módulo)
*Bloque 2: BDOO/XML, NoSQL MongoDB y Componentes (RA4 10% + RA5 20% + RA6 10% = 40%)*

```dataview
TABLE 
  nombre_completo as "Alumno", 
  default(nota_ra4, "-") as "RA4 BDOO/XML (10%)", 
  default(nota_ra5, "-") as "RA5 NoSQL (20%)", 
  default(nota_ra6, "-") as "RA6 Componentes (10%)", 
  choice(nota_ra4 != null and nota_ra5 != null and nota_ra6 != null, 
    round((nota_ra4 * 0.10 + nota_ra5 * 0.20 + nota_ra6 * 0.10) / 0.40, 2), 
    "-") as "Nota Parcial 2 (sobre 10)",
  choice(nota_ra4 != null and nota_ra5 != null and nota_ra6 != null,
    choice((nota_ra4 * 0.10 + nota_ra5 * 0.20 + nota_ra6 * 0.10) / 0.40 >= 5.0, "✅ LIBERADO", "❌ PENDIENTE"),
    "⏳ Pendiente") as "Estado"
FROM "02-Grupos/DAM2-Virtual-AD/Alumnos"
WHERE tipo = "alumno"
SORT nombre_completo ASC
```

---

### 🎓 Calificación Final y Convocatorias Ordinarias

```dataview
TABLE 
  nombre_completo as "Alumno",
  choice(nota_ra1 != null and nota_ra2 != null and nota_ra3 != null, 
    round((nota_ra1 * 0.15 + nota_ra2 * 0.20 + nota_ra3 * 0.25) / 0.60, 2), "-") as "Parcial 1 (60%)",
  choice(nota_ra4 != null and nota_ra5 != null and nota_ra6 != null, 
    round((nota_ra4 * 0.10 + nota_ra5 * 0.20 + nota_ra6 * 0.10) / 0.40, 2), "-") as "Parcial 2 (40%)",
  default(recup_parcial1, "-") as "Recup. P1 (Ord.)",
  default(recup_parcial2, "-") as "Recup. P2 (Ord.)",
  choice(nota_final != null, nota_final,
    choice(nota_ra1 != null and nota_ra2 != null and nota_ra3 != null and nota_ra4 != null and nota_ra5 != null and nota_ra6 != null,
      round(nota_ra1*0.15 + nota_ra2*0.20 + nota_ra3*0.25 + nota_ra4*0.10 + nota_ra5*0.20 + nota_ra6*0.10, 2),
      "-")) as "Nota Final Módulo",
  choice(nota_final >= 5.0 or (nota_ra1 != null and nota_ra2 != null and nota_ra3 != null and nota_ra4 != null and nota_ra5 != null and nota_ra6 != null and (nota_ra1*0.15 + nota_ra2*0.20 + nota_ra3*0.25 + nota_ra4*0.10 + nota_ra5*0.20 + nota_ra6*0.10) >= 5.0),
    "🎉 SUPERADO", "⏳ En curso / Pendiente") as "Resolución"
FROM "02-Grupos/DAM2-Virtual-AD/Alumnos"
WHERE tipo = "alumno"
SORT nombre_completo ASC
```
