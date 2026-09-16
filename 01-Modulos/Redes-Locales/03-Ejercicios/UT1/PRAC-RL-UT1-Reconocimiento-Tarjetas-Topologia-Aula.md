---
tipo: ejercicio
modulo: "Redes Locales"
ud: "UD01"
ra_asociados: ["RA1"]
ce_asociados: ["CE1.a"]
tipo_actividad: "practica_taller"
tipo_ejercicio: "laboratorio_cli"
dificultad: "baja_media"
tiempo_estimado_min: 90
rubrica: "[[Rubrica-Practicas-Programacion]]"
herramientas: ["PC Taller (Windows / Linux)", "Terminal CLI", "Navegador Web", "Cable UTP aula"]
---

# 🛠️ Práctica de Taller: Reconocimiento de Adaptadores de Red, OUI y Topología del Aula

> **Módulo**: [[MOC-Redes-Locales|Redes Locales (SMR)]] | **Unidad**: [[UD01-Introduccion-Redes-Locales-Caracterizacion|UT1]] | **RA**: `RA1 (CE1.a)` | **Tiempo estimado**: `90 min`

---

## 🎯 Objetivos de la Práctica
1. Identificar mediante la interfaz de comandos (**CLI**) los adaptadores de red físicos y virtuales instalados en el equipo de taller.
2. Extraer la dirección física (**MAC**) de cada adaptador y descomponerla en el identificador de fabricante (**OUI**) y el número de serie de interfaz (**NIC**).
3. Comprobar la velocidad de enlace negociada y el modo dúplex (*Full Duplex* vs *Half Duplex*).
4. Reconocer físicamente el medio de transmisión, conectores, rosetas de pared y el conmutador de distribución del taller de clase.
5. Elaborar un croquis formal de la **topología física del aula de informática**.

---

