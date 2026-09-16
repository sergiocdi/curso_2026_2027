---
tipo: concepto
modulo: "Redes Locales"
ud: "UD05"
ra_asociados: ["RA4"]
tags: [concepto, redes, ipv4, cabecera, ttl, best-effort, rfc791]
dificultad: intermedia
estado: revisado
---

# 💡 Concepto: El Protocolo IPv4. Características y Estructura de la Cabecera

> **Módulo**: [[MOC-Redes-Locales|Redes Locales]] | **UD**: [[UD05-Protocolo-IP-Configuracion-Interfaces|UD05]] | **RA**: [[RA04-Direccionamiento-IPv4-IPv6|RA4]]

---

## 📌 1. Concepto Fundamental
El **Protocolo de Internet versión 4 (IPv4)**, especificado en la **RFC 791** (1981), es el protocolo principal de la Capa de Internet (Capa 3). Proporciona el mecanismo de direccionamiento lógico global y enrutamiento jerárquico que permite la interconexión de redes dispares a escala planetaria.

### Tres Características Fundamentales de IPv4
1. **No orientado a conexión (Connectionless)**: No se establece un circuito ni una sesión previa entre emisor y receptor antes de emitir los paquetes. El emisor simplemente inyecta el datagrama en la red.
2. **Servicio de Mejor Esfuerzo (Best-Effort Delivery / No Confiable)**: IPv4 no garantiza que los paquetes alcancen su destino, ni que lleguen ordenados o sin duplicados. No incluye acuses de recibo (ACK) ni retransmisiones; delega la fiabilidad en capas superiores (como TCP).
3. **Independiente del Medio Físico**: Puede viajar indistintamente sobre cables de cobre, fibra óptica, enlaces satelitales o redes Wi-Fi sin alterar su estructura lógica.

---

## 📜 2. Estructura de la Cabecera IPv4 (20 a 60 bytes)

La longitud estándar de la cabecera IPv4 sin opciones adicionales es de exactamente **20 bytes (160 bits)**:

```text
 0                   1                   2                   3
 0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 0 1
+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
|Version|  IHL  |Type of Service|          Total Length         |
+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
|         Identification        |Flags|     Fragment Offset     |
+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
|  Time to Live |    Protocol   |        Header Checksum        |
+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
|                       Source IP Address                       |
+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
|                    Destination IP Address                     |
+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
|                    Options                    |    Padding    |
+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
```

### Campos Críticos de la Cabecera
- **Versión (4 bits)**: Siempre vale `4` (`0100` en binario).
- **IHL (Internet Header Length - 4 bits)**: Longitud de la cabecera en palabras de 32 bits (mínimo 5, equivalente a \(5 \times 4 = 20\) bytes).
- **Longitud Total (Total Length - 16 bits)**: Tamaño completo del paquete en bytes (cabecera + datos útiles). Máximo teórico: 65.535 bytes.
- **Campos de Fragmentación (Identificación, Flags, Fragment Offset)**: Si el paquete es mayor que la **MTU (Maximum Transmission Unit)** del enlace (ej. 1500 bytes en Ethernet), el router lo divide en fragmentos más pequeños.
- **TTL (Time to Live - 8 bits)**: Contador entero (típicamente 64, 128 o 255). Cada router que enruta el paquete resta 1 al TTL. Si llega a `0`, el router **descarta el paquete** y envía un mensaje ICMP *Time Exceeded* al emisor. Esto impide que paquetes con rutas mal configuradas circulen indefinidamente saturando la red.
- **Protocolo (8 bits)**: Indica a qué protocolo de Capa 4 debe entregarse la carga útil al desencapsular (ej. `1` = ICMP, `6` = TCP, `17` = UDP).
- **Checksum de Cabecera (16 bits)**: Suma de comprobación matemática para detectar si la cabecera se ha dañado en tránsito. Se recalcula en cada salto porque el TTL cambia.
- **Dirección IP Origen (32 bits)** y **Dirección IP Destino (32 bits)**.

---

## ⚠️ Errores Comunes y Puntos Clave en Taller
- **Creer que el TTL mide segundos reales**: Históricamente se pensó en segundos, pero en la práctica moderna es un contador de saltos (*hop count*).
- **El Checksum de IP no protege los datos**: Sólo protege los 20 bytes de la cabecera IP; la integridad de los datos de usuario la verifican TCP, UDP o la propia aplicación.
