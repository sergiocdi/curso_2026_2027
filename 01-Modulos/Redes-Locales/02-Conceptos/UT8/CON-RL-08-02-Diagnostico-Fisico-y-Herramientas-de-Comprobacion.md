---
tipo: concepto
modulo: "Redes Locales"
ud: "UD08"
ra_asociados: ["RA2", "RA5"]
tags: [concepto, redes, diagnostico-fisico, tester, duplex, leds, tdr]
dificultad: basica
estado: revisado
---

# 💡 Concepto: Diagnóstico de Nivel Físico y Herramientas de Comprobación

> **Módulo**: [[MOC-Redes-Locales|Redes Locales]] | **UD**: [[UD08-Mantenimiento-Red-Local-Resolucion-Incidencias|UD08]] | **RA**: [[RA02-Medios-Transmision-Cableado|RA2]], [[RA05-Servicios-Red-DHCP-DNS|RA5]]

---

## 📌 1. Concepto Fundamental
Las estadísticas de mantenimiento en centros de trabajo demuestran que más del **70% de las incidencias de red tienen su origen en la Capa Física (Capa 1)** o en la de Enlace (Capa 2): cables pisados por sillas con ruedas, conectores RJ-45 con patillas partidas, latiguillos de mala calidad, puertos de switch dañados o problemas de negociación de velocidad y dúplex.

---

## 💡 2. Diagnóstico Visual Mediante Indicadores LED

Antes de encender el ordenador o abrir la consola, el técnico debe observar los diodos LED situados en la tarjeta de red (NIC) y en el frontal del switch:
- **LED de Enlace (Link LED)**:
  - **Verde o Ámbar fijo**: Existe señal portadora física continua detectada por el hardware (conexión eléctrica o lumínica establecida con el otro extremo).
  - **Apagado**: Cable desconectado, cortado, puerto apagado administrativamente (*shutdown*) o equipo remoto sin corriente.
- **LED de Actividad (Activity LED)**:
  - **Parpadeo intermitente**: Hay tráfico de tramas entrando o saliendo por el puerto.
  - **Parpadeo continuo frenético**: Posible bucle de conmutación o tormenta de difusión (*broadcast storm*).
- **LED de Velocidad**: Muchos conmutadores y tarjetas disponen de LEDs bicolor (ej. verde para 1 Gbps, ámbar para 100 Mbps). Si un puerto gigabit conmuta a ámbar, indica degradación del cable o problemas de negociación.

---

## ⚠️ 3. Discordancia de Dúplex (Duplex Mismatch)

Uno de los problemas más insidiosos y difíciles de detectar en Capa 2:
- Ocurre cuando un extremo del cable está configurado en **Full-Duplex** y el otro extremo en **Half-Duplex** (típicamente porque la autonegociación ha fallado o alguien forzó manualmente los parámetros).
- **Síntomas**: La red parece "funcionar" para pings pequeños aislados, pero en cuanto el usuario intenta transferir un archivo grande o navegar, la velocidad cae a niveles ridículos (pocos KB/s) y se produce una avalancha masiva de colisiones tardías (**Late Collisions**) y tramas descartadas (*input errors / CRC errors*) en el switch.
- **Solución en Cisco IOS**:
  ```text
  Switch# show interfaces fastEthernet 0/1
  :: Comprobar las líneas: "Full-duplex, 100Mb/s" y los contadores de "CRC errors" y "collisions"
  ```

---

## 🛠️ 4. Instrumental de Taller para Nivel Físico

1. **Tester de Continuidad de Cableado**: Unidad emisora y receptora con 8 LEDs que comprueba la correcta correspondencia de hilos, cortocircuitos o pares abiertos.
2. **Generador de Tonos y Sonda Inductiva ("Pollo / Fox and Hound")**:
   - El generador inyecta una señal de audiofrecuencia en un hilo del cable en el puesto de trabajo.
   - La sonda amplificadora permite rastrear el cable sin pelarlo y localizar exactamente a qué puerto del patch panel llega en un rack con cientos de cables sin etiquetar.
3. **Reflectómetro de Dominio de Tiempo (TDR - Time Domain Reflectometer)**:
   - Envía un pulso eléctrico o lumínico por el cable y mide el tiempo que tarda el eco en regresar tras rebotar en una rotura o cortocircuito. Permite saber con precisión milimétrica a cuántos metros del rack se ha partido el cable dentro del falso techo o canaleta.
4. **Localizador Visual de Fallos para Fibra Óptica (VFL - Visual Fault Locator)**:
   - Láser rojo visible (650 nm) que se acopla al conector de fibra. Si hay una rotura o curvatura excesiva en el cable, la luz roja se fuga iluminando la cubierta plástica.

---

## ⚠️ Errores Comunes y Puntos Clave en Taller
- **La lengüeta del conector RJ-45 rota**: Un conector cuya patilla plástica se ha partido se mueve con facilidad; ante cualquier tirón pierde momentáneamente el contacto con los pines del zócalo hembra, provocando microcortes intermitentes desesperantes. Reemplazar y crimpar siempre un conector nuevo.
