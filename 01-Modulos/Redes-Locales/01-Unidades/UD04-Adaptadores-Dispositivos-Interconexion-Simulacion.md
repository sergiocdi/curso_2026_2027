---
tipo: unidad_didactica
modulo: "Redes Locales"
numero_ud: "UD04"
titulo: "UT4: Adaptadores y Dispositivos de Interconexión de Red. Herramientas de Simulación de Redes"
horas_estimadas: 25
ra_asociados: ["RA1", "RA3"]
trimestre: 1
estado: pendiente_desarrollo
---

# UT4 / UD04: Adaptadores y Dispositivos de Interconexión de Red. Herramientas de Simulación de Redes

> **Módulo**: [[MOC-Redes-Locales|Redes Locales]] | **Horas**: `25 h` | **Trimestre**: `1º` | **RA**: `RA1`, `RA3`

---

## 💡 Justificación y Contexto
Estudio y manipulación de las tarjetas de red (NIC) y los dispositivos que permiten interconectar nodos en una red local: repetidores, concentradores (hubs), puentes (bridges), conmutadores (switches) y encaminadores (routers). Introducción a entornos de simulación y emulación (Cisco Packet Tracer) para diseñar y validar topologías de red virtuales.

---

## 🧱 Bloques de Contenidos Previstos
- Adaptadores de red (NICs): tipos, interfaces físicas (PCIe, USB), dirección física MAC (EUI-48).
- Dispositivos de interconexión por niveles OSI:
  - Nivel 1: Repetidores y Concentradores (Hubs). Dominios de colisión.
  - Nivel 2: Puentes (Bridges) y Conmutadores (Switches). Tabla CAM (MAC address table), reenvío y filtrado.
  - Nivel 3: Enrutadores (Routers). Dominios de difusión (broadcast).
- Introducción a Cisco Packet Tracer: interfaz, modos de trabajo (Realtime y Simulation), dispositivos disponibles, cableado virtual y prueba de conectividad con PDU simples (ping).

---

## 🧠 Conceptos Clave
```dataview
TABLE dificultad, estado
FROM "01-Modulos/Redes-Locales/02-Conceptos"
WHERE tipo = "concepto" AND ud = "UD04"
SORT file.name ASC
```

---

## 🛠️ Actividades y Prácticas de Taller
```dataview
TABLE tipo_ejercicio, tiempo_estimado_min
FROM "01-Modulos/Redes-Locales/03-Ejercicios"
WHERE tipo = "ejercicio" AND ud = "UD04"
```

---

## ❓ Banco de Preguntas y Evaluación
```dataview
TABLE dificultad, formato
FROM "01-Modulos/Redes-Locales/04-Banco-Items"
WHERE tipo = "item_evaluacion" AND ud = "UD04"
```
