---
tipo: concepto
modulo: "Redes Locales"
ud: "UD01"
ra_asociados: ["RA1"]
tags: [concepto, redes, binario, decimal, octal, hexadecimal, numeracion, suma-binaria]
dificultad: basica
estado: revisado
---

# 💡 Concepto: Sistemas de Numeración y Aritmética Binaria

> **Módulo**: [[MOC-Redes-Locales|Redes Locales]] | **UD**: [[UD01-Introduccion-Redes-Locales-Caracterizacion|UD01]] | **RA**: [[RA01-Arquitectura-Redes|RA1]]

---

## 📌 1. Concepto Fundamental y Justificación en Redes
Los ordenadores y los dispositivos de interconexión de redes (routers, switches) son máquinas electrónicas digitales basadas en circuitos biestables (niveles de voltaje alto/bajo, pulsos de luz en fibra óptica o modulación electromagnética). Debido a ello, la información no se almacena ni se transporta en caracteres humanos directos, sino mediante **sistemas de codificación digital**.

Un **sistema de numeración posicional** se define por su **base** (número de símbolos disponibles) y por el principio posicional: el valor de cada dígito depende de su posición respecto a la coma fraccionaria, multiplicándose por las potencias sucesivas de la base.

### Elementos Básicos de Información:
- **Bit (Binary Digit)**: Unidad mínima indivisible de información digital (`0` o `1`).
- **Nibble / Cuarteto**: Grupo de 4 bits (capaz de representar un dígito hexadecimal completo).
- **Byte u Octeto**: Grupo de 8 bits ($2^8 = 256$ combinaciones posibles, de `0` a `255` en decimal). Es la unidad fundamental para direccionar memoria y calcular máscaras de red IPv4.
- **MSB (Most Significant Bit)**: El bit más significativo situado en el extremo izquierdo de una palabra binaria; tiene el mayor peso posicional ($2^{n-1}$).
- **LSB (Least Significant Bit)**: El bit menos significativo situado en el extremo derecho; tiene el menor peso posicional ($2^0 = 1$).

---

## 🔢 2. Los Cuatro Sistemas Clave en Redes

| Sistema | Base | Símbolos Permitidos | Uso Fundamental en Redes |
| :--- | :---: | :--- | :--- |
| **Decimal** | 10 | `0, 1, 2, 3, 4, 5, 6, 7, 8, 9` | Notación por puntos para humanos en IPv4 (`192.168.1.1`). |
| **Binario** | 2 | `0, 1` | Señales físicas reales, cálculo de máscaras, subredes (*subnetting*). |
| **Octal** | 8 | `0, 1, 2, 3, 4, 5, 6, 7` | Sistema intermedio histórico. Agrupa exactamente 3 bits ($2^3 = 8$). Permisos en Linux (`chmod 755`). |
| **Hexadecimal** | 16 | `0, 1, 2, 3, 4, 5, 6, 7, 8, 9, A, B, C, D, E, F` | Direcciones físicas MAC (48 bits), direcciones IPv6 (128 bits). Agrupa exactamente 4 bits ($2^4 = 16$). |

### Tabla de Equivalencia Cuádruple (0 a 15)
| Decimal | Binario (4 bits) | Octal | Hexadecimal |
| :---: | :---: | :---: | :---: |
| 0 | `0000` | 0 | `0` |
| 1 | `0001` | 1 | `1` |
| 2 | `0010` | 2 | `2` |
| 3 | `0011` | 3 | `3` |
| 4 | `0100` | 4 | `4` |
| 5 | `0101` | 5 | `5` |
| 6 | `0110` | 6 | `6` |
| 7 | `0111` | 7 | `7` |
| 8 | `1000` | 10 | `8` |
| 9 | `1001` | 11 | `9` |
| 10 | `1010` | 12 | `A` |
| 11 | `1011` | 13 | `B` |
| 12 | `1100` | 14 | `C` |
| 13 | `1101` | 15 | `D` |
| 14 | `1110` | 16 | `E` |
| 15 | `1111` | 17 | `F` |

---

## 🔄 3. Métodos Sistemáticos de Conversión

### A. De Decimal a Binario: Divisiones Sucesivas entre 2
Para convertir un número entero decimal a binario, se divide iterativamente entre 2. El último cociente y todos los restos obtenidos (leídos de abajo hacia arriba / del último al primero) forman la cadena binaria:
- **Ejemplo**: Convertir `58` a binario:
  - $58 / 2 = 29$ (resto `0` - LSB)
  - $29 / 2 = 14$ (resto `1`)
  - $14 / 2 = 7$ (resto `0`)
  - $7 / 2 = 3$ (resto `1`)
  - $3 / 2 = 1$ (resto `1`)
  - $1 / 2 = 0$ (resto `1` - MSB)
  - **Resultado**: `111010` (en formato byte: `00111010`).

### A.2. De Decimal a Binario: Método Rápido de Restas (Tabla de Pesos)
Para números entre 0 y 255 (octetos típicos de red), se compara el número de izquierda a derecha con los pesos del byte (128, 64, 32, 16, 8, 4, 2, 1). Si cabe el peso, se anota un `1` y se resta dicho valor; si no cabe, se anota un `0`:
- **Ejemplo**: Convertir `192` a binario:
  - $192 \ge 128 \rightarrow \mathbf{1}$ (Resta: $192 - 128 = 64$)
  - $64 \ge 64 \rightarrow \mathbf{1}$ (Resta: $64 - 64 = 0$)
  - Los 6 bits restantes son `0`.
  - **Resultado**: `11000000_2`.

