---
tipo: ejercicio
modulo: "Proyecto Intermodular 2"
ciclo: "DAM"
curso: 2
modalidad: "Virtual"
titulo: "Enunciado Oficial del Proyecto Intermodular de Fin de Ciclo"
individual: true
actualizado: 2026-09-14
---

# 🚀 Enunciado Oficial: Proyecto Intermodular 2 (DAM)
## Ciclo Formativo de Grado Superior: Desarrollo de Aplicaciones Multiplataforma
### Centro Integrado de Formación Profesional (CIFP Avilés) · Modalidad Virtual · Curso 2026-2027

---

## 🎯 1. Finalidad y Alcance del Proyecto

El módulo de **Proyecto Intermodular 2** capacita al alumnado para concebir, diseñar, implementar, probar, documentar y defender una solución software multiplataforma integral. El proyecto sintetiza los conocimientos adquiridos a lo largo de todo el ciclo formativo (*Acceso a Datos*, *Desarrollo de Interfaces*, *Programación Multimedia y Dispositivos Móviles*, *Programación de Servicios y Procesos*, *Sistemas de Gestión Empresarial*).

> [!IMPORTANT]
> **Carácter Estrictamente Individual**:
> El proyecto es **100% individual**. Cada alumno es el único responsable de la arquitectura, codificación, memoria técnica y defensa audiovisual de su producto software. No se admiten trabajos en grupo ni fragmentaciones compartidas.

---

## 🧩 2. Estructura General de la Solución

El proyecto exige el desarrollo de un sistema informático completo compuesto por las siguientes capas:

### 2.1. Análisis y Diseño
- **Definición del Alcance y Casos de Uso**: Especificación clara de los problemas reales que resuelve el sistema y diagramas de casos de uso (UML).
- **Modelo de Persistencia**: Diagrama Entidad/Relación (E/R) normalizado (en caso de BBDD relacional) o modelo documental coherente (en caso de NoSQL).
- **Arquitectura de Software**: Diagramas de clases, paquetes y flujo de datos.
- **Diseño de Interfaz (Mockups/Wireframes)**: Bocetos visuales previos de las vistas y pantallas de usuario.

### 2.2. Desarrollo Técnico y Arquitectura (Libre Elección Tecnológica Justificada)
El alumnado dispone de **libertad para seleccionar el stack tecnológico** que mejor resuelva la problemática planteada, debiendo justificar su elección en la memoria técnica. Como pauta general, el sistema deberá articular:
- **Backend / Capa de Servicios**: Lógica de negocio estructurada en capas desacopladas (*Controladores/Endpoints, Servicios de Dominio, Repositorios/Acceso a Datos, DTOs*). Elección libre de lenguaje y framework de servidor.
- **Persistencia de Datos**:
  - Motor de base de datos relacional (SQL) con mapeo objeto-relacional (ORM), garantizando integridad referencial.
  - O bien base de datos no relacional (NoSQL documental o similar) con esquema coherente.
- **Frontend / Cliente de Usuario**:
  - Aplicación de escritorio multiplataforma.
  - O aplicación móvil nativa o multiplataforma.
  - O interfaz web cliente desarrollada con estándares modernos.
- **Servicios e Integración**:
  - Exposición y consumo de servicios API (REST, GraphQL o RPC) con intercambio de mensajes estructurados.
- **Gestión de Ficheros**:
  - Módulo de importación y exportación de información mediante ficheros estructurados (**JSON, XML o CSV**), permitiendo carga masiva o copias de seguridad de datos.

### 2.3. Documentación y Entrega
- **Memoria Técnica Oficial del Proyecto**: Elaborada conforme a la plantilla normalizada del CIFP Avilés (30 a 90 páginas).
- **Manual de Puesta en Producción / Instalación**: Guía técnica de despliegue, preferentemente contenerizada con **Docker / Docker-compose**.
- **Manual de Usuario**: Guía visual ilustrada para el usuario final del sistema.

