---
tipo: concepto
modulo: "Redes Locales"
ud: "UD08"
ra_asociados: ["RA5"]
tags: [concepto, redes, mantenimiento-preventivo, documentacion, inventario, tftp, backup]
dificultad: basica
estado: revisado
---

# 💡 Concepto: Documentación de Red, Inventariado y Copias de Seguridad

> **Módulo**: [[MOC-Redes-Locales|Redes Locales]] | **UD**: [[UD08-Mantenimiento-Red-Local-Resolucion-Incidencias|UD08]] | **RA**: [[RA05-Servicios-Red-DHCP-DNS|RA5]]

---

## 📌 1. Concepto Fundamental
El mantenimiento de una red local no se limita a apagar fuegos cuando un cable se rompe (**mantenimiento correctivo**). La labor profesional más valiosa de un técnico de soporte de redes es el **mantenimiento preventivo**: mantener la infraestructura documentada, los elementos etiquetados bajo normativa, las copias de seguridad de las configuraciones actualizadas y los diagramas de red al día.

Una red sin documentar es una red ingobernable: ante una caída de un switch principal en un hospital o centro educativo, no saber qué cables iban a qué VLAN o qué IP tenía el router puede multiplicar el tiempo de parada de 15 minutos a varias horas críticas.

---

## 📄 2. Documentos Esenciales de una Infraestructura de Red

1. **Diagrama de Red Físico**:
   - Muestra la ubicación física real de los equipos en planos del edificio: salas de telecomunicaciones, armarios rack, canalizaciones de cables por paredes y falsos techos, rosetas de pared y tomas de corriente.
2. **Diagrama de Red Lógico**:
   - Muestra la arquitectura de comunicaciones con independencia de su ubicación física: direccionamiento IP por subred, máscaras, identificadores de VLANs, nombres de equipos, interfaces conectadas (ej. `G0/1` a `G0/24`), enlaces troncales y protocolos de enrutamiento activos.
3. **Libro de Registro de Direccionamiento IP (IPAM)**:
   - Tabla que documenta el uso de cada bloque IP: IPs estáticas de servidores, impresoras y switches, rangos dinámicos del pool DHCP y puertas de enlace.
4. **Etiquetado Normalizado (Norma ANSI/TIA-606)**:
   - Todo cable, panel de parcheo y roseta debe llevar una etiqueta adhesiva indeleble en ambos extremos con un código alfanumérico inequívoco.

---

## 💾 3. Copias de Seguridad de Dispositivos Cisco Mediante TFTP

Para respaldar la configuración de un switch o router Cisco hacia un servidor centralizado en la red local se utiliza habitualmente el protocolo **TFTP (Trivial File Transfer Protocol)**:

```text
       ┌──────────────┐                          ┌──────────────────────┐
       │ Switch Cisco │ ──► TFTP (Puerto UDP 69) ──►│ Servidor TFTP (PC)   │
       │ (192.168.1.2)│                          │ (192.168.1.100)      │
       └──────────────┘                          └──────────────────────┘
```

### Comandos de Backup y Restauración en Cisco IOS
```text
:: 1. Hacer copia de seguridad de la configuración a un servidor TFTP
Switch# copy running-config tftp:
Address or remote host []? 192.168.1.100
Destination filename [switch-confg]? SW-AULA102-BACKUP-2026.cfg
!!
[OK - 2048 bytes]

:: 2. Respaldar la imagen completa del sistema operativo IOS (archivo .bin en flash)
Switch# copy flash: tftp:
Source filename []? c2960-lanbasek9-mz.150-2.SE4.bin
Address or remote host []? 192.168.1.100
Destination filename []? c2960-lanbasek9-mz.150-2.SE4.bin
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
[OK - 12450816 bytes]

:: 3. Restaurar la configuración en caso de avería de hardware
Switch# copy tftp: running-config
Address or remote host []? 192.168.1.100
Source filename []? SW-AULA102-BACKUP-2026.cfg
[OK]
Switch# write
```

---

## ⚠️ Errores Comunes y Puntos Clave en Taller
- **Dejar la única copia en la memoria Flash del switch averiado**: Si el switch sufre un fallo en la fuente de alimentación o en la placa base, no se puede acceder a la memoria interna. Las copias de seguridad de configuración deben custodiarse **fuera del dispositivo**, en un servidor centralizado o en la nube del centro.
- **No documentar contraseñas de gestión**: Custodiar las contraseñas de consola y `enable secret` en un gestor corporativo seguro de contraseñas (KeePass, Bitwarden) con acceso restringido al departamento de informática.
