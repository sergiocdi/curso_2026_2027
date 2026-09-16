---
tipo: unidad_didactica
modulo: "Redes Locales"
numero_ud: "UD02"
titulo: "UT2: Identificación de Elementos y Espacios Físicos de una Red Local"
horas_estimadas: 30
ra_asociados: ["RA1", "RA2"]
trimestre: 1
estado: pendiente_desarrollo
---

# UT2 / UD02: Identificación de Elementos y Espacios Físicos de una Red Local

> **Módulo**: [[MOC-Redes-Locales|Redes Locales]] | **Horas**: `30 h` | **Trimestre**: `1º` | **RA**: `RA1`, `RA2`

---

## 💡 Justificación y Contexto
Esta unidad introduce la infraestructura física del centro o empresa: la normativa de cableado estructurado, espacios de telecomunicaciones (cuartos de telecomunicaciones, salas de equipos, salas de entrada de servicios), armarios de distribución (racks), paneles de parcheo, rosetas (tomas RJ-45) y medios guiados (par trenzado UTP/FTP/STP, fibra óptica).

---

## 🧱 Bloques de Contenidos Previstos
- Subsistemas de cableado estructurado (normas ISO/IEC 11801, ANSI/TIA-568).
- Espacios físicos: sala de equipos, cuartos de telecomunicaciones, canalizaciones y suelo técnico.
- Armarios de comunicaciones (racks de 19 pulgadas, unidades U, guías y ordenadores de cables).
- Paneles de parcheo (*patch panels*), latiguillos y tomas de usuario (rosetas y conectores RJ-45).
- Medios de transmisión guiados: cables de par trenzado (categorías 5e, 6, 6A, blindajes) y fibra óptica (monomodo y multimodo).
- Herramientas de montaje y comprobación: crimpadora, pelacables, crimpadora de impacto (punch down), tester de cableado y certificadores.

---

## 🧠 Conceptos Clave
```dataview
TABLE dificultad, estado
FROM "01-Modulos/Redes-Locales/02-Conceptos"
WHERE tipo = "concepto" AND ud = "UD02"
SORT file.name ASC
```

---

## 🛠️ Actividades y Prácticas de Taller
```dataview
TABLE tipo_ejercicio, tiempo_estimado_min
FROM "01-Modulos/Redes-Locales/03-Ejercicios"
WHERE tipo = "ejercicio" AND ud = "UD02"
```

---

## ❓ Banco de Preguntas y Evaluación
```dataview
TABLE dificultad, formato
FROM "01-Modulos/Redes-Locales/04-Banco-Items"
WHERE tipo = "item_evaluacion" AND ud = "UD02"
```
