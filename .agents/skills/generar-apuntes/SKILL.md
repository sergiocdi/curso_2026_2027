---
name: generar-apuntes
description: >-
  Genera documentos de apuntes técnicos y didácticos para Formación Profesional
  con maquetación profesional en HTML y exportación automática a PDF (A4). Usar
  cada vez que el usuario solicite crear, compilar o generar apuntes de un tema,
  módulo o unidad didáctica.
---

# 📚 Skill: Generación y Compilación de Apuntes Docentes (HTML -> PDF)

Esta skill define el procedimiento estandarizado para generar apuntes docentes de alta calidad técnica y pedagógica para Formación Profesional (FP), asegurando una presentación homogénea, estructura didáctica clara y conversión directa a PDF listo para entregar al alumnado o imprimir.

---

## 🎯 Marco Pedagógico Obligatorio: Prompt Maestro de Apuntes para FP

> **Referencia completa**: [prompt-maestro-apuntes-fp.md](./references/prompt-maestro-apuntes-fp.md)
>
> Actúa como **profesor especialista de Formación Profesional**, con experiencia docente y en la elaboración de materiales didácticos técnicos. Los apuntes deben ser **autosuficientes**: el alumno debe poder estudiar la unidad principalmente con estos apuntes sin necesidad de buscar constantemente información externa.

### 1. Regla Fundamental de Aprendizaje
Priorizar siempre la secuencia:
$$\mathbf{COMPRENSIÓN \longrightarrow EJEMPLOS \longrightarrow APLICACIÓN \longrightarrow PROFUNDIZACIÓN}$$
sobre la mera definición o memorización formal. El objetivo es pasar de *"No sé qué es esto"* a *"Entiendo qué es, sé para qué sirve, sé cómo funciona, sé utilizarlo y sé reconocer cuándo debo utilizarlo"*.

### 2. Estructura Didáctica Obligatoria (11 Bloques):
1. **Introducción**: Qué vamos a aprender, por qué es importante, para qué sirve en el mundo profesional y conocimientos previos útiles.
2. **Conceptos Fundamentales**: Definición intuitiva antes de la formal, para qué sirve, ejemplo y comparación.
3. **Desarrollo Progresivo de Contenidos**: Estructura *Concepto → Explicación → Ejemplo → Aplicación Práctica*, sin dar por conocidos conceptos que el nivel no garantice.
4. **Ejemplos Prácticos Progresivos**: Ejemplo básico → Intermedio → Completo/profesional.
5. **Ejemplos de Código (en materias técnicas)**: Código funcional y probado, explicado paso a paso, mostrando solución básica y solución profesional óptima.
6. **Errores Habituales & Soluciones**: Explicar los fallos típicos, por qué ocurren, cómo detectarlos y cómo evitarlos con buenas prácticas.
7. **Buenas Prácticas Profesionales**: Distinguir entre lo obligatorio, lo recomendable y el estándar de la industria.
8. **Tablas Comparativas**: Cuando existan conceptos o tecnologías fácilmente confundibles.
9. **Resumen de la Unidad**: Ideas clave para repaso rápido antes de examen o entrega.
10. **Conceptos que Debes Dominar**: Lista de competencias comprobables (*"Comprender qué es...", "Saber utilizar...", "Ser capaz de..."*).
11. **Glosario y Preguntas de Repaso**:
    - Pequeño glosario de términos técnicos.
    - **8 a 15 Preguntas de Repaso** (conceptuales, de comparación, de aplicación y casos prácticos) sin respuesta inmediata.

### 3. Cajas Pedagógicas (Callouts en HTML):
- `💡 IDEA CLAVE` (`callout-info`): Explicación breve del concepto nuclear.
- `⚠️ IMPORTANTE` (`callout-warning`): Aspecto crítico que el alumno debe retener.
- `❌ ERROR HABITUAL` (`callout-danger` / `callout-warning`): Error frecuente y cómo solucionarlo.
- `💻 EJEMPLO / EN LA PRÁCTICA` (`callout-activity` / `callout-work`): Código o aplicación real en entorno laboral.
- `🎯 RETO EN VIVO / AULA`: Actividad acompañada de clase o práctica en IDE.

---

## 🛠️ Procedimiento de Ejecución Paso a Paso

### Paso 1: Obtener el contexto curricular y los conceptos
1. Consultar el MOC del módulo (`01-Modulos/<Modulo>/MOC-...`).
2. Consultar la Unidad Didáctica (`01-Modulos/<Modulo>/01-Unidades/UD...`).
3. Extraer las notas atómicas de conceptos disponibles en `01-Modulos/<Modulo>/02-Conceptos/` para integrarlas en una explicación continua y fluida.

### Paso 2: Generar el documento HTML
1. Crear el archivo HTML en la carpeta designada:
   `01-Modulos/<Modulo>/06-Apuntes/<CODIGO>-<UD>-<Titulo-Tema>.html`
2. El documento debe incluir el CSS de [estilo-apuntes.css](./resources/estilo-apuntes.css) (se recomienda embeberlo dentro de una etiqueta `<style>` para que el archivo HTML sea 100% autónomo y portable sin dependencias de rutas relativas).
3. Seguir la estructura definida en [plantilla-base.html](./resources/plantilla-base.html).

### Paso 3: Convertir el HTML a PDF
Ejecutar el script automatizado mediante PowerShell:
```powershell
powershell -ExecutionPolicy Bypass -File ".agents/skills/generar-apuntes/scripts/html-to-pdf.ps1" -HtmlPath "01-Modulos/<Modulo>/06-Apuntes/<Archivo>.html"
```
El script detecta automáticamente el motor Chromium del sistema (Microsoft Edge o Google Chrome) y genera el archivo `.pdf` en la misma carpeta sin encabezados ni pies de página del navegador.

### Paso 4: Verificación
- Comprobar que el archivo `.pdf` se ha creado y tiene un tamaño superior a 0 KB.
- Enlazar tanto el archivo `.html` como el `.pdf` en el MOC del módulo o en la unidad didáctica correspondiente.
