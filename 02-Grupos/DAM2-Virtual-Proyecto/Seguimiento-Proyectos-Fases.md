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

## 🏷️ 1ª Entrega Parcial: Anteproyecto, Arquitectura y Esquemas (16/12/2026)
> **Contenido**: Idea de negocio, alcance técnico, pila tecnológica, diagramas de arquitectura, modelo E-R/relacional y mockups UI (no requiere prototipo funcional).
> **Fecha oficial de 1ª Evaluación**: **16 de diciembre de 2026**.

```dataview
TABLE alumno as "Alumno/a", fecha_entrega1 as "Fecha Entrega", estado_entrega1 as "Estado", nota_entrega1 as "Nota Diseño"
FROM "02-Grupos/DAM2-Virtual-Proyecto/Alumnos-Proyectos"
WHERE tipo = "proyecto_alumno"
SORT file.name ASC
```

---

## 🏷️ 2ª Entrega Parcial: Proyecto Completo (25/02/2027)
> **Contenido**: Software operativo v1.0, Memoria técnica formal y Vídeo demostrativo. Permite superar el módulo por evaluación continua antes de la convocatoria ordinaria.
> **Fecha oficial de 2ª Evaluación (2º DAM)**: **25 de febrero de 2027**.

```dataview
TABLE alumno as "Alumno/a", estado_entrega2 as "Estado", nota_entrega2 as "Calificación Proyecto"
FROM "02-Grupos/DAM2-Virtual-Proyecto/Alumnos-Proyectos"
WHERE tipo = "proyecto_alumno"
SORT file.name ASC
```

---

## 🔄 Convocatorias Finales Ordinarias (Proyecto Completo: Software + Memoria + Vídeo)
> Para alumnado que no superó el módulo mediante las entregas parciales o precisa recuperar:
> - **1ª Evaluación Final (Ordinaria)**: **27 de mayo de 2027**
> - **2ª Evaluación Final (Ordinaria / Extraordinaria)**: **16 de junio de 2027**

