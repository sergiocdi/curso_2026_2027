---
tipo: unidad_didactica
modulo: "Sostenibilidad Aplicada al Sistema Productivo"
numero_ud: "UT06"
titulo: "UT6: El plan de sostenibilidad"
horas_estimadas: 5
ra_asociados: ["RA6"]
ce_asociados: ["CE6.a", "CE6.b", "CE6.c", "CE6.d", "CE6.e"]
trimestre: 2
estado: en_desarrollo
---

# UT6: El plan de sostenibilidad

> **Módulo**: [[MOC-Sostenibilidad|Sostenibilidad Aplicada al Sistema Productivo]] | **Horas**: `5 h` | **Trimestre**: `2º` | **RA**: `RA6` (16,67%)

---

## 💡 Justificación y Reto Inicial
El plan de sostenibilidad corporativo sintetiza el compromiso de una empresa con su entorno y sus grupos de interés. Aprender a definir la matriz de materialidad, establecer indicadores clave de desempeño (KPIs) y redactar informes de sostenibilidad rigurosos evita el *greenwashing* y sitúa a la empresa a la vanguardia competitiva del sector IT.

**Reto Profesional**: Redactar el Plan de Sostenibilidad de una empresa de servicios de software web, definiendo su matriz de materialidad ASG, sus indicadores clave (KPI) y el informe final ejecutivo.

---

## 🧱 Bloques de Contenidos Principales
1. **Identificación y Consulta a Grupos de Interés**: Canales de diálogo, expectativas y priorización de intereses de clientes, equipo técnico e inversores.
2. **Matriz de Doble Materialidad**: Evaluación del impacto de la empresa en el entorno y de los riesgos ambientales/sociales en el modelo de negocio tecnológico.
3. **Definición del Plan de Acción Sostenible**: Acciones correctoras, metas cuantitativas, plazos y asignación de responsabilidades.
4. **Métricas e Indicadores de Sostenibilidad (KPI)**: Emisiones por usuario activo, consumo por petición HTTP, porcentaje de energía verde contratada, paridad e inclusión en equipos.
5. **Elaboración del Informe de Sostenibilidad**: Estructura según directiva CSRD/GRI, comunicación transparente y verificación de datos.

---

## 🧠 Conceptos Clave
```dataview
TABLE dificultad, estado
FROM "01-Modulos/Sostenibilidad/02-Conceptos"
WHERE tipo = "concepto" AND ud = "UT06"
SORT file.name ASC
```

---

## 💻 Actividades y Retos Prácticos
```dataview
TABLE tipo_actividad, dificultad, tiempo_estimado_min + " min" as "Tiempo"
FROM "01-Modulos/Sostenibilidad/03-Ejercicios"
WHERE tipo = "ejercicio" AND ud = "UT06"
SORT file.name ASC
```

---

## ❓ Preguntas de Evaluación y Test Asociadas
```dataview
TABLE subtipo, dificultad, correcta as "Solución"
FROM "01-Modulos/Sostenibilidad/04-Banco-Items"
WHERE tipo = "item_evaluacion" AND ud = "UT06"
```
