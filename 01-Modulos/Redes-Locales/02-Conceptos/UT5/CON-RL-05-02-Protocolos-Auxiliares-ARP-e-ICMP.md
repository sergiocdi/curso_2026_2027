---
tipo: concepto
modulo: "Redes Locales"
ud: "UD05"
ra_asociados: ["RA4", "RA5"]
tags: [concepto, redes, arp, icmp, ping, traceroute, mac]
dificultad: intermedia
estado: revisado
---

# 💡 Concepto: Protocolos Auxiliares de Capa de Red. ARP e ICMP

> **Módulo**: [[MOC-Redes-Locales|Redes Locales]] | **UD**: [[UD05-Protocolo-IP-Configuracion-Interfaces|UD05]] | **RA**: [[RA04-Direccionamiento-IPv4-IPv6|RA4]], [[RA05-Servicios-Red-DHCP-DNS|RA5]]

---

## 📌 1. Concepto Fundamental
El protocolo IPv4 no puede funcionar de manera aislada; necesita obligatoriamente dos protocolos auxiliares de soporte en la Capa de Internet:
1. **ARP (Address Resolution Protocol - RFC 826)**: El puente esencial entre el direccionamiento lógico (IP en Capa 3) y el direccionamiento físico real (MAC en Capa 2).
2. **ICMP (Internet Control Message Protocol - RFC 792)**: El mecanismo de diagnóstico, reporte de errores y control operativo de la red IP.

---

## 🔍 2. Funcionamiento de ARP (Resolución de IP a MAC)

Cuando un equipo emisor \(A\) necesita enviar un paquete IP al equipo destino \(B\) en la misma subred, conoce su dirección IP (ej. `192.168.1.50`), pero para encapsular la trama Ethernet en Capa 2 **necesita obligatoriamente conocer la dirección MAC de la tarjeta de red de \(B\)**.

```text
Host A (192.168.1.10)                                 Host B (192.168.1.50)
        │                                                     │
        ├── ARP Request (Broadcast: ¿Quién tiene .50?) ──────►│ (Reciben todos los PCs)
        │   MAC Destino: FF:FF:FF:FF:FF:FF                    │
        │                                                     │
        │◄─ ARP Reply (Unicast: Yo soy .50, mi MAC es BB) ───┤ (Responde sólo B)
        │   MAC Destino: AA:AA:AA:AA:AA:AA                    │
```

1. **Consulta de la Caché ARP local**: El Host \(A\) revisa primero su propia tabla interna en memoria RAM (`arp -a`). Si la MAC ya está anotada, encapsula la trama directamente.
2. **ARP Request**: Si no la tiene, envía un mensaje de difusión (**Broadcast**) con MAC destino `FF:FF:FF:FF:FF:FF`: *"¿Quién tiene la IP 192.168.1.50? Que le responda a 192.168.1.10"*. Todos los equipos de la LAN procesan la petición, pero sólo aquel cuya IP coincide responde.
3. **ARP Reply**: El Host \(B\) responde mediante un mensaje unívoco (**Unicast**) dirigido a la MAC de \(A\): *"Yo soy 192.168.1.50 y mi MAC es 00:1A:2B:3C:4D:5E"*.
4. **Almacenamiento**: Host \(A\) guarda la correspondencia en su caché ARP durante unos minutos.

> [!IMPORTANT]
> **Destino fuera de la subred local**: Si el equipo de destino está en otra red (ej. en Internet `8.8.8.8`), el equipo \(A\) **NO hace ARP por la IP remota**, sino que hace **ARP por la IP de su Puerta de Enlace (Default Gateway)**.

---

## 📡 3. Mensajes Principales de ICMP

ICMP viaja encapsulado directamente dentro de paquetes IP (campo protocolo = `1`):

| Tipo ICMP | Código | Mensaje | Descripción / Utilidad |
| :---: | :---: | :--- | :--- |
| **8** | 0 | **Echo Request** | Solicitud de eco enviada por el comando `ping`. |
| **0** | 0 | **Echo Reply** | Respuesta de eco emitida por el host receptor en `ping`. |
| **3** | Varios | **Destination Unreachable** | El router o host descarta el paquete porque la red (código 0), el host (código 1) o el puerto de la aplicación (código 3) son inalcanzables. |
| **11** | 0 | **Time Exceeded** | El router descarta el paquete porque el campo TTL llegó a `0`. Es la base del funcionamiento del comando `traceroute` / `tracert`. |
| **5** | Varios | **Redirect** | Un router informa a un host de que existe una ruta más corta a través de otro router local. |

---

## ⚠️ Errores Comunes y Puntos Clave en Taller
- **El primer ping siempre falla**: En simuladores (Packet Tracer) o talleres reales, cuando un PC emite un ping por primera vez a otro nodo, el primer paquete ICMP suele descartarse en el búfer mientras se completa el ciclo de petición/respuesta ARP. Los siguientes 3 pings responden con 0% de pérdidas.
- **Ataques de suplantación ARP (ARP Spoofing / Poisoning)**: Como ARP carece de autenticación, cualquier atacante en la LAN puede enviar respuestas ARP falsas haciéndose pasar por el router, desviando todo el tráfico hacia su máquina (*Man-in-the-Middle*).
