# 🤖 Instrucciones para Agentes de Inteligencia Artificial (AGENTS.md)

Este repositorio es una bóveda de **Obsidian** diseñada para la gestión docente de Formación Profesional (FP) bajo el principio de **Única Fuente de Verdad (Single Source of Truth - SSOT)**.

Cualquier agente de IA (Antigravity, Cursor, Claude Code, GitHub Copilot, Windsurf, Cline/Roo, Aider, etc.) que trabaje en este espacio de trabajo debe cumplir rigurosamente las siguientes directrices:

---

## 📌 1. REGLA OBLIGATORIA: Carga de Contexto Inicial (MOC Principal)

> **ANTES DE RESPONDER O EMPEZAR CUALQUIER TAREA:**
> El agente **DEBE leer y añadir a su contexto de trabajo** el archivo principal del repositorio:
>
> 📄 **`00-Mapa-de-Contenido-Principal.md`**

### ¿Por qué es obligatorio?
- Este archivo es el **MOC Principal (Map of Content)** y el Panel de Control General de toda la bóveda.
- Define y enlaza toda la arquitectura docente:
  - **Módulos curriculares SSOT** (`01-Modulos/`)
  - **Grupos operativos y aulas** (`02-Grupos/`)
  - **Unidades didácticas y bancos de evaluación**
  - **Documentos de centro y normativas** (`03-Documentos-Centro/`)
- Sin este archivo en contexto, el agente carece de la visión global del sistema y cometerá errores de duplicación o desestructuración.

---

## 🔄 2. REGLA CRÍTICA: Mantenimiento Continuo del MOC

> **EL MOC PRINCIPAL DEBE MANTENERSE SIEMPRE ACTUALIZADO:**
> Cada vez que se realice cualquier modificación que altere la estructura o contenido de la bóveda, el agente **tiene la obligación de actualizar `00-Mapa-de-Contenido-Principal.md`**.

### Casos de actualización obligatoria:
1. **Creación, modificación, renombrado o eliminación de módulos** (`01-Modulos/`):
   - Actualizar la tabla de *Módulos Curriculares* con sus enlaces a `[[MOC-...]]` y `[[Compilador-...]]`.
2. **Creación, modificación o eliminación de grupos de clase** (`02-Grupos/`):
   - Actualizar los *Accesos Directos a Grupos* con sus enlaces a calendarios, diarios de aula y cuadernos de notas.
3. **Altas o reubicaciones de Unidades Didácticas o Programaciones**:
   - Asegurar que los accesos rápidos o referencias del MOC reflejen la situación real.
4. **Nuevas herramientas, guías o recursos globales** (`00-Meta/`):
   - Actualizar la sección *Herramientas y Metadatos del Sistema*.
5. **Frontmatter YAML**:
   - Cada vez que se modifique el archivo, actualizar la propiedad `actualizado: AAAA-MM-DD` en el frontmatter del propio `00-Mapa-de-Contenido-Principal.md`.

---

## 🏛️ 3. Principios de Arquitectura del Vault

1. **Principio SSOT (Single Source of Truth)**:
   - Todo lo curricular (RAs, Criterios, Saberes Básicos, Unidades, Teoría, Ejercicios y Banco de Preguntas) vive exclusivamente en `01-Modulos/<Nombre-Modulo>/`.
   - **NUNCA** duplicar contenido teórico o curricular en las carpetas de `02-Grupos/`.
   - Las carpetas de `02-Grupos/` contienen únicamente datos operativos de ese grupo concreto (alumnos, sesiones, faltas, diarios de clase, calificaciones). Cuando necesitan conceptos, actividades o recursos, enlazan o transcluyen desde `01-Modulos/`.
2. **Sintaxis y Estilo Obsidian**:
   - Utilizar enlaces internos wiki en formato `[[Nombre-Nota]]` o `[[Nombre-Nota|Texto legible]]`.
   - No romper las consultas automáticas de **Dataview** (bloques ```dataview ... ```).
   - Respetar los metadatos YAML de cada nota (`tipo`, `modulo`, `curso_academico`, etc.).

---

## 🧠 4. Terminología y Estructura: Notas Atómicas de CONCEPTOS vs Apuntes

