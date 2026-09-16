---
tipo: concepto
modulo: "Redes Locales"
ud: "UD08"
ra_asociados: ["RA5"]
tags: [concepto, redes, troubleshooting, mantenimiento, incidencias, metodologia]
dificultad: basica
estado: revisado
---

# 💡 Concepto: Metodología Sistemática de Resolución de Incidencias (Troubleshooting)

> **Módulo**: [[MOC-Redes-Locales|Redes Locales]] | **UD**: [[UD08-Mantenimiento-Red-Local-Resolucion-Incidencias|UD08]] | **RA**: [[RA05-Servicios-Red-DHCP-DNS|RA5]]

---

## 📌 1. Concepto Fundamental
El diagnóstico y resolución de averías en redes (**Troubleshooting**) no debe basarse en la improvisación o en cambiar parámetros al azar (*trial and error*), ya que esto suele empeorar el problema o crear fallos secundarios ocultos.

Un técnico profesional de Grado Medio (SMR) debe seguir un **proceso estructurado y metódico** compuesto por fases rigurosas:
1. **Identificar el problema**: Recopilar síntomas, interrogar a los usuarios afectados, determinar qué ha cambiado recientemente y delimitar el alcance (¿falla un único usuario, un aula entera o todo el centro?).
2. **Establecer una teoría de causas probables**: Formular hipótesis basadas en los principios fundamentales de redes.
3. **Poner a prueba la teoría**: Realizar pruebas específicas para confirmar o descartar la causa sospechada.
4. **Establecer un plan de acción e implementar la solución**: Aplicar la corrección minimizando el impacto en el servicio.
5. **Verificar la funcionalidad total del sistema**: Comprobar que el servicio está restaurado y aplicar medidas preventivas para que no vuelva a ocurrir.
6. **Documentar los hallazgos**: Anotar en el sistema de tickets de incidencias la causa raíz y los pasos seguidos para resolverla.

---

## 🪜 2. Estrategias de Diagnóstico Basadas en el Modelo OSI

```text
  Top-Down (Arriba a abajo)             Bottom-Up (Abajo a arriba)
┌─────────────────────────┐           ┌─────────────────────────┐
│ 7. Aplicación (Navegador) ◄── Inicia │ 7. Aplicación           │
│ 6. Presentación         │           │ 6. Presentación         │
│ 5. Sesión               │           │ 5. Sesión               │
│ 4. Transporte (Puertos) │           │ 4. Transporte           │
│ 3. Red (IP / Ping)      │           │ 3. Red                  │
│ 2. Enlace (MAC/Switch)  │           │ 2. Enlace               │
│ 1. Física (Cables/LEDs) │           │ 1. Física (Cables/LEDs) ◄── Inicia
└─────────────────────────┘           └─────────────────────────┘
```

1. **Método de Abajo hacia Arriba (Bottom-Up)**:
   - Comienza en la **Capa Física** comprobando cables, conectores, alimentación y luces LED.
   - Si la Capa 1 y 2 están bien, sube a la Capa 3 (IP, máscara, gateway con `ping`), luego a Capa 4 (puertos con `netstat` o `telnet/nc`) y finalmente a Capa 7.
   - **Ideal cuando**: Se sospecha un problema físico evidente tras obras, cambios de sitio de equipos o tormentas eléctricas.
2. **Método de Arriba hacia Abajo (Top-Down)**:
   - Comienza verificando la aplicación (ej. abrir el navegador web o probar con otro programa). Si falla, baja progresivamente por las capas de red.
   - **Ideal cuando**: La avería parece ser de un software concreto o de credenciales de usuario.
3. **Método Divide y Vencerás (Divide-and-Conquer)**:
   - **El método más eficiente y utilizado en la práctica**: Se inicia la prueba en la mitad del modelo, típicamente en la **Capa 3** ejecutando un comando `ping` a la puerta de enlace o al servidor de nombres.
   - Si el `ping` responde con éxito: sabemos que las capas 1, 2 y 3 funcionan perfectamente; el problema está en las capas superiores (DNS, firewall o aplicación).
   - Si el `ping` falla: investigamos hacia abajo (Capa 3, 2 o 1).

---

## ⚠️ Errores Comunes y Puntos Clave en Taller
- **Cambiar varias cosas a la vez**: Si un equipo no tiene red y a la vez cambias el cable, reconfiguras la IP y tocas el switch, nunca sabrás cuál era la avería real si se soluciona, o introducirás nuevos errores si sigue fallando. **Modificar siempre un único parámetro cada vez**.
- **Pregunta clave al usuario**: *"¿Funcionaba antes? ¿Cuándo fue la última vez que funcionó? ¿Qué se ha cambiado o instalado justo antes del fallo?"*.
