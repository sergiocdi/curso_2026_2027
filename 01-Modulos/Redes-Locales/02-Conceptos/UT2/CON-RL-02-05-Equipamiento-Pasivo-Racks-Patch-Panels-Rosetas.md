---
tipo: concepto
modulo: "Redes Locales"
ud: "UD02"
ra_asociados: ["RA2"]
tags: [concepto, redes, rack, patch-panel, roseta, keystone, pasivo]
dificultad: basica
estado: revisado
---

# 💡 Concepto: Equipamiento Pasivo. Armarios Rack, Paneles de Parcheo y Tomas de Usuario

> **Módulo**: [[MOC-Redes-Locales|Redes Locales]] | **UD**: [[UD02-Elementos-Espacios-Fisicos-Red-Local|UD02]] | **RA**: [[RA02-Medios-Transmision-Cableado|RA2]]

---

## 📌 1. Concepto Fundamental
En una infraestructura de red se denomina **equipamiento pasivo** a todos aquellos componentes físicos que sirven de soporte, fijación, conectorización, canalización o protección física del cableado, y que **no requieren suministro de energía eléctrica ni alteran activamente la señal digital** (a diferencia de los componentes activos como switches o routers).

---

## 🗄️ 2. Armarios Rack de 19 Pulgadas

Un **Rack** es una estructura metálica modular estandarizada para alojar de forma ordenada, ventilada y segura tanto el equipamiento de telecomunicaciones como los servidores:
- **Anchura frontal normalizada**: **19 pulgadas (482,6 mm)** entre guías de montaje.
- **Unidad de altura (U)**: Unidad de medida estándar de la altura de los equipos enrackables:
  \[
  1\text{ U} = 1,75\text{ pulgadas} = 44,45\text{ mm}
  \]
  - Ejemplos habituales: racks murales de pared (6U, 9U, 12U), racks de suelo para cuartos de planta o CPD (24U, 42U, 47U).
- **Accesorios habituales**: Pasacables / ordenadores horizontales con ranuras (1U), regletas de alimentación eléctrica específicas para rack (**PDU - Power Distribution Unit**), bandejas fijas o telescópicas, y unidades de ventilación con termostato.

---

## 🔌 3. Paneles de Parcheo (Patch Panels) y Rosetas Keystone

### Panel de Parcheo (Patch Panel)
- Elemento pasivo metálico enrackable (habitualmente de 1U con 24 puertos o 2U con 48 puertos).
- **Parte posterior**: Dispone de bloques de conexión por desplazamiento de aislamiento (**IDC - Insulation Displacement Contact**, tipo Krone o 110), donde se impactan de forma fija los hilos de los cables horizontales de cobre que vienen de las distintas rosetas del edificio.
- **Parte frontal**: Presenta tomas hembra RJ-45 estandarizadas numeradas.
- **Función crítica**: Permite reconfigurar enlaces entre puestos de trabajo y puertos de switch en segundos simplemente cambiando un latiguillo frontal (*patch cord*), sin tocar el cableado rígido tendido en canaleta.

### Tomas de Usuario y Conectores Keystone
- **Área de Trabajo**: La toma de pared (roseta) aloja uno o varios módulos hembra **Keystone RJ-45**.
- Cada conector keystone tiene grabados en sus laterales los dos códigos de colores (T568A y T568B) para facilitar el orden de impacto mediante la herramienta de inserción (*punch down tool*).

---

## ⚠️ Errores Comunes y Puntos Clave en Taller
- **Conectar el cable horizontal rígido directamente al switch con un RJ-45 macho**: Muy mala práctica profesional. El cable horizontal es de hilo de cobre unifilar (rígido); debe rematarse siempre en patch panel. Los cables que van al switch son latiguillos flexibles multifilares.
- **No etiquetar ambos extremos**: Cada toma de pared y su correspondiente puerto en el patch panel deben compartir un identificador idéntico y normalizado (ej. `P01-R02-T14` = Planta 1, Rack 2, Toma 14).
- **Pérdida de tornillos de jaula (*cage nuts*)**: Para fijar equipos al rack se utilizan tuercas enjauladas y tornillos M6; no forzar orificios sin la tuerca adecuada.
