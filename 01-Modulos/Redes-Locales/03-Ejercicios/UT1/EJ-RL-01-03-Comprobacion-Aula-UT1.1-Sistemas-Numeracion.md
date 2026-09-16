---
tipo: ejercicio
modulo: "Redes Locales"
ud: "UD01"
ra_asociados: ["RA1"]
ce_asociados: ["CE1.a"]
tipo_actividad: "formativa_aula"
tipo_ejercicio: "comprobacion_aula"
dificultad: "baja_media"
tiempo_estimado_min: 25
herramientas: ["Proyector de Aula", "Documento Word Digital (.docx)", "Cuaderno"]
---

# 📝 Comprobación en Aula: UT1.1 - Introducción a las Redes y Representación de la Información

> **Módulo**: [[MOC-Redes-Locales|Redes Locales (1º SMR)]] | **Unidad**: [[UD01-Introduccion-Redes-Locales-Caracterizacion|UT1]] | **RA**: `RA1 (CE1.a)` | **Tiempo por reto**: `3-5 min` (Total ~25 min)
> **Presentación asociada**: [[RL-UT1.1-Presentacion-Introduccion-Representacion-Informacion.html|Presentación RL-UT1.1 (Diapositivas 1 a 16)]]

---

## 🎯 Finalidad Pedagógica
Conjunto de 6 micro-retos de aula diseñados para intercalarse durante la proyección de la presentación **UT1.1**. Permiten al docente verificar en tiempo real la asimilación conceptual antes de avanzar a temas más abstractos (conversiones de base y cálculo de octetos).

---

## 📂 Archivos Descargables y de Aula

- 📝 **Hoja de Trabajo para el Alumnado (Rellenable Digitalmente)**:
  - [Descargar Documento Word (.docx)](file:///c:/Users/capsx/Documents/trabajo/proyectos%20IA/profe-sergio/01-Modulos/Redes-Locales/03-Ejercicios/UT1/RL-UT1.1-Comprobacion-Aula-Alumnado.docx)
- 🔑 **Guía Docente con Solucionario Completo y Consejos de Aula**:
  - [Descargar Solucionario Word (.docx)](file:///c:/Users/capsx/Documents/trabajo/proyectos%20IA/profe-sergio/01-Modulos/Redes-Locales/03-Ejercicios/UT1/RL-UT1.1-Comprobacion-Aula-Docente-Solucionario.docx)

---

## 🧩 Enunciados y Soluciones de los Retos

### 🔹 Reto 1: Ventajas de una Red Local y Compartición de Recursos (Diapositivas 4-5)
* **Enunciado**: Cita 3 recursos (hardware, datos o servicios) que optimizaría de inmediato una oficina al montar una red local y describe 1 problema o riesgo crítico que sufren al trabajar con ordenadores aislados.
* **Solución Docente**:
  - *Recursos*: 1) Impresora multifunción en red; 2) Almacenamiento centralizado (NAS/servidor de ficheros); 3) Conexión a Internet y copias de seguridad comunes.
  - *Riesgo*: Dispersión e inconsistencia de datos ("islas de información"), sobrecoste en periféricos y dificultad de realizar copias de seguridad fiables.

### 🔹 Reto 2: Identificación: ¿Señal Analógica o Señal Digital? (Diapositivas 6-7)
* **Enunciado**: Clasifica 4 manifestaciones físicas: voz humana por micrófono, trama Ethernet en cable UTP, corriente alterna doméstica de 230 V y pulsos de luz en fibra óptica.
* **Solución Docente**:
  - Voz en micrófono: **Analógica** (onda continua de presión/voltaje).
  - Trama Ethernet UTP: **Digital** (niveles discretos de tensión para 0s y 1s).
  - Corriente alterna 230 V: **Analógica** (onda senoidal continua a 50 Hz).
  - Pulsos de luz en fibra: **Digital** (estados discretos de luz encendida/apagada).

### 🔹 Reto 3: Tabla Maestra de Pesos de un Byte (Potencias de 2) (Diapositivas 9-10)
* **Enunciado**: Completa los pesos decimales de las 8 potencias de 2 ($2^7$ a $2^0$) de un byte.
* **Solución Docente**:
  - Posiciones: $2^7=128$, $2^6=64$, $2^5=32$, $2^4=16$, $2^3=8$, $2^2=4$, $2^1=2$, $2^0=1$.
  - Suma total (11111111): $128+64+32+16+8+4+2+1 = 255$. Total valores: $2^8 = 256$ combinaciones (0 a 255).

### 🔹 Reto 4: Conversión Decimal a Binario en 8 bits (Diapositivas 11-12)
* **Enunciado**: Convierte a binario de 8 bits: a) `192` b) `77`.
* **Solución Docente**:
  - a) $192 = 128 + 64 \rightarrow \mathbf{11000000_2}$.
  - b) $77 = 64 + 8 + 4 + 1 \rightarrow \mathbf{01001101_2}$.
  - *Consejo docente*: Insistir en rellenar siempre los ceros a la izquierda hasta completar los 8 bits.

### 🔹 Reto 5: Conversión Binario a Decimal (Diapositiva 13)
* **Enunciado**: Convierte a decimal: a) `10101000_2` b) `11110000_2`.
* **Solución Docente**:
  - a) $10101000_2 = 128 + 32 + 8 = \mathbf{168_{10}}$ (segundo octeto de 192.168.x.x).
  - b) $11110000_2 = 128 + 64 + 32 + 16 = \mathbf{240_{10}}$ (máscara /28).

### 🔹 Reto 6: El Sistema Hexadecimal y los Nibbles (Diapositivas 14-15)
* **Enunciado**: a) Convierte `11011010_2` a hexadecimal por nibbles. b) ¿Qué valor hexadecimal tiene el decimal `255`?
* **Solución Docente**:
  - a) Nibble alto: $1101_2 = 13_{10} \rightarrow \mathbf{D}$. Nibble bajo: $1010_2 = 10_{10} \rightarrow \mathbf{A}$. Resultado: $\mathbf{0xDA}$.
  - b) $255_{10} = 11111111_2 \rightarrow 1111_2 (\mathbf{F}) \text{ y } 1111_2 (\mathbf{F}) \rightarrow \mathbf{0xFF}$.
  - *Regla mnemotécnica*: 1 Byte = 8 bits = 2 dígitos hexadecimales exactos.
