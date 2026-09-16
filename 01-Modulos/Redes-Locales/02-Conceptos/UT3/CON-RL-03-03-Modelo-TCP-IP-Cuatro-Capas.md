---
tipo: concepto
modulo: "Redes Locales"
ud: "UD03"
ra_asociados: ["RA1"]
tags: [concepto, redes, tcpip, internet, arquitectura]
dificultad: basica
estado: revisado
---

# 💡 Concepto: La Arquitectura TCP/IP y Correspondencia con OSI

> **Módulo**: [[MOC-Redes-Locales|Redes Locales]] | **UD**: [[UD03-Arquitecturas-Redes-Modelos-Referencia|UD03]] | **RA**: [[RA01-Arquitectura-Redes|RA1]]

---

## 📌 1. Concepto Fundamental
La **pila de protocolos TCP/IP (Transmission Control Protocol / Internet Protocol)**, también conocida como la suite de protocolos de Internet, fue desarrollada inicialmente por DARPA a finales de los años 60 y estandarizada a través de las RFC de la IETF.

A diferencia del modelo conceptual teórico OSI, TCP/IP es un modelo eminentemente práctico y orientado a la implementación que constituye la base operativa real de Internet y de todas las redes locales contemporáneas.

---

## 🗺️ 2. Correspondencia entre TCP/IP y el Modelo OSI

```text
    MODELO OSI (7 Capas)                ARQUITECTURA TCP/IP (4 Capas)
┌───────────────────────────┐          ┌───────────────────────────┐
│ 7. Aplicación             │          │                           │
├───────────────────────────┤          │                           │
│ 6. Presentación           │  ──────► │  4. Capa de Aplicación    │
├───────────────────────────┤          │   (HTTP, DNS, DHCP, SSH)  │
│ 5. Sesión                 │          │                           │
├───────────────────────────┤          ├───────────────────────────┤
│ 4. Transporte             │  ──────► │  3. Capa de Transporte    │
│                           │          │         (TCP, UDP)        │
├───────────────────────────┤          ├───────────────────────────┤
│ 3. Red                    │  ──────► │  2. Capa de Internet      │
│                           │          │    (IPv4, IPv6, ICMP)     │
├───────────────────────────┤          ├───────────────────────────┤
│ 2. Enlace de Datos        │          │  1. Capa de Acceso a Red  │
├───────────────────────────┤  ──────► │    / Interfaz de Red      │
│ 1. Física                 │          │   (Ethernet, Wi-Fi, PPP)  │
└───────────────────────────┘          └───────────────────────────┘
```

### Funciones de las 4 Capas de TCP/IP
1. **Capa de Acceso a la Red (Network Access / Link Layer)**:
   - Agrupa las capas 1 (Física) y 2 (Enlace) de OSI.
   - Gestiona el acceso al medio físico local, modulación y encapsulamiento en tramas específicas de cada tecnología (Ethernet IEEE 802.3, Wi-Fi IEEE 802.11).
2. **Capa de Internet**:
   - Equivale a la capa 3 (Red) de OSI.
   - Responsable del empaquetado y enrutamiento independiente de datagramas mediante direcciones IP. Protocolos clave: **IPv4**, **IPv6**, **ICMP** (mensajes de diagnóstico y ping), **ARP** (resolución de IP a MAC).
3. **Capa de Transporte**:
   - Equivale a la capa 4 de OSI.
   - Proporciona canales de comunicación entre aplicaciones host-a-host mediante puertos (0 a 65535).
   - **TCP**: Conexión orientada, control de flujo por ventana deslizante, acuses de recibo y retransmisión de paquetes perdidos.
   - **UDP**: Sin conexión, mínima sobrecarga (*overhead*), máxima velocidad, sin garantía de entrega ni orden.
4. **Capa de Aplicación**:
   - Integra las capas 5 (Sesión), 6 (Presentación) y 7 (Aplicación) de OSI.
   - Los propios protocolos de aplicación gestionan la presentación y la sesión si lo precisan.

---

## ⚖️ 3. Comparativa Filosófica: OSI vs TCP/IP

| Criterio | Modelo OSI | Arquitectura TCP/IP |
| :--- | :--- | :--- |
| **Origen** | Comité internacional formal (ISO/ITU) | Comunidad práctica de ingenieros (DARPA/IETF) |
| **Estructura** | 7 capas estrictas e independientes | 4 capas pragmáticas y flexibles |
| **Desarrollo** | Los estándares se definieron antes de escribir el código | El código y protocolos se probaron y desplegaron primero |
| **Uso actual** | Referencia conceptual, didáctica y de certificación | Estándar universal de facto en producción |

---

## ⚠️ Errores Comunes y Puntos Clave en Taller
- **Creer que TCP e IP son inseparables**: Aunque suelen trabajar juntos, son protocolos de capas distintas: IP puede transportar UDP o ICMP en lugar de TCP; y TCP podría funcionar teóricamente sobre otro protocolo de red.
