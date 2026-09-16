---
tipo: concepto
modulo: "Redes Locales"
ud: "UD04"
ra_asociados: ["RA1", "RA3"]
tags: [concepto, redes, nivel-1, hub, repetidor, colision, half-duplex]
dificultad: basica
estado: revisado
---

# 💡 Concepto: Dispositivos de Nivel 1. Repetidores y Concentradores (Hubs)

> **Módulo**: [[MOC-Redes-Locales|Redes Locales]] | **UD**: [[UD04-Adaptadores-Dispositivos-Interconexion-Simulacion|UD04]] | **RA**: [[RA01-Arquitectura-Redes|RA1]]

---

## 📌 1. Concepto Fundamental
Los dispositivos de **Nivel 1 (Capa Física)** operan exclusivamente con señales eléctricas, ópticas o electromagnéticas puras (bits). No interpretan el significado de la información que transportan, no leen direcciones MAC ni cabeceras IP y carecen de memoria para almacenar tramas.

### Dispositivos Principales
1. **Repetidor (Repeater)**:
   - Dispositivo de 2 puertos diseñado para superar las limitaciones de distancia máxima impuestas por la atenuación del medio físico.
   - Recibe la señal eléctrica débil y deformada por un puerto, la regenera, la amplifica y la retransmite limpia con su sincronización original por el otro puerto.
2. **Concentrador (Hub / Repetidor multipuerto)**:
   - Dispositivo central con múltiples puertos (4, 8, 16, 24) que conecta varios ordenadores en una topología física en estrella.
   - **Comportamiento operativo**: Cualquier señal de bit que entra por un puerto se replica eléctricamente de forma inmediata y ciega por **absolutamente todos los demás puertos**, independientemente de quién sea el destinatario real.

---

## ⚡ 2. Limitaciones Operativas del Hub

- **Medio Compartido**: Todos los ordenadores conectados a un Hub comparten el mismo ancho de banda total. En un hub de 100 Mbps con 10 equipos transmitiendo, la tasa efectiva por equipo se reduce a unos 10 Mbps.
- **Un único Dominio de Colisión**: Como todos los puertos están unidos eléctricamente en un bus interno, si dos equipos emiten a la vez, las señales colisionan. Cuantos más equipos se conecten a un hub, mayor es la tasa de colisiones y peor el rendimiento global.
- **Inseguridad Física (Sniffing pasivo)**: Al replicarse todo el tráfico por todos los puertos, cualquier equipo conectado al hub con una tarjeta en modo promiscuo (ej. ejecutando Wireshark) puede capturar todas las contraseñas y conversaciones de sus compañeros sin esfuerzo.
- **Operación exclusiva en Half-Duplex**: Los equipos deben escuchar antes de transmitir y usar obligatoriamente CSMA/CD.

---

## ⚠️ Errores Comunes y Puntos Clave en Taller
- **Confundir un Hub con un Switch**: Físicamente pueden tener un aspecto exterior muy parecido (caja metálica con puertos RJ-45). Sin embargo, un Hub es un repetidor pasivo ciego de Capa 1, mientras que un Switch conmuta de forma inteligente en Capa 2 examinando direcciones MAC.
- **Obsolescencia en entornos de producción**: En las redes empresariales actuales los Hubs están completamente desterrados y prohibidos, aunque siguen explicándose en FP para entender el concepto crucial de *dominio de colisión*.
