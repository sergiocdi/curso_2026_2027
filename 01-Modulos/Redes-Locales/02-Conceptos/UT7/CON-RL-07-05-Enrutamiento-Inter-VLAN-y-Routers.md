---
tipo: concepto
modulo: "Redes Locales"
ud: "UD07"
ra_asociados: ["RA3", "RA4", "RA5"]
tags: [concepto, redes, intervlan, router-on-a-stick, subinterfaces, 8021q, switch-l3]
dificultad: avanzada
estado: revisado
---

# 💡 Concepto: Enrutamiento Inter-VLAN y Arquitectura Router-on-a-Stick

> **Módulo**: [[MOC-Redes-Locales|Redes Locales]] | **UD**: [[UD07-Interconexion-Configuracion-Equipos-Redes-Locales|UD07]] | **RA**: [[RA03-Configuracion-Conmutadores-Routers|RA3]], [[RA04-Direccionamiento-IPv4-IPv6|RA4]]

---

## 📌 1. Concepto Fundamental
Por definición estricta de Capa 2, los dispositivos de diferentes VLANs no pueden comunicarse entre sí. Si un equipo de la **VLAN 10** (ej. Administración, `192.168.10.0/24`) necesita comunicarse con un servidor en la **VLAN 20** (ej. Profesores, `192.168.20.0/24`), el tráfico debe salir obligatoriamente de la Capa 2 y ser procesado por un **dispositivo de Capa 3** mediante **Enrutamiento Inter-VLAN**.

Existen dos arquitecturas predominantes para resolver este problema:
1. **Router-on-a-Stick (Un router externo con un único enlace troncal)**.
2. **Switch de Capa 3 (Conmutador Multicapa con interfaces SVI)**.

---

## 🥢 2. La Arquitectura Router-on-a-Stick

Utilizar un cable físico independiente entre el router y el switch para cada VLAN consumiría rápidamente todas las interfaces del router. 

En su lugar, la técnica **Router-on-a-Stick** utiliza **un único cable físico** configurado como enlace troncal (Trunk 802.1Q). Dentro del router, la interfaz física única se subdivide lógicamente en múltiples **subinterfaces virtuales** (tantas como VLANs existan):

```text
       ┌──────────────┐
       │    ROUTER    │
       │  G0/0.10: 192.168.10.1 (Gateway VLAN 10)
       │  G0/0.20: 192.168.20.1 (Gateway VLAN 20)
       └──────┬───────┘
              │ Enlace Físico Único G0/0 (Troncal 802.1Q)
       ┌──────┴───────┐
       │    SWITCH    │ Puerto G0/1 en modo TRUNK
       └──┬─────────┬─┘
          │ F0/1    │ F0/2 (Puertos en modo ACCESS)
     [ PC-VLAN10 ] [ PC-VLAN20 ]
```

---

## 💻 3. Configuración Paso a Paso de Router-on-a-Stick

### En el Switch:
El puerto conectado al router debe configurarse obligatoriamente como troncal:
```text
Switch(config)# interface gigabitEthernet 0/1
Switch(config-if)# switchport mode trunk
Switch(config-if)# no shutdown
```

### En el Router:
1. Encender la interfaz física principal (sin asignarle dirección IP):
   ```text
   Router(config)# interface gigabitEthernet 0/0
   Router(config-if)# no shutdown
   Router(config-if)# exit
   ```
2. Crear y configurar la subinterfaz para la **VLAN 10**:
   ```text
   Router(config)# interface gigabitEthernet 0/0.10
   :: IMPORTANTE: Indicar el número de VLAN con encapsulation dot1Q antes de poner la IP
   Router(config-subif)# encapsulation dot1Q 10
   Router(config-subif)# ip address 192.168.10.1 255.255.255.0
   Router(config-subif)# exit
   ```
3. Crear y configurar la subinterfaz para la **VLAN 20**:
   ```text
   Router(config)# interface gigabitEthernet 0/0.20
   Router(config-subif)# encapsulation dot1Q 20
   Router(config-subif)# ip address 192.168.20.1 255.255.255.0
   Router(config-subif)# exit
   ```

---

## ⚡ 4. Alternativa Empresarial: Switch de Capa 3 (Multicapa)

En redes de gran tamaño, Router-on-a-Stick puede crear un cuello de botella (*bottleneck*) en el enlace único al router. Los **switches de Capa 3 (ej. Cisco 3560/3650)** realizan el enrutamiento inter-VLAN por hardware a velocidad de gigabits:

```text
:: Activar la función de enrutamiento en el switch
Switch-L3(config)# ip routing

:: Crear la interfaz virtual de la VLAN 10 y asignarle IP
Switch-L3(config)# interface vlan 10
Switch-L3(config-if)# ip address 192.168.10.1 255.255.255.0
Switch-L3(config-if)# no shutdown

:: Crear la interfaz virtual de la VLAN 20 y asignarle IP
Switch-L3(config)# interface vlan 20
Switch-L3(config-if)# ip address 192.168.20.1 255.255.255.0
Switch-L3(config-if)# no shutdown
```

---

## ⚠️ Errores Comunes y Puntos Clave en Taller
- **Intentar poner la IP antes del comando `encapsulation dot1Q`**: En los routers Cisco, si intentas ejecutar `ip address` en una subinterfaz sin haber definido antes `encapsulation dot1Q <vlan_id>`, IOS rechazará el comando con un mensaje de error explícito.
- **Olvidar configurar la Puerta de Enlace en los PCs**: Los equipos de la VLAN 10 deben tener como Default Gateway la IP `192.168.10.1`; si lo dejan en blanco, nunca podrán enviar paquetes a la VLAN 20 ni a Internet.
