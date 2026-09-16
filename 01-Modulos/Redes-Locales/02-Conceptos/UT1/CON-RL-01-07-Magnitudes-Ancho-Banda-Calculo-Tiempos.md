---
tipo: concepto
modulo: "Redes Locales"
ud: "UD01"
ra_asociados: ["RA1"]
tags: [concepto, redes, magnitudes, ancho-de-banda, throughput, calculo, tiempos-transmision]
dificultad: basica
estado: revisado
---

# 💡 Concepto: Magnitudes de Red, Ancho de Banda y Cálculo de Tiempos de Transmisión

> **Módulo**: [[MOC-Redes-Locales|Redes Locales]] | **UD**: [[UD01-Introduccion-Redes-Locales-Caracterizacion|UD01]] | **RA**: [[RA01-Arquitectura-Redes|RA1]]

---

## 📌 1. Magnitudes y Unidades de Almacenamiento vs Transmisión

En informática de comunicaciones es imprescindible distinguir con precisión entre magnitudes de **almacenamiento** (ficheros, memoria RAM, discos) y magnitudes de **transmisión** (velocidad de líneas y enlaces):

### Unidades Fundamentales:
- **Bit (b)**: Dígito binario (`0` o `1`). Unidad fundamental de transmisión.
- **Byte (B)**: Conjunto de 8 bits. Unidad fundamental de almacenamiento.
  $$1 	ext{ Byte} = 8 	ext{ bits}$$

### Múltiplos Decimales Estándar (Sistema Internacional - SI):
| Unidad de Capacidad | Símbolo | Equivalencia en Bytes | Unidad de Velocidad | Símbolo | Equivalencia en bps |
| :--- | :---: | :--- | :--- | :---: | :--- |
| **Kilobyte** | KB | $1.000 	ext{ B} = 10^3 	ext{ B}$ | **Kilobit por segundo** | kbps | $1.000 	ext{ bps} = 10^3 	ext{ bps}$ |
| **Megabyte** | MB | $1.000 	ext{ KB} = 10^6 	ext{ B}$ | **Megabit por segundo** | Mbps | $1.000 	ext{ kbps} = 10^6 	ext{ bps}$ |
| **Gigabyte** | GB | $1.000 	ext{ MB} = 10^9 	ext{ B}$ | **Gigabit por segundo** | Gbps | $1.000 	ext{ Mbps} = 10^9 	ext{ bps}$ |
| **Terabyte** | TB | $1.000 	ext{ GB} = 10^{12} 	ext{ B}$ | **Terabit por segundo** | Tbps | $1.000 	ext{ Gbps} = 10^{12} 	ext{ bps}$ |
| **Petabyte** | PB | $1.000 	ext{ TB} = 10^{15} 	ext{ B}$ | **Petabit por segundo** | Pbps | $1.000 	ext{ Tbps} = 10^{15} 	ext{ bps}$ |

> [!NOTE]
> En informática tradicional de sistemas operativos a menudo se han utilizado prefijos binarios basados en potencias de 2 ($1 	ext{ KiB} = 1024 	ext{ B}$, $1 	ext{ GiB} = 1024 	ext{ MiB}$), pero en redes y telecomunicaciones oficiales los prefijos SI son siempre potencias de 10 ($1 	ext{ Gbps} = 10^9 	ext{ bps}$).

---

## 📶 2. Ancho de Banda frente a Velocidad Real (*Throughput*)

- **Ancho de Banda (*Bandwidth*)**: Capacidad teórica máxima de transporte de datos que un canal de transmisión puede soportar bajo condiciones ideales.
  - En transmisiones digitales se mide en bits por segundo (**bps, Mbps, Gbps**).
  - En transmisiones analógicas se mide en hercios (**Hz, MHz, GHz**), reflejando la anchura del espectro de frecuencias utilizables.
- **Velocidad Real / Tasa de Transferencia Efectiva (*Throughput*)**: Cantidad real de datos útiles (*payload*) transferidos con éxito por unidad de tiempo a través del enlace.
  - **Regla inmutable**: La tasa de transferencia real **nunca puede ser superior** al ancho de banda nominal, viéndose reducida por la sobrecarga de cabeceras de protocolo (*overhead*), el tráfico parásito de la red, colisiones, retardos y retransmisiones por errores.

---

## ⏱️ 3. Fórmula y Procedimiento para el Cálculo de Tiempos de Transmisión

Para calcular cuánto tiempo teórico tarda en transferirse un archivo digital de tamaño $D$ a través de un canal con ancho de banda $V$:

$$	ext{Tiempo } (t) = rac{	ext{Tamaño del archivo en bits}}{	ext{Velocidad del canal en bits por segundo}} = rac{D}{V}$$

### Procedimiento Sistemático en 3 Pasos:
1. **Paso 1: Homogeneizar Unidades a Bits**:
   Convertir el tamaño del archivo de Bytes a bits multiplicando por 8:
   $$	ext{Bits} = 	ext{Bytes} 	imes 8$$
   Asegurar que los órdenes de magnitud coincidan (Gigabits con Gbps, Megabits con Mbps).
2. **Paso 2: Calcular el Tiempo en Segundos**:
   Dividir la cantidad total de bits entre la velocidad de la línea.
3. **Paso 3: Convertir a Minutos / Horas si procede**:
   Dividir los segundos obtenidos entre 60 para expresar el resultado en minutos.

---

## 📝 4. Problema de Aplicación Resuelto

**Enunciado**:
*Un router Gigabit Ethernet transfiere datos a una velocidad nominal de **1 Gbps**. ¿Cuántos minutos llevará transferir un archivo de vídeo de **3 Gigabytes (GB)** a través de este enlace bajo condiciones óptimas?*

**Solución Paso a Paso**:

1. **Paso 1: Conversión de magnitudes a bits**:
   El vídeo tiene un tamaño de $3 	ext{ GB}$. Como $1 	ext{ Byte} = 8 	ext{ bits}$:
   $$3 	ext{ GB} 	imes 8 = 24 	ext{ Gb (Gigabits)}$$

2. **Paso 2: Cálculo del tiempo en segundos**:
   La velocidad del router es de $1 	ext{ Gbps} = 1 	ext{ Gigabit por segundo}$:
   $$t = rac{24 	ext{ Gb}}{1 	ext{ Gbps}} = 24 	ext{ segundos}$$

3. **Paso 3: Conversión de segundos a minutos**:
   $$t = rac{24 	ext{ s}}{60 	ext{ s/min}} = 0,4 	ext{ minutos}$$
   *(Equivalente a 24 segundos).*

---

## ⚠️ Errores Comunes en Exámenes de Aula
- **Olvidar multiplicar por 8**: El fallo más habitual en 1º SMR consiste en dividir directamente $3 	ext{ GB} / 1 	ext{ Gbps} = 3 	ext{ segundos}$, olvidando que el archivo viene en Bytes y la red transmite bits.
- **Confusión entre prefijos b y B**: Escribir `Mb` (Megabits) creyendo que son `MB` (Megabytes).\n