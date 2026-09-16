---
tipo: unidad_didactica
modulo: "Sostenibilidad Aplicada al Sistema Productivo"
numero_ud: "UT05"
titulo: "UT5: Actividades sostenibles y medioambiente"
horas_estimadas: 5
ra_asociados: ["RA5"]
ce_asociados: ["CE5.a", "CE5.b", "CE5.c", "CE5.d", "CE5.e", "CE5.f", "CE5.g", "CE5.h", "CE5.i"]
trimestre: 2
estado: en_desarrollo
---

# UT5: Actividades sostenibles y medioambiente

> **Módulo**: [[MOC-Sostenibilidad|Sostenibilidad Aplicada al Sistema Productivo]] | **Horas**: `5 h` | **Trimestre**: `2º` | **RA**: `RA5` (16,67%)

---

## 💡 Justificación y Reto Inicial
El despliegue, almacenamiento y ejecución de soluciones web tiene un impacto material directo en el consumo de electricidad, agua para refrigeración de servidores y generación de residuos de aparatos eléctricos y electrónicos (RAEE). Conocer la normativa ambiental y aplicar herramientas cuantitativas de auditoría de emisiones es clave para cualquier desarrollador actual.

**Reto Profesional**: Auditar el consumo energético y la huella de carbono de un sitio web en producción utilizando herramientas de auditoría digital (*Website Carbon Calculator*, *Ecograder*, *GreenFrame*), proponiendo un paquete técnico de optimización con su base normativa.

---

## 🧱 Bloques de Contenidos Principales
1. **Evaluación de Impacto Ambiental en Actividades Digitales**: Metodología para cuantificar la huella de carbono en aplicaciones web (Alcances 1, 2 y 3).
2. **Herramientas de Auditoría Web Sostenible**: *Website Carbon Calculator*, *Ecograder*, *PageSpeed Insights* aplicado a eficiencia, métricas de gramos de $CO_2$ por visita.
3. **Estrategias en Infraestructuras y Nube**: PUE (*Power Usage Effectiveness*) en CPDs, selección de proveedores cloud con 100% energías renovables, computación elástica y apagado de instancias inactivas.
4. **Residuos de Aparatos Eléctricos y Electrónicos (RAEE / e-waste)**: Gestión de hardware obsoleto, directiva europea RAEE, reacondicionamiento y derecho a reparar.
5. **Normativa Ambiental y Estándares**: Marco regulatorio europeo y autonómico del Principado de Asturias para la eficiencia energética y gestión de residuos.

---

## 🧠 Conceptos Clave
```dataview
TABLE dificultad, estado
FROM "01-Modulos/Sostenibilidad/02-Conceptos"
WHERE tipo = "concepto" AND ud = "UT05"
SORT file.name ASC
```

---

## 💻 Actividades y Retos Prácticos
```dataview
TABLE tipo_actividad, dificultad, tiempo_estimado_min + " min" as "Tiempo"
FROM "01-Modulos/Sostenibilidad/03-Ejercicios"
WHERE tipo = "ejercicio" AND ud = "UT05"
SORT file.name ASC
```

---

## ❓ Preguntas de Evaluación y Test Asociadas
```dataview
TABLE subtipo, dificultad, correcta as "Solución"
FROM "01-Modulos/Sostenibilidad/04-Banco-Items"
WHERE tipo = "item_evaluacion" AND ud = "UT05"
```
