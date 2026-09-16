---
tipo: concepto
modulo: "Redes Locales"
ud: "UD03"
ra_asociados: ["RA1"]
tags: [concepto, redes, encapsulamiento, pdu, tramas, paquetes, segmentos]
dificultad: intermedia
estado: revisado
---

# 💡 Concepto: Encapsulamiento, Desencapsulamiento y Unidades de Datos (PDU)

> **Módulo**: [[MOC-Redes-Locales|Redes Locales]] | **UD**: [[UD03-Arquitecturas-Redes-Modelos-Referencia|UD03]] | **RA**: [[RA01-Arquitectura-Redes|RA1]]

---

## 📌 1. Concepto Fundamental
La comunicación en redes por capas se realiza empaquetando sucesivamente la información en cada nivel:
- **PDU (Protocol Data Unit - Unidad de Datos del Protocolo)**: Bloque de datos discreto que una entidad de una capa envía a su entidad par homóloga en la máquina remota. Incluye la información de control de dicha capa (**cabecera o header**) y la carga útil de la capa superior (**payload**).
- **Encapsulamiento (Emisor)**: Proceso descendente mediante el cual cada capa añade su propia cabecera (y en capa 2, también una cola/trailer) a los datos recibidos de la capa superior.
- **Desencapsulamiento (Receptor)**: Proceso ascendente en el que cada capa examina y retira su cabecera, verifica la integridad y entrega la carga útil limpia a la capa inmediatamente superior.

---

## 📦 2. Nombres Específicos de las PDUs por Capa

```text
Capa de Aplicación:   [ Datos de Usuario / Mensaje ]
                                  │
Capa de Transporte:   [ Cabecera TCP/UDP ][          DATOS         ]  ──► SEGMENTO
                                  │
Capa de Red:          [ Cabecera IP ][      SEGMENTO TCP/UDP       ]  ──► PAQUETE
                                  │
Capa de Enlace:       [ Cab. Ethernet ][         PAQUETE IP        ][ Cola FCS ]  ──► TRAMA
                                  │
Capa Física:          01101001011011100110011001101111...             ──► BITS
```

| Capa OSI | Nombre Oficial de la PDU | Cabeceras Principales Añadidas |
| :--- | :--- | :--- |
| **7, 6, 5 (Aplicación)** | **Datos / Mensaje** | Cabecera del protocolo de aplicación (ej. petición HTTP `GET /`). |
| **4 (Transporte)** | **Segmento** (TCP) o **Datagrama** (UDP) | Puertos origen y destino (16 bits cada uno), números de secuencia y control de flujo. |
| **3 (Red)** | **Paquete** o Datagrama IP | Direcciones IP origen e IP destino (32 bits en IPv4), TTL (Time to Live). |
| **2 (Enlace)** | **Trama (Frame)** | Direcciones MAC origen y destino (48 bits), tipo de protocolo (EtherType) y cola de detección de errores (**FCS / CRC-32**). |
| **1 (Física)** | **Bits** | Preámbulo de sincronización, codificación de línea y modulación en el medio físico. |

---

## 🔄 3. El Proceso Extremo a Extremo en los Equipos Intermedios

Un detalle vital para el alumnado de SMR es entender hasta qué capa "mira" cada equipo de red:
- **Un Host (PC / Servidor)**: Procesa las 7 capas completas (encapsula al emitir y desencapsula hasta la aplicación al recibir).
- **Un Conmutador (Switch Capa 2)**: Sólo desencapsula hasta la **Capa 2**. Lee la dirección MAC de destino en la cabecera de la trama Ethernet para reenviarla por el puerto adecuado y vuelve a regenerar los bits. ¡No mira ni modifica la cabecera IP!
- **Un Enrutador (Router)**: Desencapsula hasta la **Capa 3**. Quita la trama Ethernet entrante, lee la cabecera del **Paquete IP** (dirección IP de destino), consulta su tabla de rutas, decrementa el TTL, recalcula el checksum y encapsula el paquete en una **nueva trama Ethernet** con nuevas direcciones MAC para el siguiente salto.

---

## ⚠️ Errores Comunes y Puntos Clave en Taller
- **Llamar "paquete" a todo**: En el vocabulario técnico de FP, no se debe usar "paquete" de forma genérica. Si estamos analizando Wireshark a nivel MAC, hablamos de **trama**; si hablamos de enrutamiento IP, de **paquete**; y si hablamos de puertos TCP/UDP, de **segmento**.
- **Creer que la MAC viaja por todo Internet**: La dirección MAC cambia en cada salto de router (hop); las direcciones IP de origen y destino se mantienen constantes de extremo a extremo.