> **REGLA ESTRICTA DE VOCABULARIO Y ESTRUCTURA:**
> - En la base modular curricular se habla siempre de **CONCEPTOS** (notas atómicas en **`02-Conceptos/`** con metadato `tipo: concepto` y prefijo `CON-`).
> - Los **apuntes** son los documentos temáticos completos maquetados para el alumnado.

---

## 🖨️ 5. Generación de Apuntes: Uso Obligatorio de la Skill `generar-apuntes`

> **REGLA OBLIGATORIA AL GENERAR APUNTES:**
> Cada vez que el usuario solicite crear, compilar o generar un documento de **apuntes** (de un tema, unidad didáctica o módulo), el agente **DEBE utilizar obligatoriamente la skill `generar-apuntes`**:
>
> 📁 **`.agents/skills/generar-apuntes/SKILL.md`**

### Requisitos estrictos del proceso:
1. **Adherencia Estricta al Prompt Maestro de FP** (`.agents/skills/generar-apuntes/references/prompt-maestro-apuntes-fp.md`):
   - **Autosuficiencia y Didáctica**: El alumno debe poder estudiar la unidad principalmente con estos apuntes. Priorizar siempre:
     $$\mathbf{COMPRENSIÓN \longrightarrow EJEMPLOS \longrightarrow APLICACIÓN \longrightarrow PROFUNDIZACIÓN}$$
   - **Estructura Didáctica Obligatoria (11 Bloques)**:
     1. Introducción contextualizada (utilidad profesional).
     2. Conceptos fundamentales (definición intuitiva antes de la formal).
     3. Desarrollo progresivo y exhaustivo (*Concepto → Explicación Detallada → Ejemplo Documentado → Aplicación Práctica*): Prohibido ser escueto o saltarse explicaciones. No comparar librerías directamente sin antes haber explicado a fondo cada una por separado (arquitectura, métodos/instrucciones más usadas con sus parámetros y ejemplos funcionales paso a paso).
     4. Ejemplos prácticos graduados (básico → intermedio → profesional).
     5. Código funcional, limpio y documentado con explicación paso a paso.
     6. Errores habituales (explicando el *por qué*, cómo detectarlos y cómo solucionarlos).
     7. Buenas prácticas de la industria.
     8. Tablas comparativas entre tecnologías o conceptos análogos.
     9. Resumen clave de la unidad.
     10. Conceptos que debes dominar (habilidades comprobables).
     11. Glosario técnico y 8 a 15 Preguntas de repaso sin respuesta inmediata.
2. **Extracción curricular (SSOT)**: Integrar y articular las notas atómicas de conceptos disponibles en `01-Modulos/<Modulo>/02-Conceptos/`.
3. **Maquetación en HTML**: Generar el documento web con la estructura semántica y estilos de `.agents/skills/generar-apuntes/resources/estilo-apuntes.css` (portada FP, índice interactivo, cajas didácticas *callouts*, bloques de código contrastados y reglas `@media print`).
4. **Portada Obligatoria y Cero Páginas en Blanco**:
   - Todo documento debe abrir con una **portada institucional completa y formal** (Título de la unidad, subtítulo explicativo, módulo, ciclo DAM/DAW, curso académico, docente y RAs asociados).
   - **Prohibido generar una primera página en blanco en los PDFs**: En CSS de impresión (`@media print`), contenedores con `overflow: visible`, `display: block` y `margin: 0`.
5. **Conversión a PDF (A4)**: Ejecutar el script automatizado:
   ```powershell
   powershell -ExecutionPolicy Bypass -File ".agents/skills/generar-apuntes/scripts/html-to-pdf.ps1" -HtmlPath "<Ruta-Al-Html>"
   ```
6. **Destino de archivos**: Almacenar tanto el archivo `.html` como el `.pdf` en `01-Modulos/<Modulo>/06-Apuntes/UTx/`.
7. **Mantenimiento del MOC**: Enlazar los apuntes generados en el MOC del módulo (`01-Modulos/<Modulo>/MOC-...`) y en `00-Mapa-de-Contenido-Principal.md`.

---

## 📑 6. Generación de Programaciones Didácticas: Uso Obligatorio de la Skill `generar-programacion`