### 2.4. Defensa Audiovisual del Proyecto
- **Vídeo demostrativo (10 a 20 minutos)**: Grabación en vídeo realizada por el propio alumno (mediante Microsoft Teams compartiendo escritorio y con narración explicativa de su voz), mostrando el funcionamiento real en vivo y justificando las decisiones de arquitectura.

---

## 📋 3. Requisitos Mínimos Excluyentes

Para que el proyecto pueda ser evaluado positivamente, debe cumplir rigurosamente los siguientes requisitos mínimos:

1. ✅ **Modelo de Datos Relacional o NoSQL**: Al menos **3 entidades fuertemente relacionadas** entre sí con integridad referencial.
2. ✅ **Operaciones CRUD Completas**: Implementación funcional de altas, consultas con filtros, modificaciones y bajas lógicas/físicas sobre las entidades principales.
3. ✅ **Capa de Persistencia Robusta**: Gestión de acceso a datos mediante librerías de mapeo (ORM/ODM) o controladores estructurados, asegurando integridad, consultas eficientes y control de transacciones.
4. ✅ **Interfaz Gráfica de Usuario Operativa**: Interfaz de escritorio, móvil o web ergonómica, estable y conectada al backend en tiempo real.
5. ✅ **Importación / Exportación de Ficheros**: Funcionalidad de lectura y generación de ficheros (XML, JSON o CSV) para intercambio de datos.
6. ✅ **Trazabilidad en Control de Versiones**: Repositorio Git con evolución continuada semana a semana. No se admiten proyectos entregados en un único commit final.

---

