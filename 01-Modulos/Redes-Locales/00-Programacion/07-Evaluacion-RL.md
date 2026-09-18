---
tipo: apartado_programacion
modulo: "Redes Locales"
apartado_num: "07"
titulo: "Evaluación y Criterios de Calificación"
---

# 7. Evaluación y Criterios de Calificación

El modelo de evaluación del módulo de **Redes Locales** se fundamenta en la evaluación formativa y competencial por **Criterios de Evaluación (CE)**, asegurando una trazabilidad total entre las actividades de aprendizaje, las pruebas objetivas de conocimientos y los exámenes prácticos de desempeño.

> [!IMPORTANT]
> **Carácter Formativo del Taller (Sin Calificación Numérica)**:
> En el taller no se obtendrán notas numéricas. Las actividades, montajes físicos y prácticas desarrolladas en el taller tienen una finalidad exclusivamente **formativa y de afianzamiento de conceptos y destrezas** (crimpado, conectorización, conexionado de armarios rack, etc.), sirviendo para consolidar el aprendizaje sin computar en el cálculo de las notas sumativas.

---

## 7.1. Estructura y Ponderación de Instrumentos por Criterio de Evaluación (CE)

Para cada Unidad de Trabajo (UT), la calificación de cada Criterio de Evaluación (CE_k) abordado en la misma se calcula mediante la ponderación de tres instrumentos específicos:

$$\text{Nota}(\text{CE}_k) = 0.30 \cdot \overline{\text{Tareas}}_{\text{CE}_k} + 0.10 \cdot \overline{\text{Retos}}_{\text{CE}_k} + 0.60 \cdot \text{Test}_{\text{UT}}$$

1. **Tareas Evaluables de Aula / Plataforma (30% del CE)**:
   - Contribuyen en un **30%** a la calificación de ese CE concreto (únicamente si en la tarea se evalúa dicho criterio).
   - Son actividades individuales o guiadas realizadas en clase o en la plataforma (supuestos teóricos, ejercicios prácticos, configuraciones simuladas o cuestionarios de análisis).
   - Si en la misma UT existen varias tareas que aborden el mismo criterio CE_k, se calcula la **media aritmética** de las calificaciones obtenidas en ese CE.
2. **Retos Prácticos de Aula (10% del CE)**:
   - Contribuyen en un **10%** a la calificación de ese CE concreto (únicamente si el reto trabaja dicho criterio).
   - Si en la UT se realizan múltiples micro-retos de aula asociados al mismo CE_k, se calcula la **media aritmética** entre ellos.
3. **Examen Tipo Test de la Unidad de Trabajo (60% de todos los CE)**:
   - Prueba periódica objetiva que evalúa globalmente la totalidad de los Criterios de Evaluación trabajados en la UT, aportando un **60%** a cada uno de ellos.

> **Regla de Cobertura de Instrumentos**: En caso excepcional de que un Criterio de Evaluación en una UT determinada no cuente con tareas o retos asignados, el peso porcentual se redistribuirá proporcionalmente entre los instrumentos efectivamente aplicados para dicho criterio.

---

## 7.2. Ponderación de Criterios de Evaluación por Unidad de Trabajo

Cada Unidad de Trabajo integra un conjunto de Criterios de Evaluación ponderados porcentualmente en función de su relevancia y dedicación horaria lectiva:

| UT / UD | Título y Horas | RA | Criterios de Evaluación (CE) Trabajados | Peso en la UT (\omega_k) |
| :---: | :--- | :---: | :--- | :---: |
| **UT1** (15h) | Introducción a las Redes. Caracterización | **RA1** | **CE1.a**: Clasificación geográfica y topologías<br>**CE1.d**: Elementos constitutivos de red<br>**CE1.e**: Ventajas y compartición de recursos | 35%<br>35%<br>30% |
| **UT2** (30h) | Elementos y Espacios Físicos (Cableado) | **RA1**<br>**RA2** | **CE1.d**: Componentes físicos de red<br>**CE2.a**: Medios guiados (par trenzado y fibra)<br>**CE2.b**: Conectorización y crimpado RJ-45<br>**CE2.c**: Montaje en racks y rosetas<br>**CE2.d**: Verificación con comprobador<br>**CE2.e**: Seguridad y prevención en taller | 10%<br>20%<br>25%<br>20%<br>15%<br>10% |
| **UT3** (20h) | Arquitecturas de Redes y Modelos | **RA1** | **CE1.b**: Capas y funciones OSI vs TCP/IP<br>**CE1.c**: Unidades de datos (PDU) y encapsulado | 50%<br>50% |
| **UT4** (25h) | Dispositivos de Interconexión y Simulación | **RA1**<br>**RA3** | **CE1.a**: Dominios de colisión y difusión<br>**CE3.a**: Funciones de hubs, switches y routers<br>**CE3.b**: Configuración básica conmutadores<br>**CE3.e**: Modelado con Packet Tracer | 15%<br>25%<br>30%<br>30% |
| **UT5** (35h) | El Protocolo IP. Configuración Interfaces | **RA4** | **CE4.a**: Clases y rangos IP públicos/privados<br>**CE4.b**: Cálculo de subredes (FLSM / VLSM)<br>**CE4.c**: Configuración IP estática y dinámica<br>**CE4.e**: Diagnóstico CLI (ping, tracert, arp) | 20%<br>40%<br>20%<br>20% |
| **UT6** (25h) | Redes Inalámbricas y Redes Mixtas | **RA3** | **CE3.a**: Dispositivos inalámbricos (AP, routers)<br>**CE3.b**: Configuración Wi-Fi (SSID, canal, WPA2/3)<br>**CE3.e**: Integración mixta en Packet Tracer | 25%<br>45%<br>30% |
| **UT7** (30h) | Interconexión y Configuración de Equipos | **RA3**<br>**RA4**<br>**RA5** | **CE3.c**: Configuración de VLANs y troncales 802.1Q<br>**CE3.d**: Enrutamiento inter-VLAN (ROAS)<br>**CE4.c**: Direccionamiento de interfaces de red<br>**CE5.a**: Configuración de servidor/cliente DHCP | 30%<br>30%<br>20%<br>20% |
| **UT8** (20h) | Mantenimiento y Resolución de Incidencias | **RA5** | **CE5.b**: Resolución de nombres DNS<br>**CE5.c**: Captura de paquetes con Wireshark<br>**CE5.d**: Registro y documentación de averías | 30%<br>40%<br>30% |

