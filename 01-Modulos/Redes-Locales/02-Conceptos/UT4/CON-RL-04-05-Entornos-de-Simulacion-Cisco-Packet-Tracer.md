---
tipo: concepto
modulo: "Redes Locales"
ud: "UD04"
ra_asociados: ["RA1", "RA3"]
tags: [concepto, redes, simulacion, packet-tracer, cisco, pdu]
dificultad: basica
estado: revisado
---

# 💡 Concepto: Herramientas de Simulación de Redes. Cisco Packet Tracer

> **Módulo**: [[MOC-Redes-Locales|Redes Locales]] | **UD**: [[UD04-Adaptadores-Dispositivos-Interconexion-Simulacion|UD04]] | **RA**: [[RA01-Arquitectura-Redes|RA1]], [[RA03-Configuracion-Conmutadores-Routers|RA3]]

---

## 📌 1. Concepto Fundamental
En la enseñanza y práctica de redes informáticas, montar escenarios físicos reales con decenas de routers, conmutadores, servidores y cables requiere cuantiosos recursos hardware y un tiempo considerable de montaje.

Las **herramientas de simulación y emulación de redes** permiten diseñar, configurar y analizar topologías de red virtuales complejas de forma inmediata y segura:
- **Cisco Packet Tracer**: Software de simulación didáctico desarrollado por Cisco Networking Academy que modela el comportamiento del hardware, los protocolos y el sistema operativo Cisco IOS.
- **GNS3 / EVE-NG**: Entornos de emulación profesional que ejecutan imágenes binarias reales de sistemas operativos de red (*firmwares* reales).

---

## 🖥️ 2. Interfaz y Modos de Trabajo en Packet Tracer

### Modos de Operación
1. **Modo Tiempo Real (Realtime Mode)**:
   - Los dispositivos y protocolos responden al instante, simulando el comportamiento real del taller (los temporizadores de STP, convergencia de tablas ARP y rutas dinámicas transcurren en tiempo continuo).
2. **Modo Simulación (Simulation Mode)**:
   - Detiene el flujo temporal de la red y permite avanzar paso a paso (*step-by-step*).
   - **Ventaja didáctica extraordinaria**: Permite abrir cualquier "sobre" (PDU) que viaja por el cable y ver detalladamente cómo cambian las cabeceras en cada una de las 7 capas del modelo OSI (In Layers / Out Layers).

### Tipos de Dispositivos y Conexiones en el Panel Inferior
- **Dispositivos de Red**: Routers (ej. Cisco 1941, 2901, 2911, 4321), Switches (ej. Cisco 2960 de Capa 2, 3560/3650 Multicapa), Hubs, Puntos de Acceso inalámbricos.
- **Dispositivos Finales (End Devices)**: PC, Laptop, Servidor (con servicios HTTP, DHCP, DNS integrados), Impresora de red.
- **Conexiones (Cableado)**:
  - Rayo naranja (*Automatically Choose Connection Type*): Selecciona el cable automáticamente (útil al inicio, pero desaconsejado para dominar los tipos de interfaz).
  - Cable directo de cobre (línea negra continua): Conecta PC a Switch, Switch a Router.
  - Cable cruzado de cobre (línea discontinua): Conecta PC a PC, PC a Router, Switch a Switch.
  - Fibra óptica (línea naranja).
  - Cable de consola (línea celeste): Conecta el puerto serie/USB del PC de administración al puerto `Console` del router o switch.

---

## 🔍 3. Prueba de Conectividad Inicial: Simple PDU (Ping)

1. Seleccionar la herramienta del sobre cerrado (**Add Simple PDU - Tecla P**).
2. Hacer clic sobre el equipo de origen (ej. PC0) y seguidamente sobre el equipo de destino (ej. PC1).
3. En la esquina inferior derecha aparece la ventana de estado:
   - **Successful**: Conectividad verificada en Capa 3 (ICMP Echo Request y Echo Reply correctos).
   - **Failed**: Problemas de direccionamiento IP, máscara incompatible, falta de puerta de enlace o puerto apagado (*shutdown*).

> [!TIP]
> En la primera prueba de ping en Packet Tracer, es normal que el primer paquete falle (**Failed**) y los siguientes tengan éxito (**Successful**). Esto se debe a que el switch tarda unos segundos en resolver la dirección física mediante una petición **ARP**.

---

## ⚠️ Errores Comunes y Puntos Clave en Taller
- **Olvidar encender la interfaz del router**: En los switches Cisco los puertos vienen encendidos por defecto (`up`); en los routers Cisco vienen **apagados administrativamente (`administratively down`)** por seguridad y es imprescindible ejecutar `no shutdown` en el CLI.
- **Luces de enlace (Link Lights)**:
  - Verde: Enlace activo y operativo.
  - Ámbar parpadeante: El protocolo Spanning Tree (STP) está en fase de escucha/aprendizaje (tarda unos 30-50 segundos en ponerse verde).
  - Rojo: Enlace caído, cable incorrecto o interfaz apagada.
