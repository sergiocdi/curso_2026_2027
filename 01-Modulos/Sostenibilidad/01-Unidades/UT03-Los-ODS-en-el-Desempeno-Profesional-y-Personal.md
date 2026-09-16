---
tipo: unidad_didactica
modulo: "Sostenibilidad Aplicada al Sistema Productivo"
numero_ud: "UT03"
titulo: "UT3: Los ODS en el desempeño profesional y personal"
horas_estimadas: 5
ra_asociados: ["RA3"]
ce_asociados: ["CE3.a", "CE3.b", "CE3.c"]
trimestre: 1
estado: en_desarrollo
---

# UT3: Los ODS en el desempeño profesional y personal

> **Módulo**: [[MOC-Sostenibilidad|Sostenibilidad Aplicada al Sistema Productivo]] | **Horas**: `5 h` | **Trimestre**: `1º` | **RA**: `RA3` (16,67%)

---

## 💡 Justificación y Reto Inicial
La Agenda 2030 interpela directamente tanto a los profesionales individuales como a las decisiones cotidianas en el entorno personal y laboral. Para un desarrollador de software y aplicaciones web, alinear su práctica con los ODS representa una ventaja competitiva y un deber ético hacia la sociedad.

**Reto Profesional**: Diseñar un plan de acción personal y profesional alineado con metas específicas de los ODS aplicables a un desarrollador web (accesibilidad, consumo energético, reducción de residuos digitales).

---

## 🧱 Bloques de Contenidos Principales
1. **La Agenda 2030 de la ONU**: Estructura, 17 ODS y metas clave.
2. **ODS Clave para el Sector Tecnológico y Digital**:
   - ODS 7: Energía asequible y no contaminante (eficiencia energética).
   - ODS 8: Trabajo decente y crecimiento económico (ergonomía, desconexión digital).
   - ODS 9: Industria, innovación e infraestructura (digitalización sostenible).
   - ODS 12: Producción y consumo responsables (software eficiente, e-waste).
   - ODS 13: Acción por el clima (reducción de emisiones de servicios digitales).
3. **Riesgos y Oportunidades Profesionales**: Nuevos perfiles de *Green IT*, directivas de sostenibilidad y reputación profesional.
4. **Plan de Acción Profesional y Personal**: Hábitos sostenibles en el puesto de trabajo remoto/presencial, gestión de correo y almacenamiento en la nube (*digital decluttering*).

---

## 🧠 Conceptos Clave
```dataview
TABLE dificultad, estado
FROM "01-Modulos/Sostenibilidad/02-Conceptos"
WHERE tipo = "concepto" AND ud = "UT03"
SORT file.name ASC
```

---

## 💻 Actividades y Retos Prácticos
```dataview
TABLE tipo_actividad, dificultad, tiempo_estimado_min + " min" as "Tiempo"
FROM "01-Modulos/Sostenibilidad/03-Ejercicios"
WHERE tipo = "ejercicio" AND ud = "UT03"
SORT file.name ASC
```

---

## ❓ Preguntas de Evaluación y Test Asociadas
```dataview
TABLE subtipo, dificultad, correcta as "Solución"
FROM "01-Modulos/Sostenibilidad/04-Banco-Items"
WHERE tipo = "item_evaluacion" AND ud = "UT03"
```
