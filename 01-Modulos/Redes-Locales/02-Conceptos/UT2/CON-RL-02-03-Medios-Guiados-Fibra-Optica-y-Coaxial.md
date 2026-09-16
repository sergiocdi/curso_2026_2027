---
tipo: concepto
modulo: "Redes Locales"
ud: "UD02"
ra_asociados: ["RA2"]
tags: [concepto, redes, fibra-optica, monomodo, multimodo, coaxial, conectores]
dificultad: intermedia
estado: revisado
---

# 💡 Concepto: Medios Guiados. Fibra Óptica y Cable Coaxial

> **Módulo**: [[MOC-Redes-Locales|Redes Locales]] | **UD**: [[UD02-Elementos-Espacios-Fisicos-Red-Local|UD02]] | **RA**: [[RA02-Medios-Transmision-Cableado|RA2]]

---

## 📌 1. Concepto Fundamental
La **fibra óptica** es un filamento de vidrio ultrapuro (sílice) o plástico transparente que transmite pulsos de luz modulados basándose en el principio óptico de la **reflexión interna total**.
- **Ventajas críticas sobre el cobre**:
  1. Total inmunidad contra interferencias electromagnéticas (EMI) y radiofrecuencia (RFI).
  2. Atenuación extraordinariamente baja a grandes distancias (decenas de kilómetros sin repetidores).
  3. Enorme ancho de banda (cientos de Gbps por filamento con WDM).
  4. Seguridad física muy elevada (imposible pincharla sin interrumpir drásticamente la señal óptica).

### Estructura de un Cable de Fibra
- **Núcleo (Core)**: Cilindro central de sílice por donde viaja la luz.
- **Revestimiento (Cladding)**: Capa de vidrio concéntrica con un índice de refracción menor que el núcleo, lo que confina la luz dentro de éste.
- **Recubrimiento primario (Coating/Buffer)**: Capa plástica de protección mecánica contra abrasión y humedad.
- **Elementos de tracción**: Fibras de aramida (Kevlar) que aportan resistencia a la tracción durante el tendido.

---

## 💡 2. Fibra Monomodo frente a Fibra Multimodo

| Característica | Fibra Monomodo (SMF - Single Mode) | Fibra Multimodo (MMF - Multi Mode) |
| :--- | :--- | :--- |
| **Diámetro del Núcleo** | Muy pequeño: **9 \(\mu\)m** | Mayor: **50 \(\mu\)m** o **62.5 \(\mu\)m** |
| **Fuente de Luz** | Diodo Láser (longitudes de onda de 1310 nm, 1550 nm) | LED o VCSEL (longitudes de onda de 850 nm, 1300 nm) |
| **Trayectoria de la luz** | Un único rayo directo sin dispersión modal | Múltiples rayos rebotando en diferentes ángulos |
| **Distancia máxima** | Decenas de kilómetros (hasta 40 - 80 km) | Hasta 300 - 550 m (según categoría OM3/OM4) |
| **Coste de transceptores** | Más caro (láseres de precisión) | Más económico (emisores LED/VCSEL) |
| **Aplicación típica** | Backbones de campus, enlaces MAN/WAN, operadoras | Redes LAN internas, CPDs, interconexión de racks |
| **Color habitual de funda** | Amarillo | Naranja (OM1/OM2) o Azul aguamarina (OM3/OM4) |

---

## 🔌 3. Conectores Ópticos Comunes y Módulos SFP

- **SC (Subscriber Connector)**: Conector cuadrado con sistema de inserción *push-pull*. Muy común en telecomunicaciones y tomas FTTH.
- **LC (Lucent Connector)**: Conector miniaturizado de alta densidad con lengüeta de fijación tipo RJ-45. Estándar indiscutible en switches corporativos y servidores.
- **ST (Straight Tip)**: Conector cilíndrico metálico con cierre de bayoneta (giro y clic). Muy extendido en instalaciones clásicas.
- **Transceptores SFP / SFP+**: Módulos enchufables en caliente (*hot-pluggable*) que se insertan en las ranuras dedicadas de los switches para dotarlos de puertos de fibra a 1 Gbps (SFP) o 10 Gbps (SFP+).

---

## 📻 4. Cable Coaxial (Contexto Histórico y Redes HFC)
Compuesto por un conductor central de cobre (*vivo*), un dieléctrico aislante, una malla metálica exterior conductora y una cubierta protectora:
- **10BASE5 (Thicknet / Coaxial grueso)**: RG-8, 50 \(\Omega\), 500 m máx., tomas vampiro.
- **10BASE2 (Thinnet / Coaxial fino)**: RG-58, 50 \(\Omega\), 185 m máx., conectores BNC y piezas en T.
- **RG-59 / RG-6 (75 \(\Omega\))**: Utilizado en televisión analógica/TDT, videovigilancia CCTV y redes híbridas de fibra y coaxial (HFC) de operadores de cable.

---

## ⚠️ Errores Comunes y Puntos Clave en Taller
- **Mirar directamente al extremo de una fibra activa**: ¡PELIGRO OCULAR GRAVE! La radiación infrarroja del láser de telecomunicaciones no es visible al ojo humano, pero quema la retina irreversiblemente.
- **No limpiar los conectores**: Una mota de polvo invisible microscópica sobre la férula cerámica de un conector LC puede atenuar la señal varios decibelios o quemar el transceptor.
