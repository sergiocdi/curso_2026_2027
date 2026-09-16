---
tipo: concepto
modulo: "Redes Locales"
ud: "UD04"
ra_asociados: ["RA1", "RA3"]
tags: [concepto, redes, dominio-colision, dominio-difusion, broadcast, segmentacion]
dificultad: basica
estado: revisado
---

# 💡 Concepto: Dominios de Colisión y Dominios de Difusión (Broadcast)

> **Módulo**: [[MOC-Redes-Locales|Redes Locales]] | **UD**: [[UD04-Adaptadores-Dispositivos-Interconexion-Simulacion|UD04]] | **RA**: [[RA01-Arquitectura-Redes|RA1]]

---

## 📌 1. Concepto Fundamental
La delimitación de los dominios de colisión y difusión es el criterio de diseño más importante en la arquitectura de redes locales para optimizar el rendimiento, evitar tormentas de difusión (*broadcast storms*) y garantizar la escalabilidad.

### 1. Dominio de Colisión
- **Definición**: Segmento lógico o físico de una red donde es posible que dos o más dispositivos transmitan señales eléctricas o tramas al mismo tiempo y éstas colisionen, corrompiéndose mutuamente.
- **Quién lo separa/aísla**: Cada puerto individual de un **Bridge**, de un **Switch** o de un **Router** crea un dominio de colisión independiente y aislado.
- **Quién lo comparte/extiende**: Los **Hubs** y los **Repetidores** extienden el mismo dominio de colisión por todos sus puertos.

### 2. Dominio de Difusión (Broadcast Domain)
- **Definición**: Conjunto de todos los dispositivos de la red que reciben una trama o paquete de difusión emitido por cualquiera de ellos (por ejemplo, una petición ARP de Capa 2 dirigida a `FF:FF:FF:FF:FF:FF` o una consulta DHCP Discover).
- **Quién lo separa/aísla**: Los **Routers** (en Capa 3) y las **VLANs** (en Capa 2). Un router nunca retransmite tramas de broadcast de una interfaz a otra.
- **Quién lo comparte/extiende**: Los **Switches**, **Bridges** y **Hubs** retransmiten y propagan los paquetes de difusión por todos sus puertos activos.

---

## 📊 2. Tabla Comparativa por Dispositivo

| Dispositivo de Red | Capa OSI | ¿Separa Dominios de Colisión? | ¿Separa Dominios de Difusión? |
| :--- | :---: | :--- | :--- |
| **Hub / Repetidor** | 1 (Física) | **NO** (1 Hub = 1 dominio de colisión) | **NO** (extiende el broadcast) |
| **Bridge** | 2 (Enlace) | **SÍ** (cada puerto es 1 dominio de colisión) | **NO** (1 Bridge = 1 dominio de difusión) |
| **Switch** | 2 (Enlace) | **SÍ** (cada puerto es 1 dominio de colisión dedicado) | **NO** (por defecto, todos los puertos comparten 1 dominio de difusión global, salvo que se creen VLANs) |
| **Router** | 3 (Red) | **SÍ** (cada interfaz es 1 dominio de colisión) | **SÍ** (cada interfaz es 1 dominio de difusión independiente) |

---

## 📐 3. Ejemplo Práctico de Examen / Taller

Imaginemos una topología con:
- 1 Router con 2 interfaces de red (`G0/0` y `G0/1`).
- En la interfaz `G0/0` se conecta un **Switch de 24 puertos** con 10 ordenadores enchufados.
- En la interfaz `G0/1` se conecta un **Hub de 8 puertos** con 5 ordenadores enchufados.

```text
       [ PC1 ] ... [ PC10 ]                   [ PC11 ] ... [ PC15 ]
          \     |     /                          \      |      /
       ┌──────────────────┐                   ┌──────────────────┐
       │ Switch 24 puertos│                   │  Hub 8 puertos   │
       └────────┬─────────┘                   └────────┬─────────┘
                │ G0/0                                 │ G0/1
            ┌───┴──────────────────────────────────────┴───┐
            │                  ROUTER                      │
            └──────────────────────────────────────────────┘
```

**Cálculo**:
1. **¿Cuántos dominios de difusión hay?**: **2 dominios de difusión** (delimitados por las dos interfaces del router: uno a la izquierda y otro a la derecha).
2. **¿Cuántos dominios de colisión hay?**:
   - En el Switch: cada cable activo es un dominio independiente: 10 PCs + 1 enlace al router = **11 dominios**.
   - En el Hub: todos los equipos y el router comparten un único dominio = **1 dominio**.
   - **Total de la red**: \(11 + 1 = \mathbf{12}\) **dominios de colisión**.

---

## ⚠️ Errores Comunes y Puntos Clave en Taller
- **Creer que un switch evita el broadcast**: Un switch evita las colisiones, pero inunda (*flooding*) todos los puertos cuando recibe un broadcast. Si hay 1000 PCs en un switch sin VLANs, el tráfico de broadcast saturará la CPU de todos los ordenadores (*tormenta de difusión*).