La calificación de cada Unidad de Trabajo se obtiene a partir de la suma ponderada de sus CE:
$$\text{Nota}(\text{UT}) = \sum_{k} \left( \omega_k \cdot \text{Nota}(\text{CE}_k) \right)$$

---

## 7.3. Evaluaciones Trimestrales y Exámenes Especiales

La calificación otorgada en cada una de las tres evaluaciones trimestrales se estructura del siguiente modo:

### 1ª Evaluación (1º Trimestre · 90 horas):
- Se calcula a partir de las Unidades Didácticas UD01, UD02, UD03 y UD04 mediante la ponderación de sus horas lectivas:
  $$\text{Nota 1ª Eval} = \frac{15}{90}\text{UD01} + \frac{30}{90}\text{UD02} + \frac{20}{90}\text{UD03} + \frac{25}{90}\text{UD04}$$

### 2ª Evaluación (2º Trimestre · 60 horas) — Examen Especial de Subnetting:
- Las unidades del trimestre (UD05 y UD06) aportan el **80%** de la nota de la evaluación:
  $$\text{Nota UTs 2ª Eval} = \frac{35}{60}\text{UD05} + \frac{25}{60}\text{UD06}$$
- El **Examen Especial de Subnetting** aporta directamente el **20%** restante de la nota de la 2ª evaluación:
  $$\text{Nota 2ª Eval} = 0.80 \cdot \text{Nota UTs 2ª Eval} + \mathbf{0.20 \cdot \text{Examen Subnetting}}$$
- **Requisito Bloqueante Obligatorio**: Es **estrictamente obligatorio aprobar el Examen de Subnetting con una nota \ge 5.0** para poder superar la 2ª evaluación y el **RA4**. Si la calificación del examen es inferior a 5.0, la 2ª evaluación figurará con calificación máxima de 4.0 en el boletín hasta su recuperación.

### 3ª Evaluación (3er Trimestre · 50 horas) — Examen Especial de Packet Tracer:
- Las unidades del trimestre (UD07 y UD08) aportan el **80%** de la nota de la evaluación:
  $$\text{Nota UTs 3ª Eval} = \frac{30}{50}\text{UD07} + \frac{20}{50}\text{UD08}$$
- El **Examen Especial de Packet Tracer** aporta directamente el **20%** restante de la nota de la 3ª evaluación:
  $$\text{Nota 3ª Eval} = 0.80 \cdot \text{Nota UTs 3ª Eval} + \mathbf{0.20 \cdot \text{Examen Packet Tracer}}$$
- **Requisito Bloqueante Obligatorio**: Es **estrictamente obligatorio aprobar el Examen Final de Packet Tracer con una nota \ge 5.0** para superar la 3ª evaluación y los **RA3 / RA5**.

---

## 7.4. Calificación Final del Módulo y Ponderación de RAs

La calificación final ordinaria del módulo se determina exclusivamente a partir de la media ponderada de los **5 Resultados de Aprendizaje** oficiales:

$$\text{Nota Final} = 0.15 \cdot \text{RA1} + 0.20 \cdot \text{RA2} + 0.25 \cdot \text{RA3} + 0.25 \cdot \text{RA4} + 0.15 \cdot \text{RA5}$$

### Criterios de Superación y Recuperación:
1. **Calificación Final Global**: Se considera superado el módulo cuando la Nota Final ponderada sea **igual o superior a 5.0 puntos** (sobre 10.0).
2. **Requisito de Mínimo por RA**: Ningún Resultado de Aprendizaje individual podrá tener una calificación inferior a **4.0 puntos**. Un RA con nota inferior a 4.0 impide superar el módulo y debe recuperarse.
3. **Pruebas de Recuperación**: Al término de cada evaluación trimestral y en la convocatoria extraordinaria se realizarán pruebas específicas de recuperación para el alumnado con RAs o exámenes especiales pendientes.
