---
tipo: unidad_didactica
modulo: "Redes Locales"
numero_ud: "UD06"
titulo: "UT6: Redes Inalámbricas y Redes Mixtas"
horas_estimadas: 25
ra_asociados: ["RA3"]
trimestre: 2
estado: pendiente_desarrollo
---

# UT6 / UD06: Redes Inalámbricas y Redes Mixtas

> **Módulo**: [[MOC-Redes-Locales|Redes Locales]] | **Horas**: `25 h` | **Trimestre**: `2º` | **RA**: `RA3`

---

## 💡 Justificación y Contexto
Despliegue e integración de redes inalámbricas WLAN basadas en el estándar IEEE 802.11 con infraestructuras cableadas Ethernet. Se estudian bandas de frecuencia, canales, modos de operación, métodos de autenticación y cifrado (WPA2/WPA3 Personal y Enterprise) y configuración de Puntos de Acceso (AP).

---

## 🧱 Bloques de Contenidos Previstos
- Fundamentos de transmisión por radiofrecuencia (RF) e infrarrojos.
- Estándares IEEE 802.11 (b/g/n/ac/ax - Wi-Fi 6).
- Bandas de frecuencia (2.4 GHz, 5 GHz, 6 GHz) y asignación de canales no solapados.
- Topologías y modos de funcionamiento: Ad-hoc (IBSS) e Infraestructura (BSS, ESS).
- Dispositivos inalámbricos: tarjetas Wi-Fi, puntos de acceso (AP), routers inalámbricos domésticos y repetidores/extensores.
- Parámetros de configuración: SSID, difusión de SSID, aislamiento de clientes.
- Seguridad inalámbrica: mecanismos obsoletos (WEP, WPA), WPA2 (PSK y 802.1X/Enterprise), WPA3, filtrado MAC.
- Redes mixtas: integración física y lógica de segmentos cableados y segmentos Wi-Fi.

---

## 🧠 Conceptos Clave
```dataview
TABLE dificultad, estado
FROM "01-Modulos/Redes-Locales/02-Conceptos"
WHERE tipo = "concepto" AND ud = "UD06"
SORT file.name ASC
```

---

## 🛠️ Actividades y Prácticas de Taller
```dataview
TABLE tipo_ejercicio, tiempo_estimado_min
FROM "01-Modulos/Redes-Locales/03-Ejercicios"
WHERE tipo = "ejercicio" AND ud = "UD06"
```

---

## ❓ Banco de Preguntas y Evaluación
```dataview
TABLE dificultad, formato
FROM "01-Modulos/Redes-Locales/04-Banco-Items"
WHERE tipo = "item_evaluacion" AND ud = "UD06"
```
