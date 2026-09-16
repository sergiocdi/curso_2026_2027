---
tipo: unidad_didactica
modulo: "Sostenibilidad Aplicada al Sistema Productivo"
numero_ud: "UT01"
titulo: "UT1: La sostenibilidad en las organizaciones empresariales"
horas_estimadas: 5
ra_asociados: ["RA1"]
ce_asociados: ["CE1.a", "CE1.b", "CE1.c", "CE1.d", "CE1.e", "CE1.f"]
trimestre: 1
estado: en_desarrollo
---

# UT1: La sostenibilidad en las organizaciones empresariales

> **Módulo**: [[MOC-Sostenibilidad|Sostenibilidad Aplicada al Sistema Productivo]] | **Horas**: `5 h` | **Trimestre**: `1º` | **RA**: `RA1` (16,67%)

---

## 💡 Justificación y Reto Inicial
Las organizaciones actuales no pueden limitar su rendimiento al balance económico tradicional. La integración de los factores ambientales, sociales y de buen gobierno (ASG / ESG) es un requisito legal, de competitividad y de atracción de talento e inversiones, especialmente relevante en las corporaciones tecnológicas y de desarrollo de software.

**Reto Profesional**: Analizar la memoria de sostenibilidad de una compañía tecnológica y determinar sus grupos de interés (*stakeholders*), identificando riesgos y oportunidades ASG.

---

## 🧱 Bloques de Contenidos Principales
1. **Concepto de Desarrollo Sostenible**: Evolución histórica, límites planetarios y la triple hélice (Planeta, Personas, Gobernanza).
2. **Marcos Internacionales y Regulatorios**: Pacto Mundial de la ONU, Acuerdo de París y la Directiva Europea CSRD (*Corporate Sustainability Due Diligence*).
3. **Factores ASG (Ambiental, Social y Gobernanza)** en el ámbito corporativo y tecnológico.
4. **Grupos de Interés (*Stakeholders*)**: Mapeo, expectativas, riesgos y oportunidades organizativas.
5. **Estándares y Métricas de Sostenibilidad**: Estándares GRI (*Global Reporting Initiative*), SASB e indicadores cuantitativos.
6. **Inversión Socialmente Responsable (ISR)**: Índices de sostenibilidad (DJSI), fondos ESG y requisitos de financiación verde.

---

## 🧠 Conceptos Clave
```dataview
TABLE dificultad, estado
FROM "01-Modulos/Sostenibilidad/02-Conceptos"
WHERE tipo = "concepto" AND ud = "UT01"
SORT file.name ASC
```

---

## 💻 Actividades y Retos Prácticos
```dataview
TABLE tipo_actividad, dificultad, tiempo_estimado_min + " min" as "Tiempo"
FROM "01-Modulos/Sostenibilidad/03-Ejercicios"
WHERE tipo = "ejercicio" AND ud = "UT01"
SORT file.name ASC
```

---

## ❓ Preguntas de Evaluación y Test Asociadas
```dataview
TABLE subtipo, dificultad, correcta as "Solución"
FROM "01-Modulos/Sostenibilidad/04-Banco-Items"
WHERE tipo = "item_evaluacion" AND ud = "UT01"
```