### B. De Binario a Decimal: Suma de Pesos Posicionales
Cada posición binaria $i$ (empezando en 0 desde la derecha) tiene un peso $2^i$. En un octeto completo:

| $2^7$ | $2^6$ | $2^5$ | $2^4$ | $2^3$ | $2^2$ | $2^1$ | $2^0$ |
| :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: |
| **128** | **64** | **32** | **16** | **8** | **4** | **2** | **1** |

- **Ejemplo 1**: `11000000` = $128 + 64 = 192$.
- **Ejemplo 2**: `10101000` = $128 + 32 + 8 = 168$.
- **Ejemplo 3**: `10001111` = $128 + 8 + 4 + 2 + 1 = 143$.

> [!IMPORTANT]
> **📌 Tratamiento de Números Binarios de Más de un Octeto (> 8 bits):**
> En redes existen dos escenarios conceptuales completamente distintos al tratar con más de 8 bits:
> 1. **Entero Binario Contiguo (16, 24 o 32 bits continuos)**: Utilizado para números de puerto (ej. puertos TCP/UDP de 16 bits), números de secuencia o tamaños. Las potencias de 2 continúan creciendo hacia la izquierda con exponentes mayores:
>    - $2^8 = 256$, $2^9 = 512$, $2^{10} = 1.024$, $2^{11} = 2.048$, $2^{12} = 4.096$, $2^{15} = 32.768$.
>    - En 16 bits, el rango decimal posible abarca desde `0` hasta $2^{16} - 1 = 65.535$.
> 2. **Direcciones IPv4 en Notación Decimal por Puntos (Dotted-Decimal Notation)**:
>    - Aunque una dirección IPv4 tiene 32 bits en total, **NO se suma como un único número binario gigante**.
>    - La dirección se segmenta en **4 octetos totalmente independientes** separados por puntos:
>      `11000000.10101000.00000001.00000001`
>    - Cada grupo de 8 bits se convierte por separado en el rango `0` a `255`, obteniendo la clásica dirección IP: `192.168.1.1`.

### C. Conversión Directa por Agrupación de Bits:
1. **Octal a Binario y viceversa**:
   - Cada dígito octal se descompone directamente en **3 bits**.
   - Ejemplo: $73_8 
ightarrow 7 = 111, 3 = 011 
ightarrow 111011_2$.
2. **Hexadecimal a Binario y viceversa**:
   - Cada dígito hexadecimal se descompone directamente en **4 bits (nibble)**.
   - Ejemplo: $2F_{16} 
ightarrow 2 = 0010, F = 1111 
ightarrow 00101111_2$.
   - Ejemplo MAC: `00:1A:2B:3C:4D:5E`. Para pasar `1A` a binario: `1` (`0001`) y `A` (`1010`) $
ightarrow$ `00011010`.

---

## ➕ 4. Reglas Aritméticas para la Suma en Binario

La suma de bits se efectúa columna a columna de derecha (LSB) a izquierda (MSB), arrastrando el acarreo (*carry*) a la siguiente posición:

| Dígito 1 | Dígito 2 | Acarreo previo (*carry in*) | Resultado | Acarreo generado (*carry out*) | Explicación |
| :---: | :---: | :---: | :---: | :---: | :--- |
| `0` | `0` | `0` | **`0`** | `0` | $0 + 0 = 0$ |
| `0` | `1` | `0` | **`1`** | `0` | $0 + 1 = 1$ |
| `1` | `0` | `0` | **`1`** | `0` | $1 + 0 = 1$ |
| `1` | `1` | `0` | **`0`** | `1` | $1 + 1 = 2_{10} = 10_2$ |
| `1` | `1` | `1` | **`1`** | `1` | $1 + 1 + 1 = 3_{10} = 11_2$ |

### Ejemplo Práctico de Suma Binaria con Acarreo:
Sumar $1011_2$ (11 en decimal) + $1101_2$ (13 en decimal):

```text
    Acarreos:   1  1  1  1
    Operando 1:    1  0  1  1   (11 dec)
  + Operando 2:    1  1  0  1   (13 dec)
  ----------------------------
    Resultado:  1  1  0  0  0   (24 dec)
```
- **Paso a paso**:
  1. Columna 1 (derecha): $1 + 1 = 0$ con acarreo `1`.
  2. Columna 2: $1 + 0 + 	ext{lleva } 1 = 0$ con acarreo `1` (porque $1 + 1 = 10_2$).
  3. Columna 3: $0 + 1 + 	ext{lleva } 1 = 0$ con acarreo `1`.
  4. Columna 4: $1 + 1 + 	ext{lleva } 1 = 1$ con acarreo `1` ($1 + 1 + 1 = 11_2$).
  5. Extremo izquierdo: El acarreo final pasa directamente como dígito más significativo: `11000`.
- **Comprobación**: $16 + 8 = 24$. $11 + 13 = 24$. Coincidencia exacta.

---

## ⚠️ Errores Comunes y Puntos Clave en Taller
- **Confundir bits (b) y Bytes (B)**: Los anchos de banda se especifican en Gigabits/Megabits por segundo (`Gbps`, `Mbps`), mientras que la capacidad de ficheros y memorias se da en Gigabytes o Megabytes (`GB`, `MB`). Siempre multiplicar por 8 para calcular tasas binarias.
- **Olvidar acarreos en cascada**: Al sumar binarios con múltiples unos seguidos, el acarreo puede propagarse varias columnas a la izquierda.
- **Desbordamiento de octeto**: En IPv4, un octeto no puede superar `255` (`11111111`). Si una suma da más de 255, hay un desbordamiento que afectará al siguiente octeto de la máscara o la subred.\n