---
tipo: plantilla_recurso
modulo: "Proyecto Intermodular 2"
ciclo: "DAM"
modalidad: "Virtual"
titulo: "Plantilla Oficial de la Memoria Técnica del Proyecto"
formato: "A4, Márgenes 2.5cm, 12pt, Interlineado 1.5, 30-90 páginas"
actualizado: 2026-09-09
---

# 📋 Plantilla y Guía de Estilo: Memoria Técnica de Fin de Ciclo (DAM)
## Centro Integrado de Formación Profesional (CIFP Avilés) · Modalidad Virtual

> **Uso de la Plantilla**: Este documento define el índice normalizado, la estructura obligatoria de capítulos y los estándares de formato tipográfico exigidos para la redacción de la memoria del Proyecto Intermodular de DAM.
> **Carácter**: Trabajo **estrictamente individual**.

---

## 🎨 Normas Formales de Edición (Obligatorias)

El incumplimiento de estas normas de maquetación restará puntuación en el criterio de *Aspectos Formales* de la rúbrica:

- **Configuración de Página**: Tamaño estándar **DIN A4**. Márgenes superior, inferior, izquierdo y derecho de **2,5 cm**.
- **Tipografía**: Fuente **Arial**, **Calibri** o **Times New Roman** a **12 puntos** para el cuerpo de texto.
- **Párrafo**:
  - Alineación **justificada**.
  - Interlineado de **1,5 líneas**.
  - Espaciado posterior entre párrafos de **6 pt** (sin líneas en blanco vacías).
- **Extensión Exigida**: **Mínimo 30 páginas y máximo 90 páginas** (computadas entre la *Introducción* y el final del *Manual de Usuario*, excluyendo anexos extensos).
- **Paginación**:
  - Páginas preliminares (índices, siglas): numeración romana en minúscula (*i, ii, iii...*).
  - Cuerpo de la memoria: numeración arábiga (*1, 2, 3...*) centrada o a la derecha en pie de página.
- **Formato de Entrega**: Archivo digital en formato editable **DOCX** y compilado en **PDF**.

---

## 📑 Estructura de la Memoria (Índice Oficial)

```markdown
PORTADA INSTITUCIONAL
ÍNDICE GENERAL
ÍNDICE DE FIGURAS Y TABLAS
GLOSARIO DE SIGLAS Y ACRÓNIMOS

PARTE I: DESARROLLO DE LA MEMORIA TÉCNICA
  1. Introducción y Justificación
  2. Descripción del Proyecto: Objetivos y Alcance
  3. Métodos y Herramientas de Desarrollo
  4. Análisis y Diseño de la Solución
  5. Planificación Temporal y Presupuesto
  6. Futuras Mejoras y Líneas de Evolución
  7. Conclusiones y Valoración Personal
  8. Bibliografía y Referencias Normativas

PARTE II: PUESTA EN PRODUCCIÓN Y GUÍA TÉCNICA
  1. Requisitos Previos del Sistema
  2. Procedimiento de Instalación y Despliegue (Docker / Local)
  3. Administración, Variables de Entorno y Configuración

PARTE III: MANUAL DE USUARIO
  1. Flujo de Acceso y Autenticación
  2. Operaciones Principales y Casos de Uso Guiados
  3. Importación y Exportación de Ficheros

PARTE IV: ANEXOS
  Anexo A: Esquema DDL de Base de Datos / Modelo JSON
  Anexo B: Especificación de Endpoints API REST (Swagger/OpenAPI)
  Anexo C: Batería de Pruebas Unitarias y de Integración
```

---

## 📝 Guía de Redacción Capítulo a Capítulo

### Portada Institucional
Debe incluir de forma visible:
- Identificación del Centro: **CIFP Avilés**.
- Ciclo: **C.F.G.S. Desarrollo de Aplicaciones Multiplataforma (DAM)** · Modalidad Virtual.
- Curso Académico: **2026-2027**.
- **Título del Proyecto**: Claro, conciso y técnico.
- **Autor/a**: Nombre y apellidos del alumno/a (único autor).
- **Tutor/a Colectivo/a y Tutor/a Individual**: Nombre y apellidos del docente responsable (Sergio).
- Lugar y Fecha de Convocatoria: *Avilés, [Marzo/Junio 2027]*.

---

### Índices Preliminares
1. **Índice General**: Títulos de primer nivel numerados (*1, 2, 3...*), subsecciones (*1.1, 1.2...*) con sus correspondientes números de página.
2. **Índice de Ilustraciones y Tablas**:
   - Cada gráfico o captura debe etiquetarse como: `Ilustración N: Título descriptivo (Fuente: Elaboración propia / referencia) ...... Pág. X`.
   - Cada tabla: `Tabla N: Nombre descriptivo ...... Pág. X`.
3. **Siglas y Acrónimos**:
   - Tabla ordenada alfabéticamente con las siglas técnicas utilizadas (ej. *API, CRUD, DTO, JPA, JWT, MVC, ORM, REST, SOLID, UML*).

---

### PARTE I: Desarrollo de la Memoria

#### 1. Introducción y Justificación
- **Resumen general**: Qué problema del mundo real resuelve la aplicación.
- **Destinatarios**: A qué perfil de usuarios o empresas va dirigida la solución.
- **Motivación y necesidad**: Por qué surgió la idea y qué valor añadido aporta respecto a soluciones existentes.

