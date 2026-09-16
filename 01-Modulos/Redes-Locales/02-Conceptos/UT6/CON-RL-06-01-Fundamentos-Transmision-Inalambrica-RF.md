---
tipo: concepto
modulo: "Redes Locales"
ud: "UD06"
ra_asociados: ["RA3"]
tags: [concepto, redes, inalambrico, radiofrecuencia, bandas-ism, antenas, rf]
dificultad: basica
estado: revisado
---

# 💡 Concepto: Fundamentos de Transmisión Inalámbrica por Radiofrecuencia

> **Módulo**: [[MOC-Redes-Locales|Redes Locales]] | **UD**: [[UD06-Redes-Inalambricas-Mixtas|UD06]] | **RA**: [[RA03-Configuracion-Conmutadores-Routers|RA3]]

---

## 📌 1. Concepto Fundamental
Las redes inalámbricas utilizan el **espectro electromagnético** (concretamente ondas de radio y microondas) como medio no guiado de transmisión. La información digital modula una señal portadora de alta frecuencia que se propaga por el espacio libre a la velocidad de la luz (\(\approx 300.000\text{ km/s}\)).

### Bandas ISM (Industrial, Scientific and Medical)
A diferencia de las frecuencias de telefonía móvil o radio comercial (que requieren costosas licencias estatales otorgadas por el Ministerio), las redes de área local inalámbricas operan en bandas de uso común sin licencia (**Bandas ISM**):
- **Banda de 2.4 GHz (2.400 a 2.4835 GHz)**:
  - Gran alcance y excelente penetración a través de paredes y obstáculos sólidos.
  - Muy saturada: comparte espectro con hornos microondas, dispositivos Bluetooth, mandos a distancia e infinidad de redes vecinas.
- **Banda de 5 GHz (5.150 a 5.850 GHz)**:
  - Mayor cantidad de canales limpios sin solapamiento y mucho mayor ancho de banda/velocidad.
  - Menor alcance efectivo y fuerte atenuación al atravesar muros de hormigón o tabiques.
- **Banda de 6 GHz (Wi-Fi 6E y Wi-Fi 7)**:
  - Espectro ampliado de 5.925 a 7.125 GHz, libre de interferencias de dispositivos antiguos y con latencias ultrabajas.

---

## 📡 2. Propagación, Obstáculos y Antenas

### Fenómenos Físicos de la Señal RF
1. **Atenuación**: Pérdida natural de potencia de la señal con la distancia (Ley del cuadrado inverso de la distancia).
2. **Absorción**: Conversión de la energía electromagnética en calor al atravesar materiales (el agua, el cuerpo humano y el hormigón armado son grandes absorbentes de microondas).
3. **Reflexión**: Rebote de la onda sobre superficies metálicas o espejos, provocando desfasajes y ecos (*trayectorias múltiples / multipath*).
4. **Dispersión y Difracción**: Desviación de la onda al chocar con bordes o superficies rugosas.

### Tipos de Antenas
- **Omnidireccionales**: Emiten y reciben la señal en todas direcciones en el plano horizontal (\(360^\circ\)), con una forma geométrica semejante a un "donut" tridimensional. Es el tipo habitual en routers y puntos de acceso interiores de aulas y oficinas.
- **Direccionales (Sectoriales, Yagi, Parabólicas)**: Concentran toda la energía emitida en un haz estrecho y enfocado hacia una dirección específica. Utilizadas para radioenlaces de exterior de larga distancia (varios kilómetros entre edificios).

---

## ⚠️ Errores Comunes y Puntos Clave en Taller
- **Creer que 5 GHz "siempre es mejor"**: Si el puesto de trabajo está a 20 metros y separado por dos muros gruesos de ladrillo, la señal de 5 GHz llegará con demasiada atenuación, rindiendo peor que una conexión en 2.4 GHz.
- **Canales solapados en 2.4 GHz**: En 2.4 GHz existen 13 canales en Europa, pero tienen un ancho de 20-22 MHz y están separados sólo por 5 MHz. Para no interferirse, dos puntos de acceso cercanos deben colocarse obligatoriamente en los **canales 1, 6 u 11** (canales no solapados).
