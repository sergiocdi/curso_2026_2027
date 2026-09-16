---
tipo: ejercicio
modulo: "Redes Locales"
ud: "UD01"
ra_asociados: ["RA1"]
ce_asociados: ["CE1.b", "CE1.c"]
tipo_actividad: "formativa_aula"
tipo_ejercicio: "comprobacion_aula"
dificultad: "baja_media"
tiempo_estimado_min: 25
herramientas: ["Proyector de Aula", "Documento Word Digital (.docx)", "Calculadora"]
---

# 📝 Comprobación en Aula: UT1.2 - Caracterización, Topologías y Magnitudes de Red

> **Módulo**: [[MOC-Redes-Locales|Redes Locales (1º SMR)]] | **Unidad**: [[UD01-Introduccion-Redes-Locales-Caracterizacion|UT1]] | **RA**: `RA1 (CE1.b, CE1.c)` | **Tiempo por reto**: `3-5 min` (Total ~25 min)
> **Presentación asociada**: [[RL-UT1.2-Presentacion-Caracterizacion-Topologias-Magnitudes.html|Presentación RL-UT1.2 (Diapositivas 1 a 18)]]

---

## 🎯 Finalidad Pedagógica
Actividades breves intercaladas para afianzar la clasificación geográfica, los modelos funcionales, la tolerancia a fallos en topologías físicas y el cálculo práctico de tiempos de transmisión.

---

## 📂 Archivos Descargables y de Aula

- 📝 **Hoja de Trabajo para el Alumnado (Rellenable Digitalmente)**:
  - [Descargar Documento Word (.docx)](file:///c:/Users/capsx/Documents/trabajo/proyectos%20IA/profe-sergio/01-Modulos/Redes-Locales/03-Ejercicios/UT1/RL-UT1.2-Comprobacion-Aula-Alumnado.docx)
- 🔑 **Guía Docente con Solucionario Completo y Consejos de Aula**:
  - [Descargar Solucionario Word (.docx)](file:///c:/Users/capsx/Documents/trabajo/proyectos%20IA/profe-sergio/01-Modulos/Redes-Locales/03-Ejercicios/UT1/RL-UT1.2-Comprobacion-Aula-Docente-Solucionario.docx)

---

## 🧩 Enunciados y Soluciones de los Retos

### 🔹 Reto 1: Clasificación de Redes según Cobertura Geográfica (Diapositivas 4-6)
* **Enunciado**: Clasifica 4 casos: 1) Smartwatch con smartphone; 2) 24 PCs en aula 105; 3) 5 facultades en campus de 2 km²; 4) Banco con sedes en Gijón, Madrid, París y Tokio.
* **Solución Docente**:
  - 1: **PAN (WPAN)** (área personal < 10 m).
  - 2: **LAN** (área local dentro de una sala o planta).
  - 3: **CAN** (Campus Area Network: múltiples edificios cercanos en recinto privado).
  - 4: **WAN** (área amplia global que utiliza infraestructuras de telecomunicaciones públicas).

### 🔹 Reto 2: Arquitectura Funcional: Cliente/Servidor vs Peer-to-Peer (Diapositivas 7-8)
* **Enunciado**: Compara ubicación de datos, gestión de seguridad y escalabilidad entre ambos modelos.
* **Solución Docente**:
  - *Datos*: Servidores dedicados centralizados (C/S) vs distribuidos en cada puesto (P2P).
  - *Seguridad*: Centralizada con Directorio Activo/LDAP (C/S) vs administración individual en cada equipo (P2P).
  - *Escalabilidad*: Muy alta en C/S (cientos o miles de puestos); reducida a < 10 equipos en P2P.

### 🔹 Reto 3: Topologías Físicas y Resiliencia ante Fallos (Diapositivas 9-12)
* **Enunciado**: Analiza corte de cable en BUS, corte de cable en ESTRELLA y viabilidad de MALLA COMPLETA para 40 PCs.
* **Solución Docente**:
  - *Bus*: El corte elimina la terminación, rebota la señal y colapsa el 100% de la red.
  - *Estrella*: Si falla un cable de PC, solo se aísla ese equipo; si falla el switch central, cae toda la red.
  - *Malla*: Fórmula $N(N-1)/2 = 40 \times 39 / 2 = 780$ cables y 39 tarjetas por equipo; inviable en costes y canalizaciones.

### 🔹 Reto 4: Topología Física vs Topología Lógica (Diapositiva 13)
* **Enunciado**: Diferencia entre cableado geométrico y flujo lógico de señal con el ejemplo del HUB.
* **Solución Docente**:
  - *Física*: Forma exterior en que se conectan los cables (estrella hacia el HUB).
  - *Lógica*: Cómo viaja la señal. El HUB repite la señal por todos los puertos a la vez, por lo que lógicamente se comporta como un **BUS**.

### 🔹 Reto 5: Ancho de Banda vs Throughput vs Latencia (Diapositivas 14-15)
* **Enunciado**: Fibra 600 Mbps, descarga real a 55 MB/s y ping de 60 ms. Calcula magnitudes y explica la discrepancia.
* **Solución Docente**:
  - *Ancho de banda nominal*: 600 Mbps.
  - *Throughput real*: $55 \text{ MB/s} \times 8 = \mathbf{440 \text{ Mbps}}$.
  - *Latencia*: 60 ms (RTT).
  - *Motivos*: Sobrecarga de cabeceras Ethernet/IP/TCP (overhead), saturación en routers intermedios y control de congestión TCP.

### 🔹 Reto 6: Cálculo Práctico Exprés: Tiempo de Transmisión (Diapositivas 16-17)
* **Enunciado**: Archivo de 150 MegaBytes por enlace de 100 Mbps. Calcula tiempo en segundos.
* **Solución Docente**:
  - Conversión: $150 \text{ MB} \times 8 = 1.200 \text{ Megabits (Mb)}$.
  - Fórmula: $T = \text{Tamaño} / \text{Velocidad} = 1.200 \text{ Mb} / 100 \text{ Mbps} = \mathbf{12 \text{ segundos}}$.
  - *Error típico*: Dividir 150 / 100 = 1,5 s por no multiplicar por 8.
