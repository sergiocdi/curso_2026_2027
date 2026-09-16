---
tipo: unidad_didactica
modulo: "Redes Locales"
numero_ud: "UD08"
titulo: "UT8: Mantenimiento de una Red Local y Resolución de Incidencias"
horas_estimadas: 20
ra_asociados: ["RA5"]
trimestre: 3
estado: pendiente_desarrollo
---

# UT8 / UD08: Mantenimiento de una Red Local y Resolución de Incidencias

> **Módulo**: [[MOC-Redes-Locales|Redes Locales]] | **Horas**: `20 h` | **Trimestre**: `3º` | **RA**: `RA5`

---

## 💡 Justificación y Contexto
Operación cotidiana, diagnóstico metódico y mantenimiento preventivo y correctivo de una red de comunicaciones. El alumnado aprenderá la metodología sistemática de *troubleshooting* (top-down, bottom-up, divide and conquer), el uso de comandos de diagnóstico de red (`ping`, `traceroute`, `pathping`, `netstat`, `arp`, `nslookup`), analizadores de paquetes (Wireshark) y buenas prácticas de documentación, etiquetado e inventario.

---

## 🧱 Bloques de Contenidos Previstos
- Metodología de resolución de problemas en redes: modelos estructurados de diagnóstico.
- Diagnóstico en el nivel físico y enlace: comprobación de cables, estados de puertos (LEDs), errores de dúplex/velocidad y colisiones.
- Utilidades de diagnóstico del sistema operativo:
  - Verificación de pila e IP: `ping`, `ipconfig` / `ip addr`, bucle local (`127.0.0.1`).
  - Resolución de direcciones físicas: tabla `arp` y problemas de duplicidad de IP.
  - Trazado de rutas y latencia: `tracert` / `traceroute`, `pathping`.
  - Conexiones y puertos activos: `netstat`, `ss`.
  - Diagnóstico DNS: `nslookup`, `dig`.
- Análisis de tráfico y captura de paquetes con Wireshark: filtros de captura y visualización básicos.
- Mantenimiento preventivo, etiquetado, copias de seguridad de configuraciones de switches/routers y documentación de red.

---

## 🧠 Conceptos Clave
```dataview
TABLE dificultad, estado
FROM "01-Modulos/Redes-Locales/02-Conceptos"
WHERE tipo = "concepto" AND ud = "UD08"
SORT file.name ASC
```

---

## 🛠️ Actividades y Prácticas de Taller
```dataview
TABLE tipo_ejercicio, tiempo_estimado_min
FROM "01-Modulos/Redes-Locales/03-Ejercicios"
WHERE tipo = "ejercicio" AND ud = "UD08"
```

---

## ❓ Banco de Preguntas y Evaluación
```dataview
TABLE dificultad, formato
FROM "01-Modulos/Redes-Locales/04-Banco-Items"
WHERE tipo = "item_evaluacion" AND ud = "UD08"
```
