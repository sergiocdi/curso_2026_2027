---
tipo: concepto
modulo: "Redes Locales"
ud: "UD01"
ra_asociados: ["RA1"]
tags: [concepto, redes, lan, componentes, hosts, switches, routers, rack, canaletas]
dificultad: basica
estado: revisado
---

# 💡 Concepto: Componentes y Elementos de una Red de Área Local (LAN)

> **Módulo**: [[MOC-Redes-Locales|Redes Locales]] | **UD**: [[UD01-Introduccion-Redes-Locales-Caracterizacion|UD01]] | **RA**: [[RA01-Arquitectura-Redes|RA1]]

---

## 📌 1. Definición y Características de una LAN
Una **Red de Área Local (LAN - Local Area Network)** es un conjunto integrado de elementos hardware (físicos) y software (lógicos) que proporcionan conectividad e intercambio de datos entre ordenadores y dispositivos en un área geográfica restringida (vivienda, aula de informática, oficina o edificio comercial).

### Rasgos Distintivos de una LAN:
1. **Restricción Geográfica**: Limitada al ámbito del edificio o recinto local (< 1 km).
2. **Altas Velocidades de Transferencia**: Típicamente entre 1 Gbps (Gigabit Ethernet) y 10 Gbps.
3. **Cableado e Infraestructura Dedicada y Específica**: Despliegue propio de par trenzado (UTP/STP) o fibra óptica multimodo/monomodo.
4. **Titularidad Privada**: Toda la electrónica y el cableado pertenecen a la misma entidad propietaria.
5. **Baja Tasa de Error y Alta Fiabilidad**: Al no depender de líneas remotas públicas compartidas, la degradación de señal es prácticamente nula.
6. **Capacidad de Interconexión**: Preparada para conectarse al exterior y con otras LANs a través de routers.

---

## 🧱 2. Catálogo de Componentes de una LAN

### A. Equipos Terminales y Servidores:
- **Dispositivos Finales (*Hosts* o Nodos)**: Estaciones de trabajo, PCs de escritorio, portátiles, tablets, teléfonos IP y smartphones que originan o reciben comunicaciones de usuario.
- **Servidores Dedicados**: Ordenadores de alta disponibilidad que proporcionan servicios centrales a la red:
  - Servidores de archivos (NAS, SMB/NFS).
  - Servidores de resolución de nombres (DNS) y configuración automática IP (DHCP).
  - Servidores Web (HTTP/HTTPS) y correo corporativo.
  - Servidores de autenticación y directorio activo (LDAP, Active Directory).
- **Periféricos Compartidos de Red**: Impresoras de red con tarjeta de red integrada y cabinas de almacenamiento compartido.

### B. Adaptadores de Red (NIC - Network Interface Card):
- Elemento hardware indispensable que conecta físicamente el equipo con el medio de transmisión.
- Convierte el flujo paralelo de datos del bus interno del ordenador en señales serie adaptadas al medio físico.
- Incorpora de fábrica una **dirección MAC (Media Access Control)** única en el mundo de 48 bits grabada en su firmware (ROM).

### C. Infraestructura Pasiva de Cableado y Armarios:
- **Medios Guiados**: Cables de par trenzado (Categorías 5e, 6, 6A) con conectores RJ-45, y cables de fibra óptica.
- **Canalizaciones y Rosetas**: Canaletas técnicas de plástico o aluminio sobre pared/suelo y tomas hembra RJ-45 de pared (*keystone jacks*).
- **Paneles de Parcheo (*Patch Panels*)**: Módulos instalados en rack donde confluyen todos los cables procedentes de las rosetas del aula, permitiendo reconfigurar enlaces con latiguillos (*patch cords*).
- **Armarios de Comunicaciones (*Racks*)**: Estructuras metálicas estandarizadas de 19 pulgadas para alojar ordenadamente paneles, switches, routers, bandejas y sistemas SAI.

### D. Dispositivos Activos de Interconexión:
- **Concentrador (*Hub*)**: Dispositivo pasivo de nivel físico (Capa 1). Replica eléctricamente toda señal entrante por todos sus puertos; genera colisiones y satura el medio. En desuso.
- **Conmutador (*Switch*)**: Dispositivo inteligente de nivel de enlace (Capa 2). Aprende las direcciones MAC de los equipos conectados a cada puerto y conmuta las tramas exclusivamente hacia el puerto del destinatario, creando dominios de colisión individuales.
- **Enrutador (*Router*)**: Dispositivo de nivel de red (Capa 3). Interconecta redes lógicas IP distintas (ej. la LAN con Internet WAN) y decide la mejor ruta para los paquetes mediante tablas de enrutamiento.
- **Punto de Acceso Wi-Fi (*AP*)**: Puente inalámbrico que permite a dispositivos con tarjetas Wi-Fi integrarse en la red cableada Ethernet.
- **Repetidores y PLCs**: Dispositivos para regenerar señales atenuadas o extender la red aprovechando la red eléctrica doméstica.

---

## ⚠️ Errores Comunes y Puntos Clave en Taller
- **Confundir Switch con Router**: En el hogar se suele llamar erróneamente "el router" al equipo del ISP, el cual es en realidad un equipo multipropósito que integra un switch de 4 puertos, un punto de acceso Wi-Fi, un módem ONT y el propio router en una única caja.
- **Función del Patch Panel**: Los cables rígidos de las canaletas nunca van directamente enchufados a las bocas del switch; se conectan por detras del panel de parcheo y se unen al switch mediante latiguillos flexibles para proteger las instalaciones de tirones y roturas.\n