> **REGLA OBLIGATORIA AL GENERAR O COMPILAR PROGRAMACIONES DIDÁCTICAS:**
> Cada vez que el usuario solicite crear, compilar, maquetar o generar la **programación didáctica oficial** de un módulo, el agente **DEBE utilizar obligatoriamente la skill `generar-programacion`**:
>
> 📁 **`.agents/skills/generar-programacion/SKILL.md`**

### Requisitos estrictos del proceso:
1. **Estilo Institucional Oficial (CIFP Avilés)**:
   - Portada oficial con membrete del Principado de Asturias, logotipo del CIFP Avilés, rótulo vertical "PROGRAMACIÓN DOCENTE" y cuadro técnico enmarcado.
   - Tipografía institucional `Cambria` para títulos, paleta en azul corporativo (`#365F91`, `#243F60`), marca de agua tenue y tablas estilizadas.
2. **Respeto a los Contenidos del Módulo (SSOT)**:
   - **La skill es para el estilo, no para los contenidos**: NUNCA alterar, forzar ni inventar contenidos o secciones predefinidas.
   - Respetar escrupulosamente los apartados y redacción que el docente haya establecido en `01-Modulos/<Modulo>/00-Programacion/` y su compilador. Habrá programaciones que sigan los 12 apartados clásicos y otras con estructuras diferentes o más reducidas (como Proyecto Intermodular).
3. **Cero Páginas en Blanco**:
   - La portada debe abrir directamente en la página 1 sin hojas en blanco previas o intermedias en el PDF.
4. **Conversión Automatizada a PDF (A4)**:
   ```powershell
   powershell -ExecutionPolicy Bypass -File ".agents/skills/generar-programacion/scripts/html-to-pdf.ps1" -HtmlPath "<Ruta-Al-Html>"
   ```
5. **Almacenamiento y Enlace**:
   - Guardar tanto el `.html` como el `.pdf` en `01-Modulos/<Modulo>/00-Programacion/`.
   - Enlazar la programación en el MOC del módulo y en `00-Mapa-de-Contenido-Principal.md`.

---

## 🖥️ 7. Generación de Presentaciones Iniciales de Módulo: Uso Obligatorio de la Skill `generar-presentaciones`

> **REGLA OBLIGATORIA AL GENERAR PRESENTACIONES INICIALES DE MÓDULO:**
> Cada vez que el usuario solicite crear, diseñar o generar diapositivas para el **primer día de clase o presentación general de un módulo formativo** (guía docente, temporalización general, normas y sistema de evaluación), el agente **DEBE utilizar obligatoriamente la skill `generar-presentaciones`**:
>
> 📁 **`.agents/skills/generar-presentaciones/SKILL.md`**

### Requisitos estrictos del proceso:
1. **Identidad Docente e Institucional**:
   - **Estética Tecnológica de Alto Impacto (*Dark Tech*)**: Tema oscuro de alto contraste y legibilidad óptima para proyector.
   - **Pie de diapositiva obligatorio**: Todas las diapositivas de contenido deben incluir en el pie el nombre del docente: `CIFP Avilés · Sergio Capdevila Díez`.
   - **Logotipo institucional**: Incluir el escudo/logo del CIFP Avilés (incrustado como data URI base64) tanto en la portada como en la cabecera/pie de las diapositivas.
2. **Estructura de la Portada**:
   - Título temático visible y subtítulo explicativo.
   - Unidad de trabajo correspondiente (UT / UD).
   - Resultados de Aprendizaje (RAs) y Criterios de Evaluación trabajados en la sesión.
3. **Interactividad y Control de Aula**:
   - Formato 16:9 responsive con tema oscuro de alto contraste y legibilidad óptima para proyector.
   - Controles táctiles en pantalla para PDI (anterior, siguiente, pantalla completa `F`, modo impresión `P`) y atajos de teclado (`Flechas`, `Espacio`).
   - Barra de progreso superior y contador de diapositivas (`X / Y`).
4. **Exportación a PDF Apaisado y Cero Páginas en Blanco o con Controles al Final**:
   - Generar el PDF mediante el script:
     ```powershell
     powershell -ExecutionPolicy Bypass -File ".agents/skills/generar-presentaciones/scripts/html-to-pdf.ps1" -HtmlPath "<Ruta-Al-Html>"
     ```
   - El CSS de impresión (`@media print`) debe configurar cada diapositiva en una única página A4 apaisada (`297mm x 210mm`) sin páginas en blanco al inicio, intermedias o al final.
   - **Regla estricta**: Forzar `page-break-after: avoid !important; break-after: avoid !important;` en `.slide:last-child` y ocultar de forma absoluta todos los controles y barras de navegación (`#controls`, `#nav-controls`, `.controls-overlay`, `nav`, botones `‹ › ⛶ 🖨️`) con `display: none !important; height: 0 !important;` para evitar páginas huérfanas con glifos residuales.
5. **Almacenamiento y Enlace**:
   - Guardar tanto el `.html` interactivo como el `.pdf` en `01-Modulos/<Modulo>/07-Presentaciones/UTx/`.
   - Enlazar las presentaciones generadas en el MOC del módulo y en la nota de la unidad didáctica respectiva.

---

## 🛠️ 8. Generación de Prácticas Técnicas: Uso Obligatorio de la Skill `generar-practicas`

> **REGLA OBLIGATORIA AL GENERAR PRÁCTICAS, RETOS O GUÍAS DE EVALUACIÓN:**
> Cada vez que el usuario solicite crear, compilar, redactar o maquetar **prácticas de clase, proyectos guiados o pruebas diagnósticas/iniciales**, el agente **DEBE utilizar obligatoriamente la skill `generar-practicas`**:
>
> 📁 **`.agents/skills/generar-practicas/SKILL.md`**

### Requisitos estrictos del proceso:
1. **Estructura Pedagógica Obligatoria**:
   - **Cabecera y Cuadro de Metadatos**: Membrete CIFP Avilés, Ciclo, Módulo, Código, Modalidad, Duración estimada y Carácter (formativa / evaluable / diagnóstica).
   - **Alineación Curricular**: Badges explícitos con los Resultados de Aprendizaje (`RA`) y Criterios de Evaluación (`CE`) trabajados.
   - **Enunciado Contextualizado**: Supuesto técnico realista paso a paso con código de partida, esquemas de datos y requisitos.
   - **Entorno y Política de IA**: Eclipse IDE como entorno de referencia (admitiéndose otros como IntelliJ/VS Code con Maven) y pautas claras sobre el uso de IA.
   - **Rúbrica Analítica de Evaluación**: Tabla formal con ponderación detallada por criterio y 4 niveles de logro (Excelente, Notable, Aprobado, Insuficiente) sumando 10.0 puntos.
2. **Maquetación y Cero Páginas en Blanco**:
   - Maquetación en HTML profesional con `estilo-practicas.css`.
   - Conversión automatizada a PDF (A4 vertical) mediante:
     ```powershell
     powershell -ExecutionPolicy Bypass -File ".agents/skills/generar-practicas/scripts/html-to-pdf.ps1" -HtmlPath "<Ruta-Al-Html>"
     ```
3. **Almacenamiento y Enlace**:
   - Guardar `.html` y `.pdf` en `01-Modulos/<Modulo>/03-Ejercicios/...`.
   - Enlazar en el MOC del módulo y en `00-Mapa-de-Contenido-Principal.md`.

---

## 💡 9. Generación de Presentaciones Teóricas de Unidades de Trabajo (UTs): Uso Obligatorio de la Skill `generar-presentaciones-ut`

> **REGLA OBLIGATORIA AL GENERAR PRESENTACIONES TEÓRICAS DE UNIDADES DIDÁCTICAS (UTs / UDs):**
> Cada vez que el usuario solicite crear, compilar, diseñar o generar diapositivas para impartir **contenidos teóricos de una Unidad de Trabajo (UT1, UT2, etc.)**, el agente **DEBE utilizar obligatoriamente la skill `generar-presentaciones-ut`**:
>
> 📁 **`.agents/skills/generar-presentaciones-ut/SKILL.md`**

### Requisitos estrictos del proceso:
1. **Paleta de Colores Claros Institucionales (Luminosa y Nítida)**:
   - Fondo general suave anti-reflejos (`#f8fafc`).
   - Tarjetas en blanco puro (`#ffffff`) con bordes estructurados (`#e2e8f0`) y sombras suaves.
   - Textos principales oscuros de máximo contraste (`#0f172a`, `#1e293b`) y acentos corporativos del CIFP Avilés (`#1e40af`, `#2563eb`).
