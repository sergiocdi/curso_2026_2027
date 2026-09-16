---
tipo: concepto
modulo: "Redes Locales"
ud: "UD02"
ra_asociados: ["RA2"]
tags: [concepto, redes, par-trenzado, utp, ftp, stp, t568a, t568b, rj45]
dificultad: intermedia
estado: revisado
---

# 💡 Concepto: Medios Guiados. Par Trenzado, Blindajes y Esquemas de Conexión

> **Módulo**: [[MOC-Redes-Locales|Redes Locales]] | **UD**: [[UD02-Elementos-Espacios-Fisicos-Red-Local|UD02]] | **RA**: [[RA02-Medios-Transmision-Cableado|RA2]]

---

## 📌 1. Concepto Fundamental
El cable de **par trenzado** consiste en conductores de cobre aislados trenzados en espiral de dos en dos. El trenzado tiene una base física crucial: cancela la radiación electromagnética emitida y amortigua la interferencia externa y la **diafonía (crosstalk)** entre pares adyacentes.

### Tipos de Blindaje (Nomenclatura ISO/IEC)
Formato: `XX / Y TP` (donde `XX` es el blindaje exterior global, `Y` el blindaje de cada par, y `TP` = Twisted Pair):
- **U/UTP (Unshielded Twisted Pair)**: Sin blindaje exterior ni individual. El más flexible y económico, común en oficinas sin interferencias intensas.
- **F/UTP (Foiled Twisted Pair / FTP tradicional)**: Lámina de aluminio global que envuelve los 4 pares; los pares no llevan blindaje individual.
- **U/FTP**: Sin blindaje global, pero cada par va envuelto en una lámina protectora de aluminio.
- **S/FTP**: Malla de cobre trenzado exterior global + lámina de aluminio independiente por cada par. Máxima protección frente a interferencias electromagnéticas industriales (EMI).

---

## 📈 2. Categorías de Cable y Ancho de Banda

| Categoría | Frecuencia Máx. | Velocidad Máx. | Distancia Máxima | Aplicación Típica |
| :--- | :--- | :--- | :--- | :--- |
| **Cat 5e** | 100 MHz | 1 Gbps (1000BASE-T) | 100 m | Redes domésticas clásicas / telefonía |
| **Cat 6** | 250 MHz | 1 Gbps / 10 Gbps (hasta 37-55m) | 100 m / reducida a 10G | Instalaciones estándar comerciales |
| **Cat 6A** | 500 MHz | 10 Gbps (10GBASE-T) | 100 m completos | Centros de datos y cableado corporativo moderno |
| **Cat 7 / 7A** | 600 / 1000 MHz | 10 Gbps (requiere blindaje S/FTP) | 100 m | Entornos industriales / centros de cómputo |
| **Cat 8** | 2000 MHz | 25 Gbps / 40 Gbps | 30 m | Interconexión interna entre racks de servidores |

---

## 🎨 3. Códigos de Colores: Estándares T568A y T568B

El conector modular **RJ-45 (8P8C)** se conecta a los 8 hilos según dos normas de disposición:

```text
Pin   T568A                 T568B
 1    Blanco / Verde        Blanco / Naranja
 2    Verde                 Naranja
 3    Blanco / Naranja      Blanco / Verde
 4    Azul                  Azul
 5    Blanco / Azul         Blanco / Azul
 6    Naranja               Verde
 7    Blanco / Marrón       Blanco / Marrón
 8    Marrón                Marrón
```

### Tipos de Cables y Auto MDI/MDIX
- **Cable Directo (Straight-Through)**: Mismo estándar en ambos extremos (T568B - T568B). Conecta equipos de distinto nivel (PC a Switch, Switch a Router).
- **Cable Cruzado (Crossover)**: Un extremo en T568A y el otro en T568B (los pines 1 y 2 se cruzan con 3 y 6). Históricamente necesario para conectar equipos del mismo nivel (PC a PC, Switch a Switch, Router a Router).
- **Auto-MDIX**: Las tarjetas de red y switches modernos detectan automáticamente el tipo de cable y cruzan electrónicamente las líneas de transmisión (TX) y recepción (RX), haciendo innecesario el cable cruzado en la práctica diaria.

---

## ⚠️ Errores Comunes y Puntos Clave en Taller
- **Destrenzar demasiado al crimpar**: No se debe destrenzar más de 13 mm (media pulgada) de cable antes de insertarlo en el conector RJ-45 o keystone; de lo contrario, se dispara la diafonía y la prueba certificadora fallará.
- **Pines 3 y 5 intercambiados**: Al ordenar hilos para T568B, el par azul ocupa los pines centrales 4 y 5, y el verde se "parte" entre los pines 3 y 6. Es el error más repetido por el alumnado principiante.
