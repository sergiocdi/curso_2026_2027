---
tipo: concepto
modulo: "Redes Locales"
ud: "UD06"
ra_asociados: ["RA3"]
tags: [concepto, redes, redes-mixtas, wlan, vlan, poe, integracion, ap]
dificultad: intermedia
estado: revisado
---

# 💡 Concepto: Integración de Redes Mixtas (Cableadas e Inalámbricas)

> **Módulo**: [[MOC-Redes-Locales|Redes Locales]] | **UD**: [[UD06-Redes-Inalambricas-Mixtas|UD06]] | **RA**: [[RA03-Configuracion-Conmutadores-Routers|RA3]]

---

## 📌 1. Concepto Fundamental
En la actualidad prácticamente ninguna organización opera de forma exclusivamente cableada ni exclusivamente inalámbrica. Una **Red Mixta** combina la velocidad, estabilidad y seguridad del cableado estructurado Ethernet con la movilidad y flexibilidad del acceso Wi-Fi.

El Punto de Acceso (AP) actúa como un **puente de Capa 2 (Bridge 802.11 a 802.3)**:
- Recibe las tramas inalámbricas 802.11 emitidas por portátiles y móviles a través de sus antenas.
- Extrae la carga útil del paquete IP y retira la cabecera Wi-Fi.
- Reencapsula el paquete en una trama cableada Ethernet estándar (IEEE 802.3) y la inyecta a través de su puerto RJ-45 hacia el switch del rack.

---

## 🔌 2. Tecnologías Clave de Integración

### A. Alimentación a través de Ethernet (PoE - Power over Ethernet)
Permite suministrar alimentación eléctrica continua a los puntos de acceso directamente a través del mismo cable de red UTP de datos, eliminando la necesidad de instalar enchufes de 230V en falsos techos o pasillos:
- **IEEE 802.3af (PoE estándar)**: Suministra hasta **15,4 W** por puerto.
- **IEEE 802.3at (PoE+ / PoE Plus)**: Suministra hasta **30 W** por puerto (habitual para APs Wi-Fi 6 con múltiples radios de alta potencia).
- **IEEE 802.3bt (PoE++ / 4PPoE)**: Suministra hasta **60 W o 90 W** por puerto.

### B. Segmentación mediante Múltiples SSIDs y VLANs (802.1Q)
Un único punto de acceso profesional puede emitir varios nombres de red (SSIDs) simultáneamente y mapear cada uno de ellos a una red virtual (**VLAN**) completamente aislada en el switch de la red cableada:

```text
[ Móvil Invitado ]  ──► SSID: "INVITADOS" ──┐
                                            ├──► [ AP ] ──► [ Enlace Trunk 802.1Q ] ──► [ Switch ]
[ Portátil Profe ]  ──► SSID: "DOCENTES"  ──┘                 VLAN 20 (Invitados)          │
                                                              VLAN 10 (Docentes)           ├──► VLAN 10 (Intranet)
                                                                                           └──► VLAN 20 (Internet solo)
```

1. **SSID 1: "CIFP-Corporativa"** \(\implies\) Mapeado a **VLAN 10**: Acceso a servidores internos, impresoras y carpetas compartidas. Autenticación WPA2/WPA3 Enterprise (802.1X).
2. **SSID 2: "CIFP-Invitados"** \(\implies\) Mapeado a **VLAN 20**: Aislamiento total de clientes, sin acceso a la intranet del centro y con salida exclusiva a Internet filtrada por portal cautivo.

---

## ⚠️ Errores Comunes y Puntos Clave en Taller
- **Conectar un AP multirred a un puerto en modo Access**: Si el AP emite varios SSIDs asociados a diferentes VLANs, el puerto del switch donde se enchufa el AP debe configurarse obligatoriamente como **puerto troncal (Trunk)** para poder transportar las tramas etiquetadas (*tagged*) con el estándar IEEE 802.1Q.
- **Sobrecarga de balanceo de PoE**: Antes de conectar 12 APs PoE a un switch de 24 puertos en el rack, verificar el presupuesto de potencia total (**Power Budget**) del switch (ej. un switch de 180W no puede alimentar 12 APs de 25W PoE+ simultáneamente).
