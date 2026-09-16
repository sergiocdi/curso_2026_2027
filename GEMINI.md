# Antigravity & Gemini Agent Instructions (GEMINI.md)

Este repositorio se rige por las directrices unificadas definidas en `AGENTS.md`.

## Directrices Obligatorias:
1. **Contexto Inicial Obligatorio**:
   Al iniciar cualquier conversación o tarea, lee inmediatamente el archivo `00-Mapa-de-Contenido-Principal.md` para situarte en la estructura docente y la arquitectura SSOT del vault.

2. **Mantenimiento Continuo del MOC**:
   El archivo `00-Mapa-de-Contenido-Principal.md` debe mantenerse siempre actualizado ante cualquier cambio en módulos (`01-Modulos/`), grupos (`02-Grupos/`), unidades didácticas o documentos del centro.
   Actualiza la fecha `actualizado: YYYY-MM-DD` en el frontmatter YAML tras cualquier cambio.

3. **Arquitectura y Estilo**:
   Cumple estrictamente los principios SSOT y las convenciones de notas y enlaces wiki de Obsidian detalladas en `AGENTS.md`.

4. **Terminología en Base Modular (Conceptos vs Apuntes)**:
   En la base curricular se habla de **conceptos** (`02-Conceptos/`, `tipo: concepto`, prefijo `CON-`). Los **apuntes** son los documentos completos finales maquetados para el alumnado.

5. **Generación Obligatoria de Apuntes vía Skill y Prompt Maestro de FP**:
   Cada vez que se solicite generar apuntes, se debe utilizar obligatoriamente la skill `generar-apuntes` (`.agents/skills/generar-apuntes/SKILL.md`), cumpliendo estrictamente con el **Prompt Maestro de FP** (`references/prompt-maestro-apuntes-fp.md`).
   - **Enfoque Pedagógico**: Autosuficiencia del documento, progresión de lo intuitivo a lo formal y secuencia obligatoria: $\text{Comprensión} \longrightarrow \text{Ejemplos} \longrightarrow \text{Aplicación} \longrightarrow \text{Profundización}$.
   - **Estructura Didáctica en 11 Bloques**: 1. Introducción profesional, 2. Conceptos fundamentales, 3. Desarrollo progresivo y exhaustivo (*Concepto → Explicación Detallada → Ejemplo Documentado → Aplicación Práctica*, prohibido ser escueto o saltar a resúmenes/comparativas sin explicar cada librería a fondo con sus métodos e instrucciones principales y ejemplos paso a paso), 4. Ejemplos prácticos graduados, 5. Ejemplos de código funcional y documentado, 6. Errores habituales explicados con soluciones y causas profundas, 7. Buenas prácticas por niveles, 8. Tablas comparativas, 9. Resumen clave, 10. Conceptos que debes dominar, 11. Glosario y 8-15 preguntas de repaso sin respuesta inmediata.
   - **Regla de Portada y Cero Páginas en Blanco**: Portada institucional completa y prohibición estricta de páginas en blanco en los PDFs (A4). Conversión con `scripts/html-to-pdf.ps1`. Almacenar en `01-Modulos/<Modulo>/06-Apuntes/UTx/`.

6. **Generación Obligatoria de Programaciones Didácticas vía Skill**:
   Cada vez que se solicite generar, compilar o maquetar una **programación didáctica oficial**, se debe utilizar obligatoriamente la skill **`generar-programacion`** (`.agents/skills/generar-programacion/SKILL.md`). La skill aplica el **estilo institucional oficial del CIFP Avilés** (portada formal, tipografía `Cambria`, paleta azul, tablas, cero páginas en blanco y exportación a PDF A4 con `scripts/html-to-pdf.ps1`), **respetando estrictamente los contenidos y la estructura de apartados definida por el docente en el módulo**, sin imponer ni forzar contenidos o secciones predefinidas.

7. **Generación Obligatoria de Presentaciones Iniciales de Módulo vía Skill**:
   Cada vez que se solicite generar presentaciones para el **primer día de clase o introducción general de un módulo formativo**, se debe utilizar obligatoriamente la skill **`generar-presentaciones`** (`.agents/skills/generar-presentaciones/SKILL.md`) con tema oscuro de alto impacto (*Dark Tech*).

8. **Generación Obligatoria de Prácticas Técnicas y Rúbricas vía Skill**:
   Cada vez que se solicite generar prácticas de aula, proyectos guiados o pruebas diagnósticas, se debe utilizar obligatoriamente la skill **`generar-practicas`** (`.agents/skills/generar-practicas/SKILL.md`). Los documentos deben incorporar cabecera institucional del CIFP Avilés, badges con RAs y Criterios de Evaluación asociados, enunciados y código paso a paso, entorno (Eclipse IDE / Maven), regulación de IA y una **rúbrica analítica completa sobre 10 puntos** con niveles de desempeño (Excelente, Notable, Aprobado, Insuficiente), maquetados en HTML y exportados a PDF (A4 vertical) con `scripts/html-to-pdf.ps1`.

9. **Generación Obligatoria de Presentaciones Teóricas de Unidades de Trabajo (UTs) vía Skill**:
   Cada vez que se solicite generar presentaciones o diapositivas para impartir los **contenidos teóricos de una Unidad de Trabajo (UT / UD)**, se debe utilizar obligatoriamente la skill **`generar-presentaciones-ut`** (`.agents/skills/generar-presentaciones-ut/SKILL.md`). Las presentaciones teóricas deben emplear **tema claro institucional y luminoso** (`#f8fafc`, tarjetas blancas), **tipografía extra grande** (títulos a `40-42px`, cuerpo a `19.5px`), **didáctica clara paso a paso** (regla de una sola idea por diapositiva, analogías cotidianas, problemas resueltos y cajas de errores comunes), pie institucional `CIFP Avilés · Sergio Capdevila Díez`, controles táctiles y exportación automatizada a PDF apaisado A4 sin páginas en blanco (`break-after: avoid` en la última diapositiva).

10. **Vinculación Síncrona Teoría-Práctica en Acceso a Datos (Cuaderno de Aula Acompañado)**:
    En el módulo de *Acceso a Datos*, cada vez que se elaboren apuntes y presentaciones de una Unidad de Trabajo, es obligatorio generar un **Cuaderno de Actividades de Aula** (`03-Ejercicios/UTx/AD-UTx-Cuaderno-Actividades-Aula.html` y `.pdf`). Cada apartado de los apuntes y cada diapositiva de la presentación debe incluir una llamada explícita y directa a la actividad práctica guiada que el alumnado debe realizar en su IDE simultáneamente con la explicación.

