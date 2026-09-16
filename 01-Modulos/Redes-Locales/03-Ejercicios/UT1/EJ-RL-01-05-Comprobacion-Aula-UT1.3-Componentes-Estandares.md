---
tipo: ejercicio
modulo: "Redes Locales"
ud: "UD01"
ra_asociados: ["RA1"]
ce_asociados: ["CE1.d", "CE1.e"]
tipo_actividad: "formativa_aula"
tipo_ejercicio: "comprobacion_aula"
dificultad: "baja_media"
tiempo_estimado_min: 25
herramientas: ["Proyector de Aula", "Documento Word Digital (.docx)"]
---

# 📝 Comprobación en Aula: UT1.3 - Componentes de una Red Local y Estándares Internacionales

> **Módulo**: [[MOC-Redes-Locales|Redes Locales (1º SMR)]] | **Unidad**: [[UD01-Introduccion-Redes-Locales-Caracterizacion|UT1]] | **RA**: `RA1 (CE1.d, CE1.e)` | **Tiempo por reto**: `3-5 min` (Total ~25 min)
> **Presentación asociada**: [[RL-UT1.3-Presentacion-Componentes-LAN-Estandares.html|Presentación RL-UT1.3 (Diapositivas 1 a 16)]]

---

## 🎯 Finalidad Pedagógica
Verificación de los componentes de hardware (hosts vs intermediarios), medios guiados e inalámbricos, anatomía de la dirección MAC, diferencias operativas entre Hub/Switch/Router y organismos normalizadores.

---

## 📂 Archivos Descargables y de Aula

- 📝 **Hoja de Trabajo para el Alumnado (Rellenable Digitalmente)**:
  - [Descargar Documento Word (.docx)](file:///c:/Users/capsx/Documents/trabajo/proyectos%20IA/profe-sergio/01-Modulos/Redes-Locales/03-Ejercicios/UT1/RL-UT1.3-Comprobacion-Aula-Alumnado.docx)
- 🔑 **Guía Docente con Solucionario Completo y Consejos de Aula**:
  - [Descargar Solucionario Word (.docx)](file:///c:/Users/capsx/Documents/trabajo/proyectos%20IA/profe-sergio/01-Modulos/Redes-Locales/03-Ejercicios/UT1/RL-UT1.3-Comprobacion-Aula-Docente-Solucionario.docx)

---

## 🧩 Enunciados y Soluciones de los Retos

### 🔹 Reto 1: Dispositivos Terminales (Hosts) vs Intermediarios (Diapositivas 3-5)
* **Enunciado**: Clasifica: Servidor NAS, Switch 24p, Teléfono VoIP, AP Wi-Fi, Impresora multifunción de red, Router cortafuegos.
* **Solución Docente**:
  - *Terminales (Hosts)*: Servidor NAS, Teléfono VoIP, Impresora multifunción (origen o destino final de información).
  - *Intermediarios*: Switch, Punto de Acceso (AP), Router cortafuegos (encaminan, regeneran y filtran flujos).

### 🔹 Reto 2: Selección del Medio de Transmisión Adecuado (Diapositivas 6-8)
* **Enunciado**: Elige medio para: 1) Enlace 1,5 km con interferencias EMI; 2) 30 puestos de oficina a 10-35 m; 3) Lectores portátiles en almacén continuo.
* **Solución Docente**:
  - 1: **Fibra óptica** (monomodo por distancia, 100% inmune a ruido electromagnético).
  - 2: **Par trenzado de cobre UTP (Cat 6)** (económico, flexible, estándar RJ-45).
  - 3: **Radiofrecuencia Wi-Fi (802.11 ax/ac)** (movilidad total sin cables físicos).

### 🔹 Reto 3: Anatomía de una Dirección MAC (Diapositivas 9-10)
* **Enunciado**: Analiza la dirección MAC física `00:1A:2B:6F:89:C4`: total bits/bytes, desglose OUI/dispositivo y conflicto de duplicidad.
* **Solución Docente**:
  - *Tamaño*: 48 bits = 6 bytes (octetos), expresados en 12 dígitos hexadecimales.
  - *OUI (Fabricante)*: Primeros 3 bytes (`00:1A:2B`), asignados por la IEEE.
  - *Identificador de NIC*: Últimos 3 bytes (`6F:89:C4`), asignados por el fabricante.
  - *Conflicto*: La duplicidad genera inestabilidad de la tabla CAM del switch (*MAC flapping*) y pérdida de tráfico en ambos equipos.

### 🔹 Reto 4: Batalla de Dispositivos: HUB vs SWITCH vs ROUTER (Diapositivas 11-13)
* **Enunciado**: Capa OSI de operación, método de envío y división de dominios.
* **Solución Docente**:
  - **HUB**: Capa 1 (Física) | Difusión eléctrica a todos | No divide colisión ni difusión.
  - **SWITCH**: Capa 2 (Enlace) | Conmutación selectiva por MAC | Divide colisión; no divide difusión.
  - **ROUTER**: Capa 3 (Red) | Enrutamiento por IP | Divide colisión y divide difusión.

### 🔹 Reto 5: Organismos de Estandarización de Telecomunicaciones (Diapositiva 14)
* **Enunciado**: Asocia IEEE, IETF, ISO y TIA/EIA con sus cometidos.
* **Solución Docente**:
  - **IEEE**: Estándares físicos y enlace para redes locales y metropolitanas (familia 802).
  - **IETF**: Protocolos de Internet y especificaciones RFC (TCP/IP, HTTP, DNS).
  - **ISO**: Modelo de referencia OSI de 7 capas.
  - **TIA/EIA**: Normas de cableado estructurado e infraestructuras físicas (TIA-568).

### 🔹 Reto 6: La Gran Familia IEEE 802 (Diapositiva 15)
* **Enunciado**: Asocia 802.3, 802.11 y 802.15 con tecnología y aplicación habitual.
* **Solución Docente**:
  - **802.3**: *Ethernet* (cable de par trenzado o fibra para LAN fija).
  - **802.11**: *Wi-Fi* (redes locales inalámbricas para portátiles, móviles y domótica).
  - **802.15**: *Bluetooth / Wireless PAN* (redes personales de corto alcance para periféricos y sensores).
