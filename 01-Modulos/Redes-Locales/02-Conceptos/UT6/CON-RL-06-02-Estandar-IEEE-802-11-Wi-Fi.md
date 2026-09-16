---
tipo: concepto
modulo: "Redes Locales"
ud: "UD06"
ra_asociados: ["RA3"]
tags: [concepto, redes, wifi, 80211, estandares, canales, csmaca]
dificultad: intermedia
estado: revisado
---

# 💡 Concepto: El Estándar IEEE 802.11 (Wi-Fi) y su Evolución

> **Módulo**: [[MOC-Redes-Locales|Redes Locales]] | **UD**: [[UD06-Redes-Inalambricas-Mixtas|UD06]] | **RA**: [[RA03-Configuracion-Conmutadores-Routers|RA3]]

---

## 📌 1. Concepto Fundamental
La familia de estándares **IEEE 802.11** define el control de acceso al medio (MAC) y las especificaciones de la capa física para redes locales inalámbricas (**WLAN**). El consorcio comercial **Wi-Fi Alliance** certifica la interoperabilidad entre fabricantes y promueve la denominación comercial simplificada (Wi-Fi 4, 5, 6, 7).

---

## 🚀 2. Evolución Cronológica de Estándares Wi-Fi

| Nombre Comercial | Estándar IEEE | Año | Frecuencia | Velocidad Máx. Teórica | Tecnologías Clave |
| :---: | :---: | :---: | :---: | :---: | :--- |
| Legacy | **802.11** | 1997 | 2.4 GHz | 2 Mbps | DSSS / FHSS |
| Wi-Fi 1 | **802.11b** | 1999 | 2.4 GHz | 11 Mbps | DSSS, modulación CCK |
| Wi-Fi 2 | **802.11a** | 1999 | 5 GHz | 54 Mbps | OFDM (primera incursión en 5 GHz) |
| Wi-Fi 3 | **802.11g** | 2003 | 2.4 GHz | 54 Mbps | OFDM en 2.4 GHz (compatible con b) |
| **Wi-Fi 4** | **802.11n** | 2009 | 2.4 y 5 GHz | Hasta 600 Mbps | **MIMO** (antenas múltiples), canales de 40 MHz |
| **Wi-Fi 5** | **802.11ac** | 2013 | Solo 5 GHz | Hasta 6.9 Gbps | **MU-MIMO**, canales de 80 y 160 MHz, 256-QAM |
| **Wi-Fi 6 / 6E**| **802.11ax** | 2019 / 2021 | 2.4, 5 y 6 GHz | Hasta 9.6 Gbps | **OFDMA**, 1024-QAM, Target Wake Time (IoT) |
| **Wi-Fi 7** | **802.11be** | 2024 | 2.4, 5 y 6 GHz | Hasta 46 Gbps | Canales de 320 MHz, 4096-QAM, MLO (Multi-Link) |

---

## 📻 3. Distribución de Canales y Frecuencias

### Canales en 2.4 GHz (Europa / ETSI)
Existen **13 canales** (del 1 al 13), centrados cada 5 MHz, pero con un ancho de banda de emisión de **20 o 22 MHz**:

```text
Canal 1        Canal 6        Canal 11
 (2.412 GHz)    (2.437 GHz)    (2.462 GHz)
   ┌───┐          ┌───┐          ┌───┐
───┘   └───    ───┘   └───    ───┘   └───
```
- Para desplegar una red corporativa con múltiples puntos de acceso adyacentes sin interferencias mutuas (**co-channel interference**), se utiliza el patrón de repetición hexagonal con los tres canales no solapados: **1, 6 y 11**.

### Canales en 5 GHz
- Ofrece más de 20 canales de 20 MHz completamente libres de solapamiento.
- Permite agrupar canales contiguos (*channel bonding*) para formar canales ultraanchos de 40, 80 o 160 MHz.
- **Canales DFS (Dynamic Frequency Selection)**: Compartidos con radares meteorológicos y militares; el AP debe monitorizar el canal y cambiar automáticamente si detecta un radar.

---

## ✋ 4. Control de Acceso al Medio: CSMA/CA
Dado que un transceptor inalámbrico no puede transmitir y escuchar simultáneamente (la potencia de transmisión es miles de veces mayor que la débil señal entrante), Wi-Fi no puede detectar colisiones (no usa CSMA/CD), sino que aplica **CSMA/CA (Carrier Sense Multiple Access with Collision Avoidance)**:
1. Escucha el medio (**Carrier Sense**).
2. Si el canal está ocupado, espera un tiempo aleatorio (**DIFS + Backoff**).
3. Si el canal está libre, envía la trama y espera obligatoriamente un acuse de recibo (**ACK** del receptor). Si no llega el ACK, asume colisión y retransmite.
4. Para tramas grandes se puede activar el intercambio opcional previo de reserva: **RTS (Request to Send)** y **CTS (Clear to Send)** para mitigar el problema del *nodo oculto*.

---

## ⚠️ Errores Comunes y Puntos Clave en Taller
- **Creer que la velocidad de la caja es la velocidad real**: Un router Wi-Fi que anuncia "1200 Mbps" suele sumar la velocidad máxima teórica de 2.4 GHz (300) y de 5 GHz (867). Además, debido al overhead de CSMA/CA y acuses ACK, la velocidad útil real de descarga ronda el 50-60% del enlace nominal.
