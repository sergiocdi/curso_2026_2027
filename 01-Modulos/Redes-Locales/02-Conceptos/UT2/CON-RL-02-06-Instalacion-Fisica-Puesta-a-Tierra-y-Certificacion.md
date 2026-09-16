---
tipo: concepto
modulo: "Redes Locales"
ud: "UD02"
ra_asociados: ["RA2"]
tags: [concepto, redes, certificacion, puesta-a-tierra, canalizaciones, tester]
dificultad: intermedia
estado: revisado
---

# 💡 Concepto: Instalación Física, Puesta a Tierra y Certificación de Cableado

> **Módulo**: [[MOC-Redes-Locales|Redes Locales]] | **UD**: [[UD02-Elementos-Espacios-Fisicos-Red-Local|UD02]] | **RA**: [[RA02-Medios-Transmision-Cableado|RA2]]

---

## 📌 1. Concepto Fundamental
La ejecución material de una instalación de cableado estructurado exige respetar normas rigurosas de seguridad eléctrica, separación de canalizaciones y verificación instrumental para garantizar el ancho de banda y la durabilidad de la infraestructura física a lo largo de décadas.

---

## ⚡ 2. Puesta a Tierra en Telecomunicaciones (Norma ANSI/TIA-607)

En cualquier instalación de telecomunicaciones, la conexión a tierra cumple una doble misión:
1. **Seguridad de las personas**: Derivar a tierra posibles contactos indirectos o sobretensiones atmosféricas (rayos).
2. **Compatibilidad electromagnética (EMC) y drenaje de ruidos**: Los cables blindados (FTP/STP) acumulan cargas electrostáticas e interferencias en su pantalla metálica. Si dicha pantalla no se conecta a tierra en el rack, actúa como una gigantesca antena que introduce más ruido parásito que un cable UTP sin blindaje.

### Elementos del Sistema de Tierra
- **TMGB (Telecommunications Main Grounding Busbar)**: Barra principal de tierra de telecomunicaciones, conectada directamente a la toma de tierra general del edificio.
- **TGB (Telecommunications Grounding Busbar)**: Barra de tierra secundaria en cada cuarto de telecomunicaciones de planta.
- **Braid / Cable de tierra del rack**: Todos los armarios rack, puertas metálicas, paneles de parcheo y bandejas deben conectarse mediante cable de cobre desnudo o amarillo-verde a la barra TGB.

---

## 📐 3. Canalizaciones y Buenas Prácticas de Tendido

- **Canaletas plásticas de superficie**: Con compartimentos separados para cables de potencia eléctrica y datos (separación mínima recomendada de 20-30 cm si discurren en paralelo sin apantallamiento para evitar inducción electromagnética a 50 Hz).
- **Bandejas portacables**: Metálicas tipo rejilla (de hilo) o de chapa perforada, suspendidas del techo técnico.
- **Factor de llenado (*fill ratio*)**: No sobrepasar el 40-50% de la capacidad de la canaleta en la instalación inicial para permitir ventilación y futuras ampliaciones.
- **Tensión de tracción y radio de curvatura**: No sobrepasar una tensión de tiro de 110 N (11 kgf) para 4 pares. El radio de curvatura mínimo no debe ser inferior a 4 veces el diámetro exterior del cable en reposo (y 8 veces durante la instalación).

---

## 🔍 4. Comprobación y Certificación de Cableado

Distinguimos tres niveles de instrumentos:

| Nivel de Instrumento | Equipo Típico | Parámetros que Comprueba |
| :--- | :--- | :--- |
| **Comprobador de Continuidad (Tester básico)** | Mapa de cableado con LEDs (1 a 8 + G) | Continuidad pin a pin, pares abiertos, cortocircuitos y pares cruzados. |
| **Calificador de Cableado** | Equipos de diagnóstico avanzado | Longitud por TDR, presencia de ruido, si soporta 100M/1G/10G. |
| **Certificador de Cableado (Norma ISO/TIA)** | Fluke DSX CableAnalyzer | Emite informe oficial vinculante con garantía del fabricante: atenuación, diafonía (**NEXT/FEXT**), paradiafonía, pérdidas de retorno (**Return Loss**), retraso de propagación (**Propagation Delay**) y desalineación de retardo (**Delay Skew**). |

### Principales Fallos en el Certificador
- **Wire Map (Mapa de cables) FAIL**: Hilos mal ordenados, sueltos o invertidos.
- **Length FAIL**: Cable superior a 90 m en enlace permanente.
- **NEXT (Near-End Crosstalk) FAIL**: Diafonía excesiva en el extremo cercano, típicamente producida por destrenzar más de 13 mm los pares al crimpar.

---

## ⚠️ Errores Comunes y Puntos Clave en Taller
- **Creer que porque los 8 LEDs del tester se enciendan el cable es perfecto**: Un tester básico sólo mide continuidad en corriente continua; no detecta diafonía ni atenuación a altas frecuencias (250 o 500 MHz). Un cable con los pares destrenzados 10 cm pasa el tester básico, pero falla de inmediato en la certificación y provocará pérdida de paquetes o bajada a 100 Mbps.
