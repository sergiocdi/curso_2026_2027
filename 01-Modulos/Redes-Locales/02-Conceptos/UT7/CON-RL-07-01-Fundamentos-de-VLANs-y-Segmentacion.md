---
tipo: concepto
modulo: "Redes Locales"
ud: "UD07"
ra_asociados: ["RA3", "RA4"]
tags: [concepto, redes, vlan, segmentacion, switches, broadcast, 8021q]
dificultad: intermedia
estado: revisado
---

# 💡 Concepto: Redes de Área Local Virtuales (VLANs) y Segmentación Lógica

> **Módulo**: [[MOC-Redes-Locales|Redes Locales]] | **UD**: [[UD07-Interconexion-Configuracion-Equipos-Redes-Locales|UD07]] | **RA**: [[RA03-Configuracion-Conmutadores-Routers|RA3]], [[RA04-Direccionamiento-IPv4-IPv6|RA4]]

---

## 📌 1. Concepto Fundamental
Una **VLAN (Virtual Local Area Network - Red de Área Local Virtual)** es una tecnología de conmutación de Capa 2 que permite dividir un switch físico (o un conjunto de switches interconectados) en **múltiples redes lógicas completamente independientes y aisladas**.

En un switch sin configurar, todos los puertos pertenecen por defecto a una única red de difusión (**VLAN 1 predeterminada**). Al crear y asignar VLANs personalizadas, el switch confina el tráfico de difusión y de datos estrictamente dentro de los puertos que pertenezcan a la misma VLAN.

Dos ordenadores conectados al mismo conmutador físico en puertos asignados a diferentes VLANs (por ejemplo, PC1 en VLAN 10 y PC2 en VLAN 20) **NO pueden comunicarse directamente entre sí en Capa 2**, como si estuvieran enchufados a switches físicos totalmente separados en habitaciones distintas.

---

## 🎯 2. Ventajas Principales de las VLANs

1. **Reducción del Dominio de Difusión (Broadcast)**: Cada VLAN constituye un dominio de difusión propio e independiente. El tráfico de broadcast generado en un departamento no afecta al resto.
2. **Seguridad Mejorada**: Aislamiento de datos sensibles (recursos humanos, dirección, servidores críticos) frente a usuarios comunes o alumnos.
3. **Flexibilidad y Ahorro de Costes**: Si un trabajador cambia de oficina física a otra planta del edificio, no hace falta retender cables ni cambiar de switch; basta con reasignar el puerto del switch a su VLAN correspondiente por software.
4. **Gestión Eficiente del Tráfico**: Facilita la aplicación de políticas de Calidad de Servicio (QoS), priorizando la telefonía IP (VLAN de Voz) sobre las descargas de datos.

---

## 🏷️ 3. Rango de Identificadores de VLAN (VLAN ID)

El identificador de una VLAN es un número entero de **12 bits** (lo que permite hasta \(2^{12} = 4096\) valores):
- **VLAN 1**: VLAN predeterminada de fábrica en todos los switches Cisco (no se puede borrar ni renombrar).
- **Rango Normal (VLANs 1 a 1005)**:
  - Rango estándar utilizado en pequeñas y medianas empresas.
  - Las VLANs 1002 a 1005 están reservadas para tecnologías históricas (Token Ring, FDDI).
  - Se guardan en la memoria Flash del switch en el archivo `vlan.dat`.
- **Rango Extendido (VLANs 1006 a 4094)**:
  - Utilizado por proveedores de servicios e infraestructuras empresariales globales.

---

## 💻 4. Creación Básica de VLANs en Cisco IOS

```text
Switch> enable
Switch# configure terminal
Switch(config)# vlan 10
Switch(config-vlan)# name VENTAS
Switch(config-vlan)# exit
Switch(config)# vlan 20
Switch(config-vlan)# name ALUMNOS
Switch(config-vlan)# end
Switch# show vlan brief
```

---

## ⚠️ Errores Comunes y Puntos Clave en Taller
- **Creer que dos VLANs pueden compartir la misma subred IP**: En un diseño correcto de red, **CADA VLAN DEBE TENER SU PROPIA SUBRED IP INDEPENDIENTE** (ej. VLAN 10 = `192.168.10.0/24`, VLAN 20 = `192.168.20.0/24`). Mezclar dos VLANs en la misma subred IP es una aberración arquitectónica.
- **VLAN de Gestión (Management VLAN)**: Se recomienda no utilizar la VLAN 1 para administrar el switch; es una buena práctica de seguridad crear una VLAN dedicada (ej. VLAN 99) para la IP de gestión.
