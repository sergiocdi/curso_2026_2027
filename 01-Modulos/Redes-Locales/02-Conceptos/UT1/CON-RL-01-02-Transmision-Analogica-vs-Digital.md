---
tipo: concepto
modulo: "Redes Locales"
ud: "UD01"
ra_asociados: ["RA1"]
tags: [concepto, redes, transmision, senales, analogico, digital, conmutacion, paquetes, circuitos]
dificultad: basica
estado: revisado
---

# 💡 Concepto: Transmisión Analógica vs Digital y Técnicas de Conmutación

> **Módulo**: [[MOC-Redes-Locales|Redes Locales]] | **UD**: [[UD01-Introduccion-Redes-Locales-Caracterizacion|UD01]] | **RA**: [[RA01-Arquitectura-Redes|RA1]]

---

## 📌 1. Transmisión Analógica frente a Transmisión Digital
Toda comunicación a través de un canal físico se produce mediante la propagación de energía electromagnética o pulsos lumínicos. Según la naturaleza de la señal utilizada, distinguimos dos tipos fundamentales de transmisión:

1. **Señal Analógica**:
   - Magnitud continua que varía suavemente en el tiempo dentro de un rango infinito de valores posibles.
   - Parámetros esenciales: **Amplitud** (voltaje/potencia), **Frecuencia** (ciclos por segundo, Hz) y **Fase** (desplazamiento temporal).
   - Muy susceptible a la degradación por ruido e interferencias; al amplificarla, se amplifica también el ruido acumulado.
2. **Señal Digital**:
   - Magnitud discontinua que sólo adopta un conjunto finito y discreto de estados o niveles de tensión (típicamente dos niveles: alto para el `1` y bajo para el `0`).
   - Gran inmunidad frente al ruido: mientras la perturbación no supere el umbral de discriminación, el receptor puede **regenerar** la señal limpia original sin distorsión acumulada.

| Característica | Transmisión Analógica | Transmisión Digital |
| :--- | :--- | :--- |
| **Naturaleza de la señal** | Onda continua en el tiempo | Pulsos discretos por niveles de tensión/luz |
| **Valores posibles** | Infinitos dentro de un intervalo | Finitos (típicamente binario: 0 y 1) |
| **Inmunidad al ruido** | Baja (el ruido se mezcla con la señal) | Alta (regeneración de pulsos limpios) |
| **Elemento de refuerzo** | Amplificador (amplifica señal + ruido) | Repetidor / Regenerador (reconstruye los bits) |
| **Ancho de banda** | Menor eficiencia en datos informáticos | Muy alta eficiencia y multiplexación |
| **Ejemplos clásicos** | Telefonía analógica tradicional (RTC), radio FM | Redes Ethernet, Wi-Fi, fibra óptica, TDT |

---

## 🔀 2. Técnicas de Conmutación: Circuitos vs Paquetes

Para conectar múltiples emisores y receptores a través de una red, se emplean dos técnicas esenciales de conmutación:

### A. Conmutación de Circuitos
- **Mecanismo**: Antes de comenzar la transmisión se debe establecer un **camino físico dedicado y exclusivo** de extremo a extremo entre el emisor y el receptor.
- **Reserva de recursos**: El ancho de banda del canal queda reservado íntegramente durante toda la comunicación, incluso cuando nadie hable o no se envíen datos (canal ocioso desaprovechado).
- **Retardo**: Retardo inicial de establecimiento; retardo de transmisión casi nulo y constante durante la sesión.
- **Ejemplo**: Red telefónica conmutada tradicional (RTC / PSTN).

### B. Conmutación de Paquetes (Estándar en Redes de Datos)
- **Mecanismo**: Los datos no se envían en un flujo continuo, sino que se **trocean en fragmentos más pequeños denominados paquetes**.
- **Estructura del paquete**: Cada paquete incluye los datos del usuario (*payload*) más una **cabecera** con la dirección de origen, dirección de destino, longitud y número de secuencia.
- **Aprovechamiento del medio**: No hay reserva de circuito exclusivo; los paquetes de diferentes usuarios comparten y se multiplexan sobre los mismos enlaces físicos (*store and forward* en routers y switches).
- **Eficiencia**: Si un enlace cae, los paquetes pueden redirigirse dinámicamente por caminos alternativos.
- **Ejemplo**: Ethernet, Internet (protocolo IP).

---

## ⚠️ Errores Comunes y Puntos Clave en Taller
- **Creer que el Wi-Fi o la Fibra transmiten ceros y unos "en el aire"**: En el medio físico real viajan fotones u ondas de radiofrecuencia moduladas analógicamente. La modulación digital (como QAM o PSK) traduce los estados electromagnéticos en bits de datos.
- **Amplificador vs Regenerador**: En pruebas prácticas, recalcar que los switches y repetidores regeneran la trama digital desde cero; no se limitan a amplificar el volumen de la señal eléctrica degradada.\n