2. **Tipografía Extra Grande (Legibilidad Garantizada desde el Fondo del Aula)**:
   - Títulos de diapositiva: **`40px - 42px`** (peso 800).
   - Subtítulos explicativos: **`20px`**.
   - Títulos de tarjeta: **`23px - 25px`**.
   - Cuerpo de texto y viñetas: **`18.5px - 19.5px`** con interlineado holgado `1.6`.
   - Cajas didácticas (`concept-box`, `highlight-box`, `warning-box`, `analogia-box`, `error-comun-box`): **`18.5px - 19.5px`**.
   - Fórmulas y valores numéricos destacados: **`28px - 36px`** monoespaciados.
3. **Didáctica Rigurosa y Claridad Conceptual**:
   - **Regla de oro pedagógica**: Una sola idea central o máximo dos por diapositiva. Si el contenido es extenso, dividirlo en *Parte I* y *Parte II*.
   - **Lenguaje claro antes de la jerga**: Explicar la necesidad práctica antes de introducir los términos técnicos o protocolos.
   - **Analogías del mundo real**: Emplear cajas `.analogia-box` para fijar conceptos abstractos mediante metáforas cotidianas.
   - **Ejemplos prácticos y cálculos paso a paso**: Desglosar los problemas en pasos sistemáticos y advertir de errores habituales en `.warning-box` o `.error-comun-box`.
4. **Identidad Docente e Institucional**:
   - Logotipo oficial del CIFP Avilés incrustado en base64.
   - **Pie obligatorio**: `CIFP Avilés · Sergio Capdevila Díez` y contador `XX / YY`.
5. **Exportación a PDF Apaisado (A4 297x210 mm) y Cero Páginas en Blanco**:
   - En `@media print`, forzar `break-after: avoid !important` en `.slide:last-child` y ocultar completamente los controles flotantes (`display: none !important; height: 0 !important;`).
   - Ejecutar la compilación mediante:
     ```powershell
     powershell -ExecutionPolicy Bypass -File ".agents/skills/generar-presentaciones-ut/scripts/html-to-pdf.ps1" -HtmlPath "<Ruta-Al-Html>"
     ```
6. **Almacenamiento y Enlace**:
   - Guardar `.html` y `.pdf` en `01-Modulos/<Modulo>/07-Presentaciones/UTx/`.
   - Enlazar en el MOC del módulo (`01-Modulos/<Modulo>/MOC-...`), en la ficha de la unidad correspondiente (`01-Modulos/<Modulo>/01-Unidades/UD...`) y en `00-Mapa-de-Contenido-Principal.md`.

---

## 🎯 10. Regla Específica de Acceso a Datos: Vinculación Síncrona Teoría-Práctica (Cuaderno de Aula Acompañado)

> **REGLA OBLIGATORIA PARA EL MÓDULO ACCESO A DATOS (AD):**
> Cada vez que se elaboren, actualicen o compilen **apuntes y presentaciones** de una Unidad de Trabajo del módulo de Acceso a Datos, el agente **DEBE generar y mantener un Cuaderno de Actividades / Ejercicios de Aula Acompañado**:
>
> 📁 **`01-Modulos/Acceso-a-Datos/03-Ejercicios/UTx/AD-UTx-Cuaderno-Actividades-Aula.html` y `.pdf`**

### Requisitos estrictos de la vinculación síncrona:
1. **Correspondencia 1 a 1**: Por cada concepto o explicación impartida en los apuntes y en las diapositivas de la presentación, debe existir una **actividad práctica guiada paso a paso** en dicho cuaderno de aula para que el alumnado trabaje en su IDE al mismo tiempo que el profesor explica.
2. **Llamadas a la Acción en Apuntes**: Cada sección o subsección temática de los apuntes debe incorporar una caja de reto (`callout-activity`) con la llamada directa: *"💻 Trabajo Síncrono en Aula: Realiza la Actividad X.Y del Cuaderno de Actividades de Aula"*.
3. **Llamadas a la Acción en Diapositivas**: Cada diapositiva explicativa de la presentación debe incluir un distintivo o tarjeta de acción (*"💻 Práctica en Vivo en Aula: Actividad X.Y del Cuaderno de Aula"*) para coordinar la dinámica de clase interactiva.

