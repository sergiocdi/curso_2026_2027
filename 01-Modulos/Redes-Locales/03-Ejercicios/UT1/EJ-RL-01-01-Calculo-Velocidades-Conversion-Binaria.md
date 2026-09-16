---
tipo: ejercicio
modulo: "Redes Locales"
ud: "UD01"
ra_asociados: ["RA1"]
ce_asociados: ["CE1.a"]
tipo_actividad: "evaluable"
tipo_ejercicio: "calculo_procedimental"
dificultad: "media"
tiempo_estimado_min: 50
herramientas: ["Calculadora", "Cuaderno / Editor de texto"]
---

# 💻 Ejercicio 1: Cálculo de Transmisión de Datos y Conversión Numérica en Redes

> **Módulo**: [[MOC-Redes-Locales|Redes Locales (SMR)]] | **Unidad**: [[UD01-Introduccion-Redes-Locales-Caracterizacion|UT1]] | **RA**: `RA1 (CE1.a)` | **Tiempo estimado**: `50 min`

---

## 🎯 Objetivos de la Actividad
1. Comprender y aplicar la diferencia técnica fundamental entre **bits por segundo (bps)** y **bytes por segundo (B/s)**.
2. Manejar con soltura los prefijos decimales del SI ($10^3, 10^6$) y binarios de la IEC ($2^{10}, 2^{20}$).
3. Realizar conversiones entre los sistemas de numeración **decimal**, **binario** y **hexadecimal** aplicados a la informática de redes (octetos, máscaras y direcciones físicas MAC).
4. Calcular tiempos teóricos de transferencia en distintos enlaces de telecomunicaciones considerando la sobrecarga (*overhead*).

---

## 📋 Enunciado

### Parte 1: Conversión Numérica Aplicada a Redes (20 puntos)

En el taller de redes encontramos una máquina cliente conectada a un conmutador. Se han obtenido los siguientes datos del adaptador:
* Dirección MAC de la tarjeta de red: `00:1A:2B:3C:4D:5E`
* Primer octeto de la dirección IPv4: `192` en decimal.
* Máscara de subred recibida: `11111111.11111111.11111111.00000000` en binario.

**Responde a las siguientes cuestiones:**
1. Convierte la dirección MAC completa a su representación binaria continua (los 48 bits que viajan por el cable).
2. Convierte el número decimal `192` a binario y a hexadecimal mostrando el procedimiento de cálculo (divisiones sucesivas o suma de potencias de 2).
3. Pasa cada uno de los 4 octetos de la máscara binaria a notación decimal separada por puntos (Dotted Decimal Notation). ¿Qué longitud de prefijo CIDR representa (`/X`)?
4. Si un switch recibe una trama con la dirección física de destino en binario:
   `11111111 11111111 11111111 11111111 11111111 11111111`
   ¿Cuál es su valor en hexadecimal? ¿A qué tipo de dirección física corresponde (Unicast, Multicast o Broadcast)?

---

### Parte 2: Unidades de Capacidad y Tasas de Transferencia (30 puntos)

Muchos usuarios confunden la velocidad contratada con su ISP (en megabits por segundo) con la velocidad de descarga que muestran sus navegadores (en megabytes por segundo o mebibytes por segundo).

1. Un taller de informática contrata una conexión de fibra óptica de **600 Mbps simétricos**:
   - ¿Cuál es la tasa máxima teórica de descarga expresada en **Megabytes por segundo (MB/s)**?
   - ¿Cuál es la tasa si la expresamos en **Mebibytes por segundo (MiB/s)**?
2. Si disponemos de una memoria USB con una imagen ISO del sistema operativo Debian de **4,7 GB (gigabytes decimales)**:
   - ¿Cuántos bits contiene la imagen ISO completa?
   - ¿Cuánto tiempo (en segundos y minutos) tardaría teóricamente en descargarse a través del enlace de 600 Mbps, asumiendo un 100% de eficiencia?
3. En las redes reales de tipo Ethernet, existe una sobrecarga de protocolos (cabeceras Ethernet, IP, TCP y retransmisiones) que suele reducir la velocidad efectiva (*throughput*) útil alrededor de un **12%**:
   - Calcula la tasa de transferencia real aproximada (en MB/s).
   - ¿Cuál será el tiempo real estimado para descargar el archivo de 4,7 GB?

---

### Parte 3: Comparativa de Tecnologías de Red (30 puntos)

Completa la siguiente tabla calculando el tiempo teórico de transferencia de un archivo de copia de seguridad de **1,2 GB** a través de distintos enlaces de red locales y de área amplia:

| Tecnología de Conexión | Ancho de Banda Nominal | Velocidad en MB/s | Tiempo Teórico (Segundos) |
| :--- | :--- | :--- | :--- |
| **Fast Ethernet** | 100 Mbps | | |
| **Gigabit Ethernet (1000Base-T)** | 1000 Mbps (1 Gbps) | | |
| **Wi-Fi 4 (802.11n)** | 150 Mbps | | |
| **Enlace WAN ADSL antiguo** | 10 Mbps de bajada | | |
| **Fibra XGS-PON empresarial** | 10 Gbps | | |

---

### Parte 4: Pregunta de Razonamiento Crítico (20 puntos)

Un alumno descarga un videojuego de 50 GB desde una plataforma online. Aunque dispone de una conexión de fibra de 1 Gbps (1000 Mbps), el cliente de descarga marca constantemente una velocidad de 25 MB/s.
* ¿A qué tasa en Mbps equivalen esos 25 MB/s?
* Enumera al menos **tres factores ajenos a la velocidad contratada del router** que justifiquen por qué la descarga no alcanza los ~120 MB/s teóricos.

