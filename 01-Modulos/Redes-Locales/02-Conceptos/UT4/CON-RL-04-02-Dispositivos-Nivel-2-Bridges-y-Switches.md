---
tipo: concepto
modulo: "Redes Locales"
ud: "UD04"
ra_asociados: ["RA1", "RA3"]
tags: [concepto, redes, nivel-2, switch, bridge, tabla-cam, mac]
dificultad: intermedia
estado: revisado
---

# 💡 Concepto: Dispositivos de Nivel 2. Puentes (Bridges) y Conmutadores (Switches)

> **Módulo**: [[MOC-Redes-Locales|Redes Locales]] | **UD**: [[UD04-Adaptadores-Dispositivos-Interconexion-Simulacion|UD04]] | **RA**: [[RA01-Arquitectura-Redes|RA1]], [[RA03-Configuracion-Conmutadores-Routers|RA3]]

---

## 📌 1. Concepto Fundamental
Los dispositivos de **Nivel 2 (Capa de Enlace de Datos)** son equipos activos e inteligentes que procesan **tramas Ethernet**. Analizan las direcciones físicas MAC y toman decisiones de reenvío selectivo de tráfico, aislando los dominios de colisión y optimizando drásticamente el rendimiento de la LAN.

- **Puente (Bridge)**: Dispositivo histórico de 2 o pocos puertos que unía dos segmentos de red filtrando el tráfico por software.
- **Conmutador (Switch)**: Esencialmente un "puente multipuerto" de alta velocidad con hardware especializado (**ASIC - Application-Specific Integrated Circuit**), capaz de conmutar millones de tramas por segundo a velocidad de cable (*wire-speed*).

---

## 🧠 2. El Algoritmo de Aprendizaje Transparente (Tabla MAC / CAM)

Un switch construye de forma dinámica y automática una base de datos interna denominada **Tabla CAM (Content Addressable Memory)** o **Tabla de Direcciones MAC**, que asocia cada dirección MAC aprendida con el puerto físico donde está conectado ese equipo.

El switch realiza cuatro acciones fundamentales ante cada trama entrante:

```text
       [ Puerto 1 ]           [ Puerto 2 ]           [ Puerto 3 ]
       PC A (MAC: AA)         PC B (MAC: BB)         PC C (MAC: CC)
              │                      │                      │
       ┌──────┴──────────────────────┴──────────────────────┴──────┐
       │                       SWITCH                              │
       │  Tabla CAM:                                               │
       │    Puerto 1 ──► MAC: AA                                   │
       │    Puerto 2 ──► MAC: BB                                   │
       └───────────────────────────────────────────────────────────┘
```

1. **Aprendizaje (Learning)**: El switch lee la dirección **MAC de Origen** de la trama entrante. Si no la conocía, la anota en su tabla CAM junto con el número de puerto por el que entró (con un temporizador de caducidad, habitualmente 300 segundos).
2. **Filtrado (Filtering)**: Si la MAC de destino se encuentra en el mismo puerto por el que entró la trama, el switch la descarta para no sobrecargar ese segmento.
3. **Reenvío (Forwarding)**: El switch lee la dirección **MAC de Destino**. Si dicha MAC ya está registrada en su tabla CAM, envía la trama **exclusivamente por ese puerto concreto**.
4. **Inundación (Flooding)**: Si la MAC de destino es desconocida (*Unknown Unicast*) o si se trata de una trama de difusión (**Broadcast** `FF:FF:FF:FF:FF:FF`), el switch retransmite una copia de la trama por **todos los puertos activos excepto por el puerto por el que entró**.

---

## ⚡ 3. Métodos de Reenvío en Switches

1. **Almacenamiento y Reenvío (Store-and-Forward)**:
   - El switch recibe la trama completa en su memoria intermedia (búfer), comprueba la suma de control de redundancia cíclica (**CRC/FCS**) y, si no tiene errores, la conmuta.
   - **Ventaja**: Evita propagar tramas corruptas o dañadas por colisiones (*runts*). Es el método estándar de los switches modernos.
2. **Conmutación Rápida (Cut-Through)**:
   - El switch lee únicamente los primeros 6 bytes de la cabecera (la MAC de destino) y comienza a emitir la trama de inmediato sin esperar a recibir el resto.
   - **Ventaja**: Mínima latencia; **Inconveniente**: Propaga tramas con errores de transmisión.
3. **Libre de Fragmentos (Fragment-Free)**:
   - Variante de cut-through que lee los primeros 64 bytes (longitud mínima de una trama Ethernet legal) antes de conmutar, descartando las colisiones tempranas.

---

## ⚠️ Errores Comunes y Puntos Clave en Taller
- **Comando de comprobación en Cisco IOS**:
  ```text
  Switch# show mac address-table
  ```
  Permite visualizar las MACs aprendidas dinámicamente y el puerto asociado.
- **Ataque de desbordamiento de tabla MAC (CAM Overflow)**: Si un atacante inunda el switch con miles de MACs falsas por segundo, la memoria CAM se llena; algunos switches antiguos conmutaban a modo "fallo abierto" comportándose como un hub (flooding masivo).
