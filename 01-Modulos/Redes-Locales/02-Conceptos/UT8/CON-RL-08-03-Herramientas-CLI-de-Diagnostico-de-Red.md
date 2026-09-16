---
tipo: concepto
modulo: "Redes Locales"
ud: "UD08"
ra_asociados: ["RA5"]
tags: [concepto, redes, diagnostico, cli, ping, tracert, nslookup, netstat, arp]
dificultad: basica
estado: revisado
---

# 💡 Concepto: Herramientas CLI de Diagnóstico de Red

> **Módulo**: [[MOC-Redes-Locales|Redes Locales]] | **UD**: [[UD08-Mantenimiento-Red-Local-Resolucion-Incidencias|UD08]] | **RA**: [[RA05-Servicios-Red-DHCP-DNS|RA5]]

---

## 📌 1. Concepto Fundamental
Tanto en Windows como en Linux existe un conjunto estándar de utilidades por línea de comandos que permiten auditar, paso a paso y de forma determinista, cada uno de los eslabones de la conectividad de red.

---

## 🛠️ 2. La Secuencia Metódica de Comprobación CLI

Cuando un puesto cliente no se comunica con el exterior, se debe seguir estrictamente este orden de ejecución:

```text
1. ping 127.0.0.1        ──► ¿Funciona la pila TCP/IP del sistema operativo?
         │ (Éxito)
2. ping [Mi propia IP]   ──► ¿La tarjeta de red está activa y configurada?
         │ (Éxito)
3. ping [Gateway local]  ──► ¿Hay conectividad física y enlace con el router local?
         │ (Éxito)
4. ping 8.8.8.8          ──► ¿El router enruta hacia el exterior / Internet?
         │ (Éxito)
5. ping www.google.es    ──► ¿El servicio de resolución de nombres (DNS) traduce IPs?
```

---

## 💻 3. Comandos Esenciales y sus Parámetros

### 1. `ping` (Packet Internet Groper)
Envía paquetes ICMP Echo Request y mide el tiempo de ida y vuelta (**RTT - Round Trip Time**) y el porcentaje de pérdida de paquetes:
- Windows: `ping -t 192.168.1.1` (ping continuo indefinido hasta pulsar `Ctrl+C`).
- Windows: `ping -n 10 192.168.1.1` (envía exactamente 10 paquetes).
- Linux: `ping -c 4 192.168.1.1` (en Linux el ping es continuo por defecto; `-c` limita el número de paquetes).

### 2. `tracert` (Windows) / `traceroute` (Linux)
Muestra la lista de todos los routers intermediarios (**saltos / hops**) por los que pasa un paquete hasta llegar al destino final.
- **Mecanismo**: Envía paquetes sucesivos incrementando el campo TTL de la cabecera IP de 1 en 1 (\(\text{TTL}=1, 2, 3\dots\)), provocando que cada router intermedio descarte el paquete y responda con un mensaje ICMP *Time Exceeded* revelando su propia IP.
- Si aparecen asteriscos (`* * * Tiempo de espera agotado`), indica que ese router o firewall descarta el tráfico ICMP.

### 3. `nslookup` (Name Server Lookup)
Diagnostica el funcionamiento y la respuesta de los servidores DNS:
```cmd
:: Consultar la IP asociada a un nombre de dominio
nslookup www.educastur.es

:: Forzar la consulta contra un servidor DNS específico (ej. los DNS de Google)
nslookup www.educastur.es 8.8.8.8

:: Modo interactivo para consultar registros específicos (MX, CNAME, TXT)
nslookup
> set type=mx
> educastur.es
> exit
```

### 4. `arp` (Address Resolution Protocol Cache)
Inspecciona y limpia la correspondencia entre direcciones IP y MAC en la memoria local:
- `arp -a`: Muestra la tabla de correspondencias IP-MAC aprendidas dinámicamente.
- `arp -d *` (como Administrador): Vacía la tabla ARP para forzar una nueva resolución limpia.

### 5. `netstat` (Network Statistics) / `ss` (Socket Statistics en Linux)
Muestra todas las conexiones de red abiertas, tablas de enrutamiento y puertos TCP/UDP a la escucha:
- Windows: `netstat -ano` (muestra protocolo, IP local, IP remota, estado de conexión y el identificador de proceso PID responsable).
- Linux: `ss -tulpn` (muestra sockets TCP/UDP a la escucha, puertos numéricos y nombres de programas).

---

## ⚠️ Errores Comunes y Puntos Clave en Taller
- **"Tengo conexión a Google pero no abre ninguna página web"**: Típico caso donde `ping 8.8.8.8` funciona pero `ping www.google.es` falla. Diagnóstico: **Fallo en los servidores DNS configurados** en el adaptador (o el servidor DNS local está caído).
- **Firewall bloqueando ICMP**: En Windows 10/11, el firewall bloquea por defecto las respuestas a pings entrantes de otros equipos. Que un PC no responda al ping no significa necesariamente que esté apagado o sin red.