---

## 🔑 Solución Modelo (Profesor Sergio)

> [!NOTE]- Ver Solución Detallada (Haz clic para desplegar)
> ### Solución Parte 1: Conversión Numérica
> 1. **MAC `00:1A:2B:3C:4D:5E` a binario (4 bits por dígito hex):**
>    - `00` = `0000 0000`
>    - `1A` = `0001 1010` ($1=0001, A=10=1010$)
>    - `2B` = `0010 1011` ($2=0010, B=11=1011$)
>    - `3C` = `0011 1100` ($3=0011, C=12=1100$)
>    - `4D` = `0100 1101` ($4=0100, D=13=1101$)
>    - `5E` = `0101 1110` ($5=0101, E=14=1110$)
>    - **Binario continuo**: `000000000001101000101011001111000100110101011110`
> 
> 2. **Conversión de 192:**
>    - Potencias de 2: $128 + 64 = 192$.
>    - **Binario**: `11000000`
>    - En hex: agrupando en nibbles de 4 bits (`1100` y `0000`) $\rightarrow$ $12 =$ `C`, $0 =$ `0` $\rightarrow$ **Hex**: `0xC0`.
> 
> 3. **Máscara `11111111.11111111.11111111.00000000`:**
>    - $11111111_2 = 128+64+32+16+8+4+2+1 = 255_{10}$.
>    - Notación decimal: `255.255.255.0`.
>    - Como hay 24 unos consecutivos, la longitud CIDR es **/24**.
> 
> 4. **Trama con todos unos `1111...1111`:**
>    - En hexadecimal: `FF:FF:FF:FF:FF:FF`.
>    - Corresponde a la dirección física de **Difusión / Broadcast** a nivel de enlace (Capa 2). Todos los equipos del dominio de colisión/broadcast deben procesarla.
> 
> ---
> 
> ### Solución Parte 2: Unidades y Tasas
> 1. **Conexión de 600 Mbps:**
>    - En MB/s decimal: $600 / 8 = \mathbf{75\text{ MB/s}}$.
>    - En MiB/s binario: $600\text{ Mbps} = 600.000.000\text{ bits/s} = 75.000.000\text{ bytes/s}$.
>      $75.000.000 / (1024 \times 1024) = 75.000.000 / 1.048.576 \approx \mathbf{71,53\text{ MiB/s}}$.
> 
> 2. **Archivo Debian ISO de 4,7 GB:**
>    - En bits: $4,7\text{ GB} = 4,7 \times 10^9\text{ bytes} \times 8\text{ bits} = \mathbf{37.600.000.000\text{ bits}}$ ($37,6\text{ Gbits}$).
>    - Tiempo teórico: $t = \frac{37.600.000.000\text{ bits}}{600.000.000\text{ bps}} = \mathbf{62,67\text{ segundos}} \approx \mathbf{1\text{ minuto y } 2,67\text{ segundos}}$.
> 
> 3. **Con 12% de sobrecarga (eficiencia del 88%):**
>    - Tasa real: $75\text{ MB/s} \times 0,88 = \mathbf{66\text{ MB/s}}$ ($528\text{ Mbps útiles}$).
>    - Tiempo real: $4.700\text{ MB} / 66\text{ MB/s} \approx \mathbf{71,21\text{ segundos}} \approx \mathbf{1\text{ minuto y } 11\text{ segundos}}$.
> 
> ---
> 
> ### Solución Parte 3: Tabla Comparativa (1,2 GB = 9.600 Mbits = 1.200 MB)
> 
> | Tecnología | Ancho de Banda | Velocidad MB/s | Tiempo Teórico |
> | :--- | :--- | :--- | :--- |
> | **Fast Ethernet** | 100 Mbps | $100/8 = 12,5\text{ MB/s}$ | $1.200 / 12,5 = \mathbf{96\text{ s}}$ (1m 36s) |
> | **Gigabit Ethernet** | 1000 Mbps | $1000/8 = 125\text{ MB/s}$ | $1.200 / 125 = \mathbf{9,6\text{ s}}$ |
> | **Wi-Fi 4** | 150 Mbps | $150/8 = 18,75\text{ MB/s}$ | $1.200 / 18,75 = \mathbf{64\text{ s}}$ (1m 4s) |
> | **ADSL** | 10 Mbps | $10/8 = 1,25\text{ MB/s}$ | $1.200 / 1,25 = \mathbf{960\text{ s}}$ (16m 0s) |
> | **Fibra XGS-PON** | 10 Gbps ($10.000\text{ Mbps}$) | $10.000/8 = 1.250\text{ MB/s}$ | $1.200 / 1250 = \mathbf{0,96\text{ s}}$ |
> 
> ---
> 
> ### Solución Parte 4: Razonamiento Crítico
> 1. $25\text{ MB/s} \times 8 = \mathbf{200\text{ Mbps}}$ (muy por debajo de los 1000 Mbps contratados).
> 2. **Factores limitantes:**
>    - **Limitación del servidor de origen**: El servidor de descargas (Steam, Epic, Microsoft) limita el ancho de banda por cliente o está saturado de peticiones concurrentes.
>    - **Cuello de botella de disco local / CPU**: La instalación requiere descomprimir o escribir en disco HDD o SSD mientras se descarga; si el almacenamiento satura la cola de E/S, la descarga se frena.
>    - **Conexión local por Wi-Fi o tarjeta Fast Ethernet**: Si el PC está por Wi-Fi de 2.4 GHz o conectado mediante un cable/puerto limitado a 100 Mbps o Wi-Fi congestionado.
>    - **Límites de calidad de servicio (QoS)** o tráfico concurrente en el hogar/centro.