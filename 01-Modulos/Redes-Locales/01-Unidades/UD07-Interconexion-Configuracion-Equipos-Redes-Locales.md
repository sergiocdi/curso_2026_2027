---
tipo: unidad_didactica
modulo: "Redes Locales"
numero_ud: "UD07"
titulo: "UT7: Interconexión y Configuración de Equipos en Redes Locales"
horas_estimadas: 30
ra_asociados: ["RA3", "RA4", "RA5"]
trimestre: 3
estado: pendiente_desarrollo
---

# UT7 / UD07: Interconexión y Configuración de Equipos en Redes Locales

> **Módulo**: [[MOC-Redes-Locales|Redes Locales]] | **Horas**: `30 h` | **Trimestre**: `3º` | **RA**: `RA3`, `RA4`, `RA5`

---

## 💡 Justificación y Contexto
Configuración avanzada de equipos activos de interconexión (switches y routers). Creación y segmentación mediante Redes de Área Local Virtuales (VLANs), enlaces troncales (802.1Q), enrutamiento entre VLANs (Router-on-a-stick), enrutamiento estático básico y puesta en marcha de servicios esenciales de red como DHCP y DNS en la red de área local.

---

## 🧱 Bloques de Contenidos Previstos
- Configuración inicial de switches gestionables (CLI Cisco IOS o interfaces web): nombres, contraseñas, banners, IP de gestión.
- Concepto y ventajas de las VLANs: segmentación por departamento/función, reducción de dominios de broadcast y seguridad.
- Puertos de acceso y puertos troncales (Trunking con IEEE 802.1Q).
- Enrutamiento inter-VLAN: arquitecturas Router-on-a-stick y switches de Capa 3 (Multicapa).
- Enrutamiento estático en routers: rutas directas, rutas estáticas y ruta por defecto (*gateway of last resort*).
- Servicios básicos de infraestructura: Servidor DHCP (pools, exclusiones, concesiones) y Servidor DNS básico (resolución de nombres de host locales).

---

## 🧠 Conceptos Clave
```dataview
TABLE dificultad, estado
FROM "01-Modulos/Redes-Locales/02-Conceptos"
WHERE tipo = "concepto" AND ud = "UD07"
SORT file.name ASC
```

---

## 🛠️ Actividades y Prácticas de Taller
```dataview
TABLE tipo_ejercicio, tiempo_estimado_min
FROM "01-Modulos/Redes-Locales/03-Ejercicios"
WHERE tipo = "ejercicio" AND ud = "UD07"
```

---

## ❓ Banco de Preguntas y Evaluación
```dataview
TABLE dificultad, formato
FROM "01-Modulos/Redes-Locales/04-Banco-Items"
WHERE tipo = "item_evaluacion" AND ud = "UD07"
```
