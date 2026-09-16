---
tipo: concepto
modulo: "Redes Locales"
ud: "UD01"
ra_asociados: ["RA1"]
tags: [concepto, redes, clasificacion, lan, wan, pan, man, titularidad, difusion, p2p]
dificultad: basica
estado: revisado
---

# 💡 Concepto: Clasificación Integral de Redes Informáticas

> **Módulo**: [[MOC-Redes-Locales|Redes Locales]] | **UD**: [[UD01-Introduccion-Redes-Locales-Caracterizacion|UD01]] | **RA**: [[RA01-Arquitectura-Redes|RA1]]

---

## 📌 1. Definición y Objetivos de una Red Informática
Una **red informática** es un conjunto de dispositivos electrónicos interconectados entre sí mediante medios físicos guiados (cables) o no guiados (ondas de radio), capaces de comunicarse y compartir recursos siguiendo protocolos estandarizados.

### Objetivos Fundamentales de una Red:
1. **Compartir Recursos Hardware y Software**: Impresoras departamentales, matrices de almacenamiento (NAS/SAN), potencia de cálculo, aplicaciones centralizadas.
2. **Compartir Información**: Ficheros centralizados, bases de datos compartidas, repositorios documentales accesibles desde cualquier puesto.
3. **Aumentar la Fiabilidad y Disponibilidad**: Replicación de servidores, copias de seguridad remotas y redundancia de caminos.
4. **Incrementar el Rendimiento**: Clústeres de servidores y distribución de cargas de trabajo.
5. **Medio de Comunicación Humana**: Correo corporativo, mensajería instantánea, telefonía IP (VoIP) y videoconferencias.

---

## 🗺️ 2. Taxonomía Completa de Redes

### A. Por su Alcance o Extensión Territorial
1. **PAN (Personal Area Network)**: Espacio personal del usuario (1 a 10 metros). Tecnologías: Bluetooth, NFC, Zigbee.
2. **LAN (Local Area Network)**: Aula, oficina, edificio o taller (< 1 km). Propiedad privada, velocidades muy altas (1 Gbps a 10 Gbps) y tasas de error mínimas.
3. **CAN (Campus Area Network)**: Complejo universitario, polígono industrial o centro hospitalario formado por varios edificios interconectados (1 a 5 km).
4. **MAN (Metropolitan Area Network)**: Cobertura a nivel de localidad o ciudad (hasta 50 km). Redes de televisión por cable, redes metropolitanas de fibra de operadores.
5. **WAN (Wide Area Network)**: Ámbito regional, nacional o intercontinental (> 50 km). Gestionada por proveedores de telecomunicaciones (ISPs). El ejemplo supremo es **Internet**.

### B. Por la Titularidad o Propiedad de la Red
- **Redes Privadas**: Propiedad de una empresa, institución o particular; el acceso está restringido exclusivamente a sus miembros autorizados (ej. la LAN de nuestro instituto o la red de una oficina bancaria).
- **Redes Públicas**: Redes de dominio y acceso general donde cualquier usuario puede conectarse (ej. la red telefónica, Wi-Fi abierta municipal o Internet).
- **Redes Dedicadas**: Redes de titularidad pública o de gran operador pero cuyo uso y acceso están **reservados en exclusiva para un colectivo o comunidad concreta**. Ejemplo paradigmático en España: **RedIRIS** (red académica y científica de universidades y centros de I+D).

### C. Por la Tecnología de Transmisión
- **Redes de Difusión (*Broadcast*)**: Existe un único canal de comunicación físico compartido por todos los nodos. Cada mensaje enviado es recibido por todas las estaciones; cada nodo examina la dirección de destino y descarta la trama si no es para él (ej. Wi-Fi, Ethernet con concentrador/hub).
- **Redes Punto a Punto (*Point-to-Point* / Conmutadas)**: La comunicación se realiza equipo a equipo mediante múltiples enlaces individuales conmutados por switches o routers.

### D. Por la Relación Funcional entre Nodos
- **Cliente / Servidor**: Servidores dedicados ofrecen servicios especializados (web, archivos, DNS, autenticación) y los clientes solicitan y consumen dichos recursos.
- **Punto a Punto (*Peer-to-Peer* / P2P)**: Todos los equipos pueden actuar simultáneamente como clientes y servidores sin jerarquías centrales fijas.

---

## ⚠️ Errores Comunes y Puntos Clave en Taller
- **Confundir la LAN con la conexión WAN**: El router de cabecera delimita la frontera: su interfaz LAN pertenece a la red privada local; su interfaz WAN conecta a la red pública del operador (ISP).
- **Titularidad Dedicada**: Recordar que una red dedicada (como RedIRIS) no es simplemente "una red privada pequeña", sino una gran infraestructura pública reservada a fines de investigación.\n