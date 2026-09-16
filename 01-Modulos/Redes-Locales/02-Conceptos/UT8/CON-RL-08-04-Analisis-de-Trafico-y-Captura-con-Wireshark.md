---
tipo: concepto
modulo: "Redes Locales"
ud: "UD08"
ra_asociados: ["RA5"]
tags: [concepto, redes, wireshark, analizador-protocolos, captura, filtros]
dificultad: intermedia
estado: revisado
---

# 💡 Concepto: Análisis de Tráfico y Captura de Paquetes con Wireshark

> **Módulo**: [[MOC-Redes-Locales|Redes Locales]] | **UD**: [[UD08-Mantenimiento-Red-Local-Resolucion-Incidencias|UD08]] | **RA**: [[RA05-Servicios-Red-DHCP-DNS|RA5]]

---

## 📌 1. Concepto Fundamental
**Wireshark** es el analizador de protocolos de red (*sniffer / packet analyzer*) de código abierto más utilizado en el mundo. Pone la tarjeta de red en **modo promiscuo** utilizando controladores especializados (Npcap en Windows, libpcap en Linux) para capturar todas las tramas que circulan por el cable o la interfaz aérea, decodificando minuciosamente cada campo de cada capa del modelo OSI.

---

## 🖥️ 2. Anatomía de la Ventana de Wireshark

La interfaz gráfica principal de Wireshark se divide en tres paneles horizontales:

```text
┌────────────────────────────────────────────────────────────────────────┐
│ [Barra de Filtro de Visualización (Display Filter)]: ip.addr == ...    │
├────────────────────────────────────────────────────────────────────────┤
│ 1. Panel de Lista de Paquetes (Packet List):                           │
│    No. | Time | Source | Destination | Protocol | Length | Info        │
├────────────────────────────────────────────────────────────────────────┤
│ 2. Panel de Detalles del Paquete (Packet Details):                     │
│    ▶ Frame 1: 74 bytes on wire... (Capa 1)                             │
│    ▶ Ethernet II, Src: Intel_..., Dst: Cisco_... (Capa 2)              │
│    ▶ Internet Protocol Version 4, Src: 192.168.1.10, Dst: 8.8.8.8      │
│    ▶ User Datagram Protocol, Src Port: 53210, Dst Port: 53 (DNS)       │
│    ▶ Domain Name System (query)                                        │
├────────────────────────────────────────────────────────────────────────┤
│ 3. Panel de Bytes del Paquete (Packet Bytes):                          │
│    Volcado hexadecimal y ASCII crudo del paquete binario.              │
└────────────────────────────────────────────────────────────────────────┘
```

---

## 🔍 3. Filtros de Captura frente a Filtros de Visualización

### A. Filtros de Captura (Capture Filters - Sintaxis BPF)
Se definen **antes de iniciar la captura** en la pantalla de bienvenida. El motor solo guarda en disco los paquetes que coinciden, ahorrando memoria y CPU en redes con tráfico masivo:
- `host 192.168.1.50`: Captura solo tráfico hacia o desde esa IP.
- `port 80 or port 443`: Captura solo tráfico web.
- `not arp and not icmp`: Excluye tráfico de difusión y pings.

### B. Filtros de Visualización (Display Filters - Sintaxis Wireshark)
Se aplican en caliente en la barra verde superior **sobre los paquetes ya capturados en memoria**. Permiten ocultar el ruido y encontrar la anomalía en segundos:
- **Por protocolo**:
  - `dns`: Muestra únicamente consultas y respuestas DNS.
  - `dhcp` o `bootp`: Filtra transacciones DHCP (Discover, Offer, Request, Ack).
  - `http`: Muestra tráfico web no cifrado.
  - `icmp`: Muestra pings y mensajes de error.
- **Por dirección IP**:
  - `ip.addr == 192.168.1.1`: Paquetes donde esa IP sea origen o destino.
  - `ip.src == 192.168.1.50 and ip.dst == 192.168.1.1`: Conversación específica.
- **Por puerto TCP/UDP**:
  - `tcp.port == 80`: Tráfico web.
  - `tcp.flags.syn == 1 and tcp.flags.ack == 0`: Filtra inicios de conexión TCP.

---

## ⚠️ Errores Comunes y Puntos Clave en Taller
- **Creer que Wireshark puede ver todo el tráfico del aula en un switch moderno**: Como se vio en la UT4, un switch no es un hub; no envía el tráfico de los demás alumnos a tu puerto. Para capturar el tráfico de otro equipo en un switch gestionable es imprescindible configurar un puerto en modo **Port Mirroring / SPAN (Switched Port Analyzer)** en el switch Cisco:
  ```text
  Switch(config)# monitor session 1 source interface fastEthernet 0/1
  Switch(config)# monitor session 1 destination interface fastEthernet 0/24
  ```
- **El color de los paquetes**: Wireshark colorea los paquetes según reglas predefinidas (verde para HTTP/TCP, azul claro para DNS, negro con texto rojo para paquetes TCP con errores, retransmisiones o flags RST).