#### 2. Descripción del Proyecto: Objetivos y Alcance
- **Objetivo General**: Qué se quiere lograr en términos cuantitativos y cualitativos.
- **Objetivos Específicos**: Desglose SMART (módulos funcionales concretos).
- **Alcance**: Qué funcionalidades y entregables quedan estrictamente incluidos dentro de la versión v1.0 y qué queda explícitamente fuera para futuras iteraciones.

#### 3. Métodos y Herramientas de Desarrollo
- Justificación razonada de la selección tecnológica realizada libremente por el alumno:
  - **Lenguajes y Frameworks de Backend**: Justificación técnica de la plataforma elegida para la lógica de negocio y la API.
  - **Persistencia de Datos**: Motor de base de datos seleccionado (relacional o no relacional) y mecanismo de acceso/mapeo empleado.
  - **Capa Cliente / Presentación**: Justificación de la interfaz gráfica elegida (escritorio, móvil nativo/híbrido o web).
  - **Herramientas de Entorno y Despliegue**: Control de versiones (Git), entorno de desarrollo (IDE) y estrategia de ejecución/empaquetado.

#### 4. Análisis y Diseño de la Solución
- **4.1. Modelo de Datos**:
  - Diagrama Entidad-Relación (E/R) normalizado con relaciones `1:N`, `N:M` y cardinalidades.
  - Justificación de tipos de datos, claves primarias y foráneas, e índices.
- **4.2. Diagramas de Clases y Arquitectura**:
  - Diagrama de clases de dominio UML.
  - Estructura desacoplada en paquetes (*controllers, services, repositories, models, dtos*).
- **4.3. Casos de Uso y Flujos de la Aplicación**:
  - Diagrama de casos de uso y especificación textual de los flujos principales y alternativos.
- **4.4. Legislación Aplicable, Seguridad y Privacidad**:
  - Cumplimiento del Reglamento General de Protección de Datos (**RGPD / LOPD-GDD**).
  - Políticas de almacenamiento seguro de contraseñas (*BCrypt*), sesiones y tokens (*JWT*).
- **4.5. Pruebas y Control de Calidad**:
  - Estrategia de pruebas unitarias (*JUnit 5, Mockito*) y pruebas de integración sobre endpoints REST.

#### 5. Planificación y Presupuesto
- **5.1. Cronograma y Diagrama de Gantt**:
  - Distribución temporal del esfuerzo semana a semana a lo largo del curso.
- **5.2. Presupuesto Económico Detallado**:
  - Coste de mano de obra (horas estimadas de ingeniería de software a coste/hora de mercado).
  - Costes de infraestructura: servidores cloud, hosting, dominios, licencias software y amortización de hardware.

#### 6. Futuras Mejoras y Ampliaciones
- Líneas de evolución natural del producto para una hipotética versión v2.0 (ej. pasarelas de pago, análisis con IA, notificaciones push, internacionalización).

#### 7. Conclusiones y Valoración Personal
- Balance crítico del cumplimiento de objetivos.
- Dificultades técnicas encontradas durante el desarrollo y cómo se solventaron.
- Aprendizaje profesional consolidado durante la ejecución del proyecto.

#### 8. Bibliografía y Webgrafía
- Citación normalizada siguiendo el formato **APA 7ª edición** o norma **UNE-ISO 690:2013**.
- Incluir referencias a documentación oficial, libros y artículos técnicos consultados.

---

### PARTE II: Puesta en Producción del Proyecto
- **Instalación paso a paso**: Requisitos de software previo (JRE/JDK, base de datos o Docker Engine).
- **Despliegue con Docker Compose**: Explicación del archivo `docker-compose.yml` para levantar la base de datos, el backend y los servicios auxiliares con un único comando.
- **Variables de configuración**: Puertos, cadenas de conexión a base de datos (*JDBC URL*), claves secretas JWT y credenciales por defecto.

---

### PARTE III: Manual de Usuario
- Manual ilustrado dirigido al usuario final.
- Capturas de pantalla reales comentadas paso a paso:
  - Registro, inicio de sesión y control de acceso por roles.
  - Operaciones CRUD sobre cada una de las entidades principales.
  - Utilidad de importación masiva y exportación de ficheros (JSON / XML / CSV).
  - Manejo de filtros, búsquedas y visualización de errores controlados.

---

## 🎥 Indicaciones para la Defensa Audiovisual (Vídeo)

1. **Duración**: Entre **10 y 20 minutos** como máximo.
2. **Formato**: Grabación en vídeo realizada preferentemente a través de **Microsoft Teams** (o software equivalente como OBS Studio), compartiendo el escritorio del alumno.
3. **Contenido Obligatorio del Vídeo**:
   - Presentación del alumno y del título del proyecto.
   - Demostración funcional en vivo (registro, operaciones CRUD, filtros y exportación/importación de ficheros).
   - Recorrido técnico breve por el código fuente en el IDE (mostrando la arquitectura en capas y los tests).
   - Conclusiones y cierre.
4. **Entrega**: Subida del archivo de vídeo (MP4) o enlace a vídeo privado en Microsoft Stream / OneDrive / YouTube no listado.