## 📅 4. Calendario Oficial de Entregas y Convocatorias
 
 El módulo se organiza por evaluaciones con entregas formativas oficiales:
 
 ```
 +-----------------------------------------------------------------------------------+
 |  1ª ENTREGA PARCIAL (1ª Evaluación: 16/12/2026)                                   |
 |  - Anteproyecto formal: requisitos, casos de uso, diagrama E/R y mockups.         |
 |  - Justificación técnica del stack y repositorio Git inicial.                     |
 |  - SIN PROTOTIPO FUNCIONAL (no se exige código ejecutable en esta fase).          |
 +-----------------------------------------------------------------------------------+
                                          │
                                          ▼
 +-----------------------------------------------------------------------------------+
 |  2ª ENTREGA PARCIAL (2ª Evaluación 2º DAM: 25/02/2027)                            |
 |  - Entrega de TODO EL PROYECTO: Software v1.0, Memoria Oficial y Vídeo Teams.     |
 |  - APROBADO DIRECTO DEL MÓDULO: Si se aprueban las dos parciales, se aprueba el   |
 |    módulo directamente antes de ir a la primera convocatoria ordinaria.           |
 +-----------------------------------------------------------------------------------+
                                          │
                                          ▼
 +-----------------------------------------------------------------------------------+
 |  CONVOCATORIAS ORDINARIAS OFICIALES (Recuperación con Todo el Proyecto)           |
 |  - 1ª Evaluación Final (1ª Ordinaria Oficial): 27/05/2027.                        |
 |  - 2ª Evaluación Final (2ª Ordinaria / Extraordinaria): 16/06/2027.               |
 |  - Para quienes no superen las entregas parciales por suspenso o no entrega.      |
 |  - Presentación íntegra de TODO el proyecto (Software + Memoria + Vídeo).         |
 +-----------------------------------------------------------------------------------+
 ```
 
 > [!CAUTION]
 > **Criterios Muy Estrictos: Fecha, Forma, Vías de Superación y Autoría con IA**:
 > 1. **Superación por Evaluación Continua**: El módulo se supera aprobando las **dos entregas parciales**. Quien apruebe ambas parciales tiene el módulo superado antes de concurrir a la primera convocatoria ordinaria.
 > 2. **Recuperación en Convocatorias Ordinarias con Todo el Proyecto**: Si no se superan las entregas parciales, se recupera en las dos convocatorias ordinarias oficiales presentando **todo el proyecto completo** (software 100% operativo en Git, memoria oficial según plantilla y vídeo grabado en Teams).
 > 3. **Nota Mínima y Completitud**: **No se podrá superar el Proyecto Intermodular 2 sin tener un 5,0 mínimo en la entrega completa/final y todos los puntos tendrán que estar rigurosamente completados (vídeo demostrativo, código software operativo, memoria técnica oficial conforme a plantilla)**.
 > 4. **Entregas Complementarias**: A voluntad del profesor se podrán requerir entregas intermedias adicionales durante el curso.
 > 5. **Uso de Inteligencia Artificial (IA) y Autoría del Código**: El uso de herramientas de IA está permitido siempre y cuando el estudiante **comprenda y domine con rigor lo que se está realizando** («sabiendo lo que se hace»). El profesor se reserva expresamente el derecho de realizar revisiones individuales del proyecto en las que preguntará por puntos y líneas específicas del código implementado; el alumno deberá aportar las explicaciones pertinentes demostrando el dominio técnico de la solución. Si las explicaciones aportadas no son válidas, resultan incoherentes o evidencian el desconocimiento del código presentado, **será motivo directo de calificación de suspenso en el módulo**.
 >
 > 📢 **Sesiones Oficiales de Evaluación a Distancia (CIFP Avilés)**:  
 > - **Primera Evaluación**: 1º y 2º curso el **16/12/2026**.  
 > - **Segunda Evaluación**: 2º curso el **25/02/2027** · 1º curso el **17/03/2027**.  
 > - **1ª Evaluación Final (Ordinaria)**: 1º y 2º curso el **27/05/2027**.  
 > - **2ª Evaluación Final (Extraordinaria)**: 1º y 2º curso el **16/06/2027**.  
 > Las horas límites exactas de cierre en plataforma se notificarán y publicarán a lo largo del curso a través del **aula virtual** (Moodle / Teams).
 
 ---
 
 ## 📊 5. Criterios de Evaluación y Calificación Final de Ciclo
 
 ### 5.1. Ponderación Conjunta (1º y 2º de DAM)
 Conforme a la programación conjunta de ciclo, la calificación de las actividades de 1º DAM no se incluye en las notas del primer año y se aplica exclusivamente a la nota final de Proyecto Intermodular 2 en segundo curso:
 
 $$\text{Calificación Final de Proyecto Intermodular 2} = (0.10 \times \text{Nota Proyecto 1º DAM}) + (0.90 \times \text{Nota Proyecto 2º DAM})$$
 
 ### 5.2. Rúbrica de Proyecto 2º DAM (CIFP Avilés)
 La evaluación de segundo curso se desglosa según la **Rúbrica Oficial del CIFP Avilés** (90% de la nota final del módulo):
 
 | Bloque Evaluado | Ponderación | Criterios Clave de Desempeño |
 | :--- | :---: | :--- |
 | **Proyecto Software (Técnico)** | **50%** | Funcionamiento completo y robusto (sin caídas), calidad del código (Clean Code), modularidad en capas, persistencia consistente, gestión de excepciones, importación/exportación de ficheros y batería de pruebas. |
 | **Memoria Técnica Escrita** | **30%** | Rigor formal conforme a plantilla oficial (formato A4, márgenes 2.5cm, letra 12pt, interlineado 1.5, 30-90 págs., DOCX y PDF), redacción profesional sin faltas, diagramas E/R y UML, conclusiones fundamentadas y citas bibliográficas (APA/UNE). |
 | **Vídeo Demostrativo y Defensa** | **20%** | Claridad y soltura expositiva individual en Teams, rigor técnico al explicar el código, ajuste estricto al tiempo establecido (10-20 min) y demostración operativa en vivo de la aplicación. |
 
 > [!NOTE]
 > **Condición indispensable**: Es imprescindible obtener una calificación igual o superior a **5,0 sobre 10** en la entrega final y en cada uno de los tres bloques individuales de 2º (Proyecto, Memoria y Vídeo), con todos los puntos y entregables 100% completados, para poder superar el módulo.
