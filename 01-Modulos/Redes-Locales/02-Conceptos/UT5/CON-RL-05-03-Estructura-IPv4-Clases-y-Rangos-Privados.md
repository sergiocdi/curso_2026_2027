---
tipo: concepto
modulo: "Redes Locales"
ud: "UD05"
ra_asociados: ["RA4"]
tags: [concepto, redes, ipv4, clases-ip, rfc1918, ip-privada, rfc3927]
dificultad: basica
estado: revisado
---

# 💡 Concepto: Estructura de Direcciones IPv4, Clases y Direcciones Especiales

> **Módulo**: [[MOC-Redes-Locales|Redes Locales]] | **UD**: [[UD05-Protocolo-IP-Configuracion-Interfaces|UD05]] | **RA**: [[RA04-Direccionamiento-IPv4-IPv6|RA4]]

---

## 📌 1. Concepto Fundamental
Una dirección **IPv4** es un identificador numérico lógico de **32 bits (4 bytes)** asignado jerárquicamente a la interfaz de un dispositivo de red. Se escribe habitualmente en **notación decimal con puntos** (*dotted-decimal notation*), donde cada uno de los 4 octetos se representa como un número decimal entre 0 y 255 separado por puntos (ejemplo: `192.168.10.1`).

Toda dirección IP se divide en dos porciones lógicas:
1. **Porción de Red (Network ID)**: Identifica la red física o lógica concreta a la que pertenece el nodo. Todos los equipos de la misma subred comparten obligatoriamente los mismos bits de red.
2. **Porción de Host (Host ID)**: Identifica unívocamente a la interfaz del equipo específico dentro de esa subred.

---

## 🏛️ 2. Direccionamiento con Clase Histórico (Classful)

Antes de la adopción del estándar CIDR (1993), el espacio global de 4.294.967.296 direcciones IPv4 se dividía rígidamente según el valor de los primeros bits del primer octeto:

| Clase | Primer Octeto (Binario) | Rango Primer Octeto | Máscara por Defecto | Redes Disponibles | Hosts por Red | Propósito Original |
| :---: | :---: | :---: | :---: | :---: | :---: | :--- |
| **A** | `0...` | **1 - 126** | `255.0.0.0` (/8) | 126 | 16.777.214 | Redes gigantescas (gobiernos, multinacionales) |
| **B** | `10...` | **128 - 191** | `255.255.0.0` (/16) | 16.384 | 65.534 | Universidades y grandes corporaciones |
| **C** | `110...` | **192 - 223** | `255.255.255.0` (/24) | 2.097.152 | 254 | Pequeñas y medianas empresas / redes LAN |
| **D** | `1110...` | **224 - 239** | Sin máscara | N/A | N/A | Transmisiones Multicast (multidifusión a grupos) |
| **E** | `1111...` | **240 - 255** | Sin máscara | N/A | N/A | Reservadas para experimentación e investigación |

---

## 🔒 3. Direcciones Privadas (RFC 1918) frente a Públicas

- **Direcciones Públicas**: Son globales, únicas en todo el planeta y enrutables a través de los routers troncales de Internet. Las asigna la IANA / RIRs (en Europa, RIPE NCC) y tienen coste económico.
- **Direcciones Privadas (RFC 1918)**: Reservadas exclusivamente para redes de área local internas empresariales o domésticas. **No son enrutables en Internet** (los routers de los proveedores las descartan automáticamente). Para navegar hacia Internet deben pasar por un router con **NAT**.

### Rangos Privados Oficiales (RFC 1918)
| Clase | Rango Privado de Direcciones | Máscara CIDR | Número de IPs Disponibles |
| :---: | :--- | :---: | :--- |
| **A** | `10.0.0.0` a `10.255.255.255` | `/8` | 16.777.216 IPs |
| **B** | `172.16.0.0` a `172.31.255.255` | `/12` | 1.048.576 IPs (16 redes /16 consecutivas) |
| **C** | `192.168.0.0` a `192.168.255.255` | `/16` | 65.536 IPs (256 redes /24 consecutivas) |

---

## 🛑 4. Direcciones Especiales y Reservadas

1. **Bucle Local o Loopback (`127.0.0.0/8`)**:
   - `127.0.0.1` (`localhost`): Permite a un equipo enviarse tráfico de red a sí mismo sin salir a la tarjeta física. Sirve para verificar que la pila TCP/IP del sistema operativo está correctamente instalada.
2. **APIPA (Automatic Private IP Addressing - RFC 3927)**:
   - Rango: `169.254.0.0/16` (`169.254.0.1` a `169.254.255.254`).
   - Si un cliente Windows o Linux está configurado para obtener IP automática por DHCP y el servidor DHCP no contesta o el cable está desconectado, el sistema se autoasigna una IP de este rango.
3. **Dirección de Red**: Todos los bits de host a `0` (ej. `192.168.1.0`). Identifica a la red completa; ningún host puede tenerla asignada.
4. **Dirección de Broadcast de Subred**: Todos los bits de host a `1` (ej. `192.168.1.255`). Mensaje dirigido a todos los nodos de la subred; no asignable a ningún host individual.
5. **Broadcast Global**: `255.255.255.255` (difusión limitada al enlace local).
6. **Ruta por defecto**: `0.0.0.0/0`.

---

## ⚠️ Errores Comunes y Puntos Clave en Taller
- **Ver una IP `169.254.X.X` en clase**: Cuando un alumno avisa de que "no tiene Internet", el primer paso es ejecutar `ipconfig`. Si la IP empieza por `169.254`, el diagnóstico es inmediato: **el cliente no ha recibido respuesta del servidor DHCP** (cable roto, puerto apagado o servidor DHCP caído).
- **El salto de 126 a 128 en las clases**: La red `127.0.0.0` no pertenece a la Clase A comercial porque está reservada por completo para pruebas de bucle interno (*loopback*).
