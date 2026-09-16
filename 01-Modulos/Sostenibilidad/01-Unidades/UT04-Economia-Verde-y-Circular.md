---
tipo: unidad_didactica
modulo: "Sostenibilidad Aplicada al Sistema Productivo"
numero_ud: "UT04"
titulo: "UT4: Economía verde y circular"
horas_estimadas: 5
ra_asociados: ["RA4"]
ce_asociados: ["CE4.a", "CE4.b", "CE4.c", "CE4.d", "CE4.e", "CE4.f"]
trimestre: 2
estado: en_desarrollo
---

# UT4: Economía verde y circular

> **Módulo**: [[MOC-Sostenibilidad|Sostenibilidad Aplicada al Sistema Productivo]] | **Horas**: `5 h` | **Trimestre**: `2º` | **RA**: `RA4` (16,67%)

---

## 💡 Justificación y Reto Inicial
El modelo económico lineal basado en "extraer, fabricar, usar y tirar" ha demostrado ser insostenible. La economía circular propone desacoplar el desarrollo económico del consumo de recursos finitos mediante el ecodiseño, la reutilización, la remanufactura y la optimización de ciclos de vida, tanto en el hardware como en los productos digitales.

**Reto Profesional**: Realizar un análisis de ecodiseño y ciclo de vida de un servicio web, identificando alternativas para reducir el consumo de recursos computacionales y alargar la vida útil de los dispositivos clientes.

---

## 🧱 Bloques de Contenidos Principales
1. **Modelos Económicos**: Comparativa entre modelo lineal extractivo y economía circular regenerativa.
2. **Principios de la Economía Circular**: Preservar capital natural, optimizar rendimientos y promover la eficacia del sistema.
3. **Análisis de Ciclo de Vida (ACV)**: Fases de concepción, diseño, aprovisionamiento, uso y fin de vida (*cradle-to-grave* vs *cradle-to-cradle*).
4. **Ecodiseño de Servicios y Productos Digitales (*Green Software*)**:
   - Principios de la *Green Software Foundation*.
   - Eficiencia en la transferencia de datos (formatos modernos WebP/AVIF, compresión Brotli/Gzip).
   - Minimización de cómputo inútil en backend y frontend.
5. **Criterios de Sostenibilidad en Procesos Productivos y de Software**: Integración continua con pruebas de rendimiento energético.

---

## 🧠 Conceptos Clave
```dataview
TABLE dificultad, estado
FROM "01-Modulos/Sostenibilidad/02-Conceptos"
WHERE tipo = "concepto" AND ud = "UT04"
SORT file.name ASC
```

---

## 💻 Actividades y Retos Prácticos
```dataview
TABLE tipo_actividad, dificultad, tiempo_estimado_min + " min" as "Tiempo"
FROM "01-Modulos/Sostenibilidad/03-Ejercicios"
WHERE tipo = "ejercicio" AND ud = "UT04"
SORT file.name ASC
```

---

## ❓ Preguntas de Evaluación y Test Asociadas
```dataview
TABLE subtipo, dificultad, correcta as "Solución"
FROM "01-Modulos/Sostenibilidad/04-Banco-Items"
WHERE tipo = "item_evaluacion" AND ud = "UT04"
```
