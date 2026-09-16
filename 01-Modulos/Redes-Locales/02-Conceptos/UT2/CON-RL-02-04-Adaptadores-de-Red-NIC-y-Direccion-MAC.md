---
tipo: concepto
modulo: "Redes Locales"
ud: "UD02"
ra_asociados: ["RA1", "RA2"]
tags: [concepto, redes, nic, mac, adaptadores, eui48, ethernet]
dificultad: basica
estado: revisado
---

# 💡 Concepto: Adaptadores de Red (NIC) y Dirección Física MAC

> **Módulo**: [[MOC-Redes-Locales|Redes Locales]] | **UD**: [[UD02-Elementos-Espacios-Fisicos-Red-Local|UD02]] | **RA**: [[RA01-Arquitectura-Redes|RA1]]

---

## 📌 1. Concepto Fundamental
El **Adaptador de Red** o **Tarjeta de Red (NIC - Network Interface Card)** es el componente hardware que actúa como interfaz entre el bus interno de un equipo informático y el medio de transmisión físico de la red. Trabaja simultáneamente en la Capa 1 (Física: modulación, codificación de línea y conector) y en la Capa 2 (Enlace: formato de tramas y control de acceso al medio).

### Funciones Principales de la NIC
1. **Conversión paralelo-serie**: Convierte las palabras de bits del bus del procesador en un flujo de bits serie sobre el cable o antena.
2. **Encapsulamiento y Desencapsulamiento**: Añade el preámbulo, direcciones MAC de origen y destino, y calcula el campo de comprobación de redundancia cíclica (**CRC/FCS**) para detectar errores.
3. **Almacenamiento intermedio (Buffer)**: Memoriza tramas entrantes y salientes mientras el sistema operativo procesa las interrupciones.

---

## 🏷️ 2. Estructura de la Dirección MAC (EUI-48)

Toda tarjeta de red Ethernet o Wi-Fi lleva grabada de fábrica una dirección física globalmente única denominada **Dirección MAC (Media Access Control)**.

Tiene una longitud de **48 bits (6 bytes)**, expresada comúnmente en 12 dígitos hexadecimales separados por dos puntos (`00:1A:2B:3C:4D:5E`) o guiones (`00-1A-2B-3C-4D-5E`):

```text
[   24 bits (3 bytes)   ] [   24 bits (3 bytes)   ]
├───────────────────────┤ ├───────────────────────┤
│          OUI          │ │    NIC Specific /     │
│  (Organizationally    │ │      Device ID        │
│   Unique Identifier)  │ │ (Número de serie del  │
│   Asignado por IEEE   │ │      fabricante)      │
└───────────────────────┘ └───────────────────────┘
```

- **OUI (24 bits iniciales)**: Código asignado por el IEEE a cada fabricante autorizado (por ejemplo: Cisco, Intel, Realtek, Apple).
- **Identificador de dispositivo (24 bits finales)**: Número de serie correlativo asignado por el propio fabricante a cada chip producido.

### Tipos de Direcciones MAC de Destino
- **Unicast**: Dirigida a un único adaptador concreto (bit I/G en 0).
- **Broadcast**: Enviada a todos los nodos de la red local. Su dirección es `FF:FF:FF:FF:FF:FF` (todos los 48 bits a `1`).
- **Multicast**: Dirigida a un grupo selecto de nodos suscritos a una transmisión (en IPv4 comienza habitualmente por `01:00:5E:...`).

---

## ⚙️ 3. Modos de Operación y Transmisión

- **Simplex**: Transmisión en un único sentido estricto (ej. radio comercial, sensores simples).
- **Half-Duplex**: La comunicación fluye en ambos sentidos pero no simultáneamente (ej. walkie-talkies o redes Ethernet clásicas con Hubs; existe posibilidad de colisión).
- **Full-Duplex**: Transmisión bidireccional simultánea. Requiere enlaces punto a punto sobre switches y al menos dos pares independientes de cobre (uno para TX y otro para RX) o dos hilos de fibra óptica. Desactiva CSMA/CD y duplica el rendimiento teórico.
- **Modo Promiscuo**: Modo especial de la NIC donde el controlador entrega al sistema operativo todas las tramas que circulan por el cable, incluso aquellas cuya dirección MAC de destino no coincide con la suya propia. Esencial para herramientas de análisis de red como **Wireshark**.

---

## ⚠️ Errores Comunes y Puntos Clave en Taller
- **Creer que la MAC cambia al cambiar de red o de router**: La MAC es fija e inherente al hardware físico de la tarjeta; la que cambia según la red a la que te conectes es la dirección lógica IP.
- **MAC Spoofing**: Aunque viene quemada en la ROM (*burned-in address - BIA*), la mayoría de los sistemas operativos permiten suplantar por software el valor transmitido en las tramas.
