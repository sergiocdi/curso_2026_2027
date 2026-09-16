---
tipo: concepto
modulo: "Redes Locales"
ud: "UD01"
ra_asociados: ["RA1"]
tags: [concepto, redes, estandares, normalizacion, ieee, iso, itu, ietf, rfc]
dificultad: basica
estado: revisado
---

# 💡 Concepto: Normalización, Estándares de Red y Organismos Internacionales

> **Módulo**: [[MOC-Redes-Locales|Redes Locales]] | **UD**: [[UD01-Introduccion-Redes-Locales-Caracterizacion|UD01]] | **RA**: [[RA01-Arquitectura-Redes|RA1]]

---

## 📌 1. La Necesidad Histórica de la Normalización
En los comienzos de la informática de comunicaciones, los grandes fabricantes (IBM con SNA, DEC con DECnet, Novell con NetWare) desarrollaban tecnologías y protocolos cerrados y propietarios. El resultado era un ecosistema fragmentado donde los equipos de distintos fabricantes eran totalmente incompatibles entre sí, obligando a los clientes al monopolio de un único proveedor (*vendor lock-in*).

Un **estándar** en comunicaciones es un conjunto de normas, acuerdos, especificaciones y recomendaciones técnicas consensuadas que regulan el diseño de hardware, software y protocolos para garantizar la **interoperabilidad universal**.

### Ventajas Cruciales de la Estandarización:
- **Interoperabilidad**: Equipos de marcas heterogéneas (Cisco, HP, Dell, Apple) se comunican sin fricción.
- **Ampliación del Mercado y Abaratamiento de Costes**: Economías de escala y libre competencia.
- **Protección de Inversiones**: Compatibilidad asegurada con futuras generaciones tecnológicas.
- **Prevención de Monopolios**: Ningún fabricante controla unilateralmente el estándar.

---

## 📜 2. Tipos de Estándares

### A. Por su Grado de Oficialidad:
- **Estándar de Hecho (*De Facto*)**: Nace de la práctica comercial o de la adopción masiva por parte de la industria sin haber sido redactado previamente por un organismo formal (ej. arquitectura PC de IBM, protocolo TCP/IP en sus inicios).
- **Estándar de Derecho (*De Jure*)**: Emitido y ratificado oficialmente por un organismo de normalización reconocido tras un proceso formal de debate y consenso (ej. estándar IEEE 802.3 Ethernet, especificaciones ISO).

### B. Por su Propiedad y Acceso:
- **Estándar Abierto**: Especificaciones técnicas públicas, documentadas y disponibles libremente para cualquier desarrollador sin pago de royalties ni restricciones (ej. especificaciones RFC de Internet, protocolo HTTP).
- **Estándar Propietario / Cerrado**: Propiedad intelectual privada de una compañía, no publicado o sujeto a licencias restrictivas (ej. Apple Lightning, protocolos propietarios de almacenamiento).

---

## 🏢 3. Principales Organismos de Normalización

| Organismo | Nombre Completo | Ámbito de Actuación Principal |
| :--- | :--- | :--- |
| **ISO** | International Organization for Standardization | Federación mundial de normalización. Creó el **Modelo OSI** (ISO/IEC 7498-1). |
| **IEEE** | Institute of Electrical and Electronics Engineers | Estándares eléctricos, electrónicos y de telecomunicaciones. Destaca el **Comité IEEE 802** para LAN/MAN. |
| **ITU / ITU-T** | International Telecommunication Union | Organismo de las Naciones Unidas que regula las telecomunicaciones mundiales (telefonía, modems, fibra óptica serie G). |
| **ETSI** | European Telecommunications Standards Institute | Normalización técnica europea en telecomunicaciones (telefonía móvil GSM, 5G). |
| **IETF** | Internet Engineering Task Force | Comunidad internacional abierta que diseña y mantiene la arquitectura de Internet mediante los documentos **RFC (Request For Comments)**. |
| **IAB** | Internet Architecture Board | Comité consultivo supervisor de la evolución arquitectónica de Internet y de la IETF. |

### El Proyecto IEEE 802 y sus Subcomités Fundamentales:
El estándar IEEE 802 dividió el Nivel de Enlace de Datos en dos subcapas: **LLC** (Logical Link Control - 802.2) y **MAC** (Media Access Control):
- **IEEE 802.1**: Arquitectura general de redes, Spanning Tree (STP - 802.1D), VLANs (802.1Q) y seguridad de puerto (802.1X).
- **IEEE 802.3**: **Ethernet** por cable (10BASE-T, 100BASE-TX, 1000BASE-T, fibra óptica 10G/40G/100G).
- **IEEE 802.11**: **Wi-Fi** (redes de área local inalámbricas WLAN: 802.11b/g/n/ac/ax/be).
- **IEEE 802.15**: **WPAN** (redes personales inalámbricas: 802.15.1 Bluetooth, 802.15.4 Zigbee).

---

## ⚠️ Errores Comunes y Puntos Clave en Taller
- **Creer que un RFC es solo una sugerencia**: Aunque se denomine formalmente "Petición de Comentarios" (*Request for Comments*), las RFCs aprobadas como *Internet Standard* (como el RFC 791 para IPv4 o RFC 793 para TCP) son las leyes técnicas universales de Internet.
- **Diferencia entre ISO y OSI**: ISO es la organización (*International Organization for Standardization*); OSI es el modelo de referencia de 7 capas que ellos crearon (*Open Systems Interconnection*).\n