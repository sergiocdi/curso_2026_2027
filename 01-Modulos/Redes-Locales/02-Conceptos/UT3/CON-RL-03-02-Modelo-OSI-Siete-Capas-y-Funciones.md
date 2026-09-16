---
tipo: concepto
modulo: "Redes Locales"
ud: "UD03"
ra_asociados: ["RA1"]
tags: [concepto, redes, modelo-osi, capas, iso7498]
dificultad: basica
estado: revisado
---

# 💡 Concepto: El Modelo OSI de Referencia (7 Capas)

> **Módulo**: [[MOC-Redes-Locales|Redes Locales]] | **UD**: [[UD03-Arquitecturas-Redes-Modelos-Referencia|UD03]] | **RA**: [[RA01-Arquitectura-Redes|RA1]]

---

## 📌 1. Concepto Fundamental
El **Modelo de Referencia OSI (Open Systems Interconnection)** fue publicado en 1984 por la **ISO (norma ISO/IEC 7498-1)** como un marco teórico universal para estandarizar la comunicación entre sistemas heterogéneos. Aunque la industria implementó en la práctica la pila TCP/IP, el modelo OSI sigue siendo el estándar pedagógico y de referencia indiscutible para diagnosticar averías y clasificar hardware de red.

Se compone de **7 capas ordenadas de abajo (física) hacia arriba (aplicación)**:

---

## 🏛️ 2. Las Siete Capas y sus Responsabilidades

| Nivel / Capa | PDU | Función Principal | Ejemplos / Dispositivos |
| :---: | :---: | :--- | :--- |
| **7. Aplicación** | Datos | Interfaz directa con los programas de usuario (navegadores, correo, transferencia de archivos). | HTTP, HTTPS, DNS, DHCP, FTP, SSH |
| **6. Presentación** | Datos | Formateo, sintaxis, compresión y cifrado/descifrado de datos para que emisor y receptor los interpreten igual. | TLS/SSL, ASCII, UTF-8, JPEG, MPEG |
| **5. Sesión** | Datos | Apertura, mantenimiento, sincronización (puntos de control) y cierre ordenado de sesiones entre procesos. | NetBIOS, RPC, sockets de control |
| **4. Transporte** | Segmento | Comunicación fiable o no fiable extremo a extremo entre aplicaciones, segmentación, control de flujo y multiplexación por puertos. | TCP (fiable), UDP (rápido/no fiable) |
| **3. Red** | Paquete | Direccionamiento lógico jerárquico global y enrutamiento (selección del mejor camino a través de redes intermedias). | Protocolo IP (IPv4, IPv6), ICMP. **Routers** |
| **2. Enlace de Datos** | Trama (*Frame*) | Transferencia fiable de tramas en un enlace físico directo punto a punto o multipunto, direccionamiento físico (MAC) y detección de errores (CRC). | Ethernet (IEEE 802.3), Wi-Fi (802.11). **Switches, Bridges** |
| **1. Física** | Bits | Transmisión de cadenas de bits binarios puros sobre el medio físico; define voltajes, frecuencias, conectores y patillajes. | Cables UTP, fibra óptica, conectores RJ-45, radiofrecuencia. **Hubs, Repetidores** |

---

## 🧠 3. Reglas Mnemotécnicas para el Alumnado

Para recordar el orden de las capas de arriba a abajo (7 a 1):
> **A**ll **P**eople **S**eem **T**o **N**eed **D**ata **P**rocessing
> *(Aplicación, Presentación, Sesión, Transporte, Red [Network], Enlace [Data link], Física)*

O de abajo a arriba (1 a 7):
> **P**lease **D**o **N**ot **T**hrow **S**ausage **P**izza **A**way
> *(Física, Enlace [Data Link], Red [Network], Transporte, Sesión, Presentación, Aplicación)*

---

## ⚠️ Errores Comunes y Puntos Clave en Taller
- **Creer que un switch es de Capa 3 por defecto**: Salvo que sea un switch multicapa expresamente indicado, los switches comunes operan exclusivamente en **Capa 2 (Enlace)** leyendo direcciones MAC.
- **Asignar IP a la Capa 2**: Las direcciones IP son identificadores de **Capa 3 (Red)**; las direcciones de Capa 2 son exclusivamente físicas (MAC).
