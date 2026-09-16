---
tipo: cuaderno_calificaciones
grupo: "DAM2-Presencial-AD"
modulo: "Acceso a Datos"
actualizado: 2026-09-15
---

# 📊 Cuaderno de Calificaciones: DAM2 Presencial

> **Criterios de Calificación**: Ver [[07-Evaluacion-Instrumentos-y-Calificacion|Ponderaciones y Criterios Oficiales]]

---

## 📈 Vista General por Resultados de Aprendizaje

```dataview
TABLE 
  nombre_completo as "Alumno", 
  nota_ra1 as "RA1 (15%)", 
  nota_ra2 as "RA2 (20%)", 
  nota_ra3 as "RA3 (25%)", 
  nota_ra4 as "RA4 (10%)", 
  nota_ra5 as "RA5 (20%)", 
  nota_ra6 as "RA6 (10%)",
  round(default(nota_ra1, 0)*0.15 + default(nota_ra2, 0)*0.20 + default(nota_ra3, 0)*0.25 + default(nota_ra4, 0)*0.10 + default(nota_ra5, 0)*0.20 + default(nota_ra6, 0)*0.10, 2) as "Nota Final"
FROM "02-Grupos/DAM2-Presencial-AD/Alumnos"
WHERE tipo = "alumno"
SORT nombre_completo ASC
```

---

## 📝 Registro de Entregas y Tareas Parciales (1ª Evaluación)

| Alumno | [[PRAC-AD-Evaluacion-Inicial\|Eval. Inicial]] | [[EJ-AD-01-Analizador-Logs-Servidor\|Práctica UD01]] | Test UD01 | [[EJ-AD-02-CRUD-Consola-JDBC\|Práctica UD02]] | Examen Práctico |
| :--- | :---: | :---: | :---: | :---: | :---: |
| [[Alonso_Presumido_Dario\|Alonso Presumido, Darío]] | - | - | - | - | - |
| [[Alvarez_de_Ves_Guillermo\|Álvarez de Ves, Guillermo]] | - | - | - | - | - |
| [[Barrena_Salvador_Alejandro_Miguel\|Barrena Salvador, Alejandro Miguel]] | - | - | - | - | - |
| [[Belda_Garcia_Xose_Miguel\|Belda García, Xose Miguel]] | - | - | - | - | - |
| [[Canton_Casado_Ruben\|Cantón Casado, Rubén]] | - | - | - | - | - |
| [[Casanova_Perez_Angel\|Casanova Pérez, Ángel]] | - | - | - | - | - |
| [[Charro_Estrada_Sergio\|Charro Estrada, Sergio]] | - | - | - | - | - |
| [[Diaz_Padilla_Pablo\|Díaz Padilla, Pablo]] | - | - | - | - | - |
| [[El_Makki_Belahsane_Mohamed\|El Makki Belahsane, Mohamed]] | - | - | - | - | - |
| [[Fernandez_Delgado_Izan\|Fernández Delgado, Izan]] | - | - | - | - | - |
| [[Fernandez_Menendez_Marcos\|Fernández Menéndez, Marcos]] | - | - | - | - | - |
| [[Fernandez_Ramos_Sara\|Fernández Ramos, Sara]] | - | - | - | - | - |
| [[Freite_Alviz_Daniel_Enrique\|Freite Álviz, Daniel Enrique]] | - | - | - | - | - |
| [[Garcia_Cabrera_Adrian\|García Cabrera, Adrián]] | - | - | - | - | - |
| [[Garcia_Salgado_Adrian\|García Salgado, Adrián]] | - | - | - | - | - |
| [[Gutierrez_Castellano_Belen\|Gutiérrez Castellano, Belén]] | - | - | - | - | - |
| [[Gutierrez_Lugilde_Elsa\|Gutiérrez Lugilde, Elsa]] | - | - | - | - | - |
| [[Hura_Maksym\|Hura, Maksym]] | - | - | - | - | - |
| [[Lopez_Revilla_Illan\|López Revilla, Illán]] | - | - | - | - | - |
| [[Martinez_Rodriguez_Felix\|Martínez Rodríguez, Félix]] | - | - | - | - | - |
| [[Mendez_Menendez_Jorge\|Méndez Menéndez, Jorge]] | - | - | - | - | - |
| [[Mojardin_Prado_Omar\|Mojardín Prado, Omar]] | - | - | - | - | - |
| [[Molano_Diaz_Izam\|Molano Díaz, Izam]] | - | - | - | - | - |
| [[Monteserin_Antonio_Juan\|Monteserín Antonio, Juan]] | - | - | - | - | - |
| [[Muniz_Gonzalez_Dario\|Muñiz González, Darío]] | - | - | - | - | - |
| [[Riveros_Dominguez_Denilson_Donato\|Riveros Domínguez, Denilson Donato]] | - | - | - | - | - |
| [[Sanchez_Martin_Dario\|Sánchez Martín, Darío]] | - | - | - | - | - |
| [[Sobrido_Puente_Hugo\|Sobrido Puente, Hugo]] | - | - | - | - | - |

*(Haz clic en el enlace wiki de cualquier alumno para acceder a su ficha individual, adaptaciones DUA o desglose detallado de feedback).*