## 💻 Entorno y Material Necesario
* Puesto de trabajo del taller de SMR con sistema operativo **Windows 10/11** o distribución **Linux (Ubuntu / Debian)**.
* Conexión cableada al conmutador del aula mediante cable de par trenzado UTP con conectores RJ-45.
* Acceso a la web de consulta de estándares IEEE OUI: [https://standards-oui.ieee.org/](https://standards-oui.ieee.org/) o buscadores de fabricantes MAC (ej: `macvendors.com`).

---

## 📋 Pasos a Seguir

### Fase 1: Inspección de Adaptadores mediante Consola (30 min)

Abre una ventana de consola (CMD o PowerShell en Windows; Bash en Linux) y ejecuta los comandos indicados para recopilar la información requerida:

#### En Windows:
```powershell
# Ver información completa de adaptadores
ipconfig /all

# Ver únicamente las direcciones MAC asociadas al nombre de transporte
getmac /v

# Ver estado de los interfaces de red
netsh interface show interface
```

#### En Linux:
```bash
# Ver información de nivel de enlace y direcciones MAC
ip link show

# Ver direcciones IP y máscaras
ip -c addr show

# Ver velocidad y dúplex de la interfaz eth0/enp3s0 (requiere paquete ethtool o mii-tool)
sudo ethtool enp3s0
```

#### 📝 Ficha de Registro a Completar por el Alumno:

1. **Nombre de la interfaz cableada principal**: ___________________________
2. **Descripción del hardware / Modelo del chip de red**: ___________________________
3. **Dirección física MAC**: `____ : ____ : ____ : ____ : ____ : ____`
4. **Descomposición de la MAC**:
   - **OUI (Primeros 3 bytes / 24 bits)**: `____ : ____ : ____`
   - **NIC / Dispositivo (Últimos 3 bytes / 24 bits)**: `____ : ____ : ____`
5. **Fabricante del chip de red (según base de datos IEEE)**: ___________________________
6. **Estado del medio**: (Conectado / Desconectado): ___________________________
7. **Velocidad de conexión negociada**: ________ Mbps / Gbps.
8. **Modo de transmisión**: (Half Duplex / Full Duplex). Explica qué significa.

---

### Fase 2: Inspección Física del Puesto y Cableado (25 min)

1. Sigue visualmente el cable de red que sale de la parte posterior de tu ordenador:
   - ¿Qué tipo de conector utiliza en el extremo del PC? (Ej: RJ-45 macho de 8 pines).
   - Observa la leyenda impresa en la cubierta plástica del cable. Anota el texto completo visible (ej: `UTP CAT.6 4 PAIR 24AWG ANSI/TIA-568...`).
   - ¿Qué categoría de cable es? ¿Cuál es la velocidad máxima admitida por esa categoría?
2. Localiza la roseta o caja de conexiones de pared/suelo a la que está conectado tu puesto:
   - Anota la etiqueta identificativa de la toma (ej: `RACK-1 / PANEL-A / TOMA-14`).
3. Comprueba los diodos LED de la tarjeta de red del PC:
   - ¿De qué color lucen los LEDs de la tarjeta? (Verde, ámbar, apagado).
   - ¿Qué indica el LED de enlace (*Link*) continuo y qué indica el LED de actividad (*Activity*) parpadeante?

---

### Fase 3: Diagrama de Topología del Aula (25 min)

1. Observa la distribución física del aula/taller:
   - ¿Hacia dónde confluyen los cables de todos los ordenadores del aula?
   - ¿Existe un armario rack de telecomunicaciones en el aula? ¿Dónde está ubicado?
2. Realiza en una hoja o con una herramienta digital (Draw.io, Packet Tracer o papel cuadriculado) un croquis o diagrama esquemático que represente:
   - La ubicación de las filas de ordenadores de los alumnos y el puesto del profesor.
   - La canaleta perimetral de cableado.
   - El armario rack con el conmutador (switch) y el router de acceso a Internet del centro.
3. Responde razonadamente:
   - ¿Qué topología física tiene el aula?
   - ¿Qué ocurriría si un alumno desconecta accidentalmente su cable de red de la roseta? ¿Afecta al resto de compañeros de su fila?
   - ¿Qué ocurriría si el switch del armario rack se apaga o pierde el suministro eléctrico?

---

### Fase 4: Entrega y Criterios de Evaluación (10 min)

La entrega se realizará en un documento PDF o informe de taller que incluya:
* Capturas de pantalla de los comandos ejecutados en consola señalando los datos clave.
* Ficha técnica del adaptador debidamente cumplimentada.
* Fotografía o descripción detallada de la toma de pared y leyenda del cable.
* Diagrama de la topología física del taller con simbología estándar.

---

## 🔑 Pautas de Corrección y Respuestas Tipo (Profesor Sergio)

> [!NOTE]- Ver Criterios de Corrección y Respuestas Esperadas (Haz clic para desplegar)
> ### Criterios de Calificación (Total: 10 puntos)
> 1. **Comandos CLI y Ficha Técnica (3 puntos)**:
>    - Ejecución correcta de comandos en CMD/PowerShell o Bash (1 pto).
>    - Identificación exacta de la MAC, separación OUI/NIC y consulta correcta del fabricante en el registro IEEE (Realtek, Intel, Broadcom, etc.) (1 pto).
>    - Identificación de velocidad (100 Mbps o 1 Gbps) y comprensión del término Full Duplex (comunicación bidireccional simultánea sin colisiones) (1 pto).
> 
> 2. **Inspección de Cableado y Medios Físicos (3 puntos)**:
>    - Identificación correcta del conector RJ-45 (8P8C) y categoría Cat.5e (hasta 1 Gbps a 100 MHz) o Cat.6 (hasta 1 Gbps / 10 Gbps a 250 MHz) (1,5 ptos).
>    - Localización y registro de la identificación de la roseta / puesto de taller (0,75 ptos).
>    - Explicación de los LEDs de enlace (Link = presencia de portadora física) y actividad (Activity = recepción/emisión de tramas) (0,75 ptos).
> 
> 3. **Diagrama de Topología del Aula (3 puntos)**:
>    - Claridad y pulcritud del diagrama: representación de puestos, canalizaciones y armario rack (1,5 ptos).
>    - Identificación correcta de la topología física en **Estrella** hacia el switch del aula (1 pto).
>    - Razonamiento sobre aislamiento de fallos (la caída de un puesto no afecta a los demás, pero el switch central es un SPOF) (0,5 ptos).
> 
> 4. **Presentación, Vocabulario Técnico y Rigor (1 punto)**:
>    - Uso apropiado de la terminología de redes (adaptador, MAC, OUI, conmutador, Full Duplex, atenuación).