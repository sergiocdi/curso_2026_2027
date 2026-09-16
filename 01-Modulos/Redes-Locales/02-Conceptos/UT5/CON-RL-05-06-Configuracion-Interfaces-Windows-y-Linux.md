---
tipo: concepto
modulo: "Redes Locales"
ud: "UD05"
ra_asociados: ["RA4"]
tags: [concepto, redes, configuracion-ip, windows, linux, cli, ipconfig, ip-addr, netplan]
dificultad: basica
estado: revisado
---

# 💡 Concepto: Configuración de Interfaces de Red en Windows y Linux

> **Módulo**: [[MOC-Redes-Locales|Redes Locales]] | **UD**: [[UD05-Protocolo-IP-Configuracion-Interfaces|UD05]] | **RA**: [[RA04-Direccionamiento-IPv4-IPv6|RA4]]

---

## 📌 1. Concepto Fundamental
Para que un sistema operativo pueda comunicarse en una red IP, su interfaz de red (física o virtual) debe contar con cuatro parámetros obligatorios:
1. **Dirección IP**: Identificador único en la subred.
2. **Máscara de Subred**: Delimita qué parte de la IP identifica a la red y qué parte al host.
3. **Puerta de Enlace Predeterminada (Default Gateway)**: IP del router por donde salir a redes exteriores e Internet.
4. **Servidores DNS**: Direcciones IP de los servidores que traducen nombres de dominio legibles (`www.educastur.es`) a direcciones IP numéricas.

---

## 💻 2. Comandos y Métodos en Microsoft Windows

### Consulta y Diagnóstico por Consola (CMD / PowerShell)
```cmd
:: Mostrar configuración básica de interfaces
ipconfig

:: Mostrar configuración completa (MAC, DHCP, DNS, concesión)
ipconfig /all

:: Liberar la dirección IP asignada por DHCP
ipconfig /release

:: Solicitar una nueva concesión de IP al servidor DHCP
ipconfig /renew

:: Vaciar la caché local de resolución DNS
ipconfig /flushdns
```

### Configuración Estática por PowerShell (Como Administrador)
```powershell
# Asignar IP estática, máscara y puerta de enlace
New-NetIPAddress -InterfaceAlias "Ethernet" -IPAddress 192.168.1.50 -PrefixLength 24 -DefaultGateway 192.168.1.1

# Configurar servidores DNS primario y secundario
Set-DnsClientServerAddress -InterfaceAlias "Ethernet" -ServerAddresses ("8.8.8.8","1.1.1.1")
```

---

## 🐧 3. Comandos y Métodos en GNU/Linux

En las distribuciones modernas de Linux se utiliza la suite **`iproute2`** (sustituyendo a las herramientas obsoletas `ifconfig` y `route` de `net-tools`):

### Consulta y Gestión Temporal Inmediata (CLI)
```bash
# Mostrar todas las interfaces y sus direcciones IP asociadas
ip addr show
# (O forma abreviada)
ip a

# Ver el estado físico de los enlaces (UP/DOWN) y direcciones MAC
ip link show

# Mostrar la tabla de rutas del kernel y la puerta de enlace
ip route show

# Encender o apagar una interfaz
sudo ip link set dev eth0 up
sudo ip link set dev eth0 down

# Asignar una IP temporalmente a una interfaz
sudo ip addr add 192.168.1.50/24 dev eth0

# Asignar una puerta de enlace por defecto
sudo ip route add default via 192.168.1.1 dev eth0
```

### Configuración Persistente en Ubuntu Server (Netplan)
Fichero de configuración: `/etc/netplan/01-netcfg.yaml`:
```yaml
network:
  version: 2
  renderer: networkd
  ethernets:
    eth0:
      dhcp4: no
      addresses:
        - 192.168.1.50/24
      routes:
        - to: default
          via: 192.168.1.1
      nameservers:
        addresses: [8.8.8.8, 1.1.1.1]
```
Para aplicar los cambios:
```bash
sudo netplan try
sudo netplan apply
```

---

## ⚠️ Errores Comunes y Puntos Clave en Taller
- **Conflicto de IP (Duplicidad)**: Si se asigna manualmente una IP estática que ya está ocupada por otro equipo o concedida por el DHCP, se producirá un conflicto de IP; en Windows aparece un aviso y la interfaz queda desconectada o inutilizada.
- **YAML estricto en Netplan**: Los ficheros de Netplan no admiten tabuladores; deben indentarse exclusivamente con espacios (generalmente 2 espacios por nivel). Un tabulador genera error de parseo.
