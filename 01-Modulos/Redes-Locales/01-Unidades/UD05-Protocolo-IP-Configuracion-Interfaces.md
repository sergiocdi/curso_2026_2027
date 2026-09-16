---
tipo: unidad_didactica
modulo: "Redes Locales"
numero_ud: "UD05"
titulo: "UT5: El Protocolo IP. Configuración de Interfaces de Red"
horas_estimadas: 35
ra_asociados: ["RA4"]
trimestre: 2
estado: pendiente_desarrollo
---

# UT5 / UD05: El Protocolo IP. Configuración de Interfaces de Red

> **Módulo**: [[MOC-Redes-Locales|Redes Locales]] | **Horas**: `35 h` | **Trimestre**: `2º` | **RA**: `RA4`

---

## 💡 Justificación y Contexto
El direccionamiento lógico es el corazón del enrutamiento y la conectividad en redes IP. El alumnado dominará la estructura de las direcciones IPv4 (32 bits), clases históricas, máscaras de subred, cálculo de subredes (FLSM y CIDR), direcciones públicas y privadas (RFC 1918), fundamentos de IPv6 (128 bits) y la configuración práctica de interfaces en Windows y Linux (CLI y GUI).

---

## 🧱 Bloques de Contenidos Previstos
- Fundamentos de IPv4: estructura de 32 bits, notación decimal por puntos, parte de red y parte de host.
- Clases de direcciones (A, B, C, D, E) y rangos privados (RFC 1918).
- Máscara de subred y notación CIDR (/24, /25, etc.).
- Cálculo y diseño de subredes: dirección de red, broadcast, primer y último host disponible.
- Configuración estática y dinámica (DHCP) de interfaces de red en sistemas operativos (Windows: `ipconfig`, GUI; Linux: `ip`, `ifconfig`, `netplan`).
- Introducción a IPv6: motivación, formato hexadecimal, abreviaciones y tipos de direcciones (Unicast, Multicast, Anycast, Link-Local).

---

## 🧠 Conceptos Clave
```dataview
TABLE dificultad, estado
FROM "01-Modulos/Redes-Locales/02-Conceptos"
WHERE tipo = "concepto" AND ud = "UD05"
SORT file.name ASC
```

---

## 🛠️ Actividades y Prácticas de Taller
```dataview
TABLE tipo_ejercicio, tiempo_estimado_min
FROM "01-Modulos/Redes-Locales/03-Ejercicios"
WHERE tipo = "ejercicio" AND ud = "UD05"
```

---

## ❓ Banco de Preguntas y Evaluación
```dataview
TABLE dificultad, formato
FROM "01-Modulos/Redes-Locales/04-Banco-Items"
WHERE tipo = "item_evaluacion" AND ud = "UD05"
```
