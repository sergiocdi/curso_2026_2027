---
tipo: unidad_didactica
modulo: "Redes Locales"
numero_ud: "UD03"
titulo: "UT3: Arquitecturas de Redes. Modelos de Referencia"
horas_estimadas: 20
ra_asociados: ["RA1"]
trimestre: 1
estado: pendiente_desarrollo
---

# UT3 / UD03: Arquitecturas de Redes. Modelos de Referencia

> **Módulo**: [[MOC-Redes-Locales|Redes Locales]] | **Horas**: `20 h` | **Trimestre**: `1º` | **RA**: `RA1`

---

## 💡 Justificación y Contexto
Comprensión de la arquitectura por capas que hace posible la interoperabilidad de redes heterogéneas. Estudio riguroso del Modelo OSI de 7 capas y de la pila TCP/IP de 4 capas, analizando los procesos de encapsulamiento, desencapsulamiento y las unidades de datos de protocolo (PDU).

---

## 🧱 Bloques de Contenidos Previstos
- Concepto de arquitectura por capas, protocolos, interfaces y servicios.
- El modelo de referencia OSI (7 niveles): funciones de cada capa.
- La pila de protocolos de Internet TCP/IP (4 niveles).
- Correspondencia y comparación entre el Modelo OSI y la arquitectura TCP/IP.
- Unidades de datos de protocolo (PDU): Datos, Segmento, Paquete, Trama, Bits.
- Proceso de encapsulamiento y desencapsulamiento en la transmisión extremo a extremo.

---

## 🧠 Conceptos Clave
```dataview
TABLE dificultad, estado
FROM "01-Modulos/Redes-Locales/02-Conceptos"
WHERE tipo = "concepto" AND ud = "UD03"
SORT file.name ASC
```

---

## 🛠️ Actividades y Prácticas de Taller
```dataview
TABLE tipo_ejercicio, tiempo_estimado_min
FROM "01-Modulos/Redes-Locales/03-Ejercicios"
WHERE tipo = "ejercicio" AND ud = "UD03"
```

---

## ❓ Banco de Preguntas y Evaluación
```dataview
TABLE dificultad, formato
FROM "01-Modulos/Redes-Locales/04-Banco-Items"
WHERE tipo = "item_evaluacion" AND ud = "UD03"
```
