---
tipo: concepto
modulo: "Redes Locales"
ud: "UD07"
ra_asociados: ["RA3", "RA4"]
tags: [concepto, redes, switchport, trunk, access, 8021q, vlan-tag]
dificultad: intermedia
estado: revisado
---

# 💡 Concepto: Puertos de Acceso y Enlaces Troncales (Trunk) con IEEE 802.1Q

> **Módulo**: [[MOC-Redes-Locales|Redes Locales]] | **UD**: [[UD07-Interconexion-Configuracion-Equipos-Redes-Locales|UD07]] | **RA**: [[RA03-Configuracion-Conmutadores-Routers|RA3]], [[RA04-Direccionamiento-IPv4-IPv6|RA4]]

---

## 📌 1. Concepto Fundamental
En una red conmutada con VLANs, los puertos de los conmutadores se configuran en dos modos de funcionamiento radicalmente distintos:

1. **Puerto de Acceso (Access Port)**:
   - Conecta a un **dispositivo final** (PC, impresora, servidor estándar).
   - Pertenece a **una única VLAN específica**.
   - Las tramas que entran y salen por este puerto son **tramas estándar sin etiquetar (Untagged)**. El PC desconoce por completo que existe una VLAN.
2. **Puerto Troncal (Trunk Port)**:
   - Conecta **dos dispositivos de red entre sí** (Switch a Switch, o Switch a Router/AP).
   - Puede transportar simultáneamente el tráfico de **múltiples VLANs** a través de un único cable físico.
   - Para que el switch receptor sepa a qué VLAN pertenece cada trama que viaja por el tronco, se utiliza el estándar de etiquetado **IEEE 802.1Q**.

---

## 🏷️ 2. El Estándar IEEE 802.1Q (Etiquetado de Tramas)

IEEE 802.1Q inserta un campo de **4 bytes (32 bits)** dentro de la cabecera de la trama Ethernet estándar (justo entre la dirección MAC de origen y el campo EtherType):

```text
Cabecera Ethernet: [ MAC Destino ] [ MAC Origen ] [ Tag 802.1Q (4B) ] [ EtherType ] [ Datos ] [ FCS ]
                                                        │
┌──────────────────────────┬──────────────┬─────────────┴─────────────────────────────┐
│  TPID (16 bits: 0x8100)  │  PCP (3 bits)│  DEI (1 bit) │      VLAN ID (VID - 12 bits) │
└──────────────────────────┴──────────────┴──────────────┴────────────────────────────┘
```

- **TPID (Tag Protocol Identifier)**: Fijado a `0x8100` para indicar que la trama contiene etiqueta 802.1Q.
- **PCP (Priority Code Point - 3 bits)**: Prioridad de Calidad de Servicio (QoS de Capa 2).
- **VLAN ID (VID - 12 bits)**: El número identificador de la VLAN a la que pertenece la trama (1 a 4094).

### Concepto de VLAN Nativa (Native VLAN)
- En un enlace troncal 802.1Q, la **VLAN Nativa** (por defecto la VLAN 1) es la única VLAN cuyo tráfico **viaja SIN ETIQUETAR (Untagged)** a través del tronco.
- **Regla crítica**: Ambos extremos del enlace troncal deben tener configurada exactamente la misma VLAN nativa; de lo contrario, se produce una discordancia (*native VLAN mismatch*) que mezcla el tráfico de dos VLANs distintas.

---

## 💻 3. Comandos de Configuración en Cisco IOS

### Configurar un Puerto en Modo Acceso (para un PC)
```text
Switch(config)# interface fastEthernet 0/1
Switch(config-if)# switchport mode access
Switch(config-if)# switchport access vlan 10
Switch(config-if)# no shutdown
```

### Configurar un Puerto en Modo Troncal (unión a otro Switch o Router)
```text
Switch(config)# interface gigabitEthernet 0/1
Switch(config-if)# switchport mode trunk
:: Opcional: restringir qué VLANs pueden cruzar el enlace
Switch(config-if)# switchport trunk allowed vlan 10,20,30
:: Opcional: cambiar la VLAN nativa por seguridad
Switch(config-if)# switchport trunk native vlan 99
```

### Verificación del Troncal
```text
Switch# show interfaces trunk
```

---

## ⚠️ Errores Comunes y Puntos Clave en Taller
- **Conectar dos switches con puertos en modo Access**: Si unes dos switches por un cable enchufado a puertos configurados en modo Access en VLAN 1, sólo cruzará la VLAN 1; las tramas de la VLAN 10 o 20 no podrán pasar al otro switch.
- **DTP (Dynamic Trunking Protocol)**: Los switches Cisco intentan negociar el modo troncal automáticamente por defecto. En producción se recomienda deshabilitar la negociación (`switchport nonegotiate`) y forzar estáticamente los puertos a `access` o `trunk`.
