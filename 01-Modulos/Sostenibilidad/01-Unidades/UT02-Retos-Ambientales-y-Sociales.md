---
tipo: unidad_didactica
modulo: "Sostenibilidad Aplicada al Sistema Productivo"
numero_ud: "UT02"
titulo: "UT2: Retos ambientales y sociales"
horas_estimadas: 5
ra_asociados: ["RA2"]
ce_asociados: ["CE2.a", "CE2.b", "CE2.c", "CE2.d", "CE2.e"]
trimestre: 1
estado: en_desarrollo
---

# UT2: Retos ambientales y sociales

> **Módulo**: [[MOC-Sostenibilidad|Sostenibilidad Aplicada al Sistema Productivo]] | **Horas**: `5 h` | **Trimestre**: `1º` | **RA**: `RA2` (16,67%)

---

## 💡 Justificación y Reto Inicial
El modelo de producción industrial y el consumo masivo han conducido a la emergencia climática actual. Comprender los límites biofísicos del planeta y los impactos sociales de la globalización y la tecnología permite proponer soluciones reales de descarbonización y mitigación desde el sector productivo.

**Reto Profesional**: Investigar el impacto de la brecha digital y la extracción de tierras raras para hardware tecnológico, proponiendo medidas de mitigación y alianzas de cooperación.

---

## 🧱 Bloques de Contenidos Principales
1. **Límites Planetarios y Emergencia Climática**: Huella ecológica, estrés hídrico y pérdida de biodiversidad.
2. **Relación entre Actividad Económica y Cambio Climático**: Fuentes de emisiones antropogénicas (Alcances 1, 2 y 3).
3. **Impacto Social de la Transformación Digital**: Brecha digital generacional y territorial, precarización y condiciones en la cadena de suministros tecnológicos.
4. **Impacto en Sectores Productivos**: Vulnerabilidad de infraestructuras críticas e impacto en centros de datos por estrés térmico.
5. **Medidas de Mitigación y Resiliencia**: Planes de descarbonización, eficiencia energética y alianzas multisectoriales (ODS 17).

---

## 🧠 Conceptos Clave
```dataview
TABLE dificultad, estado
FROM "01-Modulos/Sostenibilidad/02-Conceptos"
WHERE tipo = "concepto" AND ud = "UT02"
SORT file.name ASC
```

---

## 💻 Actividades y Retos Prácticos
```dataview
TABLE tipo_actividad, dificultad, tiempo_estimado_min + " min" as "Tiempo"
FROM "01-Modulos/Sostenibilidad/03-Ejercicios"
WHERE tipo = "ejercicio" AND ud = "UT02"
SORT file.name ASC
```

---

## ❓ Preguntas de Evaluación y Test Asociadas
```dataview
TABLE subtipo, dificultad, correcta as "Solución"
FROM "01-Modulos/Sostenibilidad/04-Banco-Items"
WHERE tipo = "item_evaluacion" AND ud = "UT02"
```
