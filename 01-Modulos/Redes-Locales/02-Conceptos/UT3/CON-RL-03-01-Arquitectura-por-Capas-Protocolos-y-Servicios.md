---
tipo: concepto
modulo: "Redes Locales"
ud: "UD03"
ra_asociados: ["RA1"]
tags: [concepto, redes, arquitectura-capas, protocolos, interfaces, servicios]
dificultad: basica
estado: revisado
---

# 💡 Concepto: Arquitectura por Capas, Protocolos, Interfaces y Servicios

> **Módulo**: [[MOC-Redes-Locales|Redes Locales]] | **UD**: [[UD03-Arquitecturas-Redes-Modelos-Referencia|UD03]] | **RA**: [[RA01-Arquitectura-Redes|RA1]]

---

## 📌 1. Concepto Fundamental
La comunicación de datos entre dos ordenadores es una tarea de enorme complejidad que involucra voltajes eléctricos, corrección de errores, control de flujo, direccionamiento intermedio, resolución de nombres y sincronización de aplicaciones.

Para resolver este problema con éxito, la ingeniería de redes aplica el principio de **división en capas o niveles jerárquicos**:
- Cada capa se especializa en una tarea bien definida y delimitada.
- Cada nivel ofrece **servicios** a la capa inmediatamente superior y solicita servicios a la capa inmediatamente inferior a través de una **interfaz**.
- La implementación interna de una capa puede modificarse o sustituirse por completo (por ejemplo, cambiar de cable de cobre UTP a fibra óptica) sin que las capas superiores (como el navegador web) requieran ningún cambio.

---

## 🧩 2. Elementos Clave de la Arquitectura por Capas

```text
       EMISOR                               RECEPTOR
┌──────────────────┐                 ┌──────────────────┐
│  Capa N (Nivel)  │ ◄─ Protocolo N ─►  Capa N (Nivel)  │  (Entidades pares)
├──────────────────┤ (Comunicación lógica entre iguales) ├──────────────────┤
│   Interfaz N/N-1 │                 │   Interfaz N/N-1 │
├──────────────────┤                 ├──────────────────┤
│    Capa N - 1    │                 │    Capa N - 1    │
└──────────────────┘                 └──────────────────┘
```

1. **Entidades Pares (Peer Entities)**: Procesos o módulos software que residen en la misma capa en diferentes ordenadores y se comunican entre sí.
2. **Protocolo**: Conjunto formal de reglas, sintaxis, semántica y tiempos que rigen el intercambio de información entre dos entidades pares del mismo nivel.
3. **Interfaz (SAP - Service Access Point)**: Punto de contacto y conjunto de funciones/primitivas mediante el cual una capa inferior pone sus servicios a disposición de la capa superior contigua dentro del mismo equipo.
4. **Servicio**: Conjunto de operaciones y garantías que una capa proporciona a la superior. Se clasifican en:
   - **Orientado a conexión**: Exige establecer un circuito virtual previo antes de enviar datos (fases: establecimiento, transferencia y liberación; ej. TCP).
   - **No orientado a conexión**: Cada bloque de datos viaja de forma independiente sin conexión previa ni acuse de recibo explícito (ej. UDP, IP).

---

## ⚠️ Errores Comunes y Puntos Clave en Taller
- **Confundir Protocolo con Servicio**: Un *servicio* es lo que una capa hace por la capa que tiene encima en la misma máquina; un *protocolo* es el lenguaje que habla esa capa con su homóloga en la otra máquina a través de la red.
- **La comunicación física real siempre desciende**: Salvo en el cable o medio físico real (Capa 1), la comunicación horizontal entre capas iguales en dos ordenadores es una abstracción lógica; los datos siempre bajan por todas las capas del emisor y suben por las del receptor.
