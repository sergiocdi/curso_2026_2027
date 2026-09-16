---
name: generar-presentaciones
description: >-
  Genera presentaciones interactivas de aula en HTML/CSS (16:9 panorámico) y
  exportación automática a PDF apaisado (A4) exclusivamente para el inicio de
  curso y la introducción general de módulos formativos de FP, con estándar visual
  del CIFP Avilés (tema oscuro tecnológico), portada institucional, logotipo y pie
  con autoría de Sergio Capdevila Díez.
---

# 🖥️ Skill: Generación de Presentaciones Iniciales de Módulo (Tema Oscuro)

Esta skill estandariza la creación de las **presentaciones de primer día de clase e introducciones generales de módulo** (guía docente, temporalización general, sistema de evaluación y normas de aula) con estética tecnológica de alto impacto visual (*Dark Tech*).

> [!IMPORTANT]
> **Delimitación de Roles:**
> - **`generar-presentaciones`**: Uso exclusivo para la **presentación inicial y global del módulo formativo**.
> - **`generar-presentaciones-ut`**: Para **todas las presentaciones de contenidos teóricos de las Unidades de Trabajo (UTs)**, debe utilizarse obligatoriamente la nueva skill con tema claro y tipografía extra grande.

---

## 🏛️ Estándar Visual Institucional (CIFP Avilés)

Todas las presentaciones generadas bajo esta skill deben cumplir rigurosamente con los siguientes requisitos:

### 1. Portada Institucional Obligatoria (Slide 1):
* **Identificación del Centro**: Membrete superior con *CIFP Avilés · Centro Integrado de Formación Profesional* y *Principado de Asturias*.
* **Logotipo del CIFP Avilés**: Incorporado de forma limpia mediante data URI base64 (`data:image/png;base64,...`) para garantizar la total portabilidad del archivo sin rutas rotas.
* **Título del Tema**: Tipografía con alto contraste, gran tamaño y jerarquía clara.
* **Subtítulo Descriptivo**: Breve resumen de lo que se abordará en la sesión.
* **Cuadro Técnico de Metadatos**:
  * **Módulo Curricular**: Nombre oficial y código.
  * **Ciclo Formativo**: Curso (1º o 2º), ciclo (SMR, DAM, DAW) y modalidad.
  * **Resultados de Aprendizaje (RAs)**: Enumeración de los RAs y criterios trabajados.
  * **Docente**: **Sergio Capdevila Díez**.

### 2. Estructura de las Diapositivas de Contenido (Slides 2 a N):
* **Cabecera**:
  * *Badge*: Unidad (ej. `UT1: Caracterización`) y Módulo.
  * *Título de diapositiva* claro y subtítulo explicativo.
  * *Logo sutil del CIFP Avilés* en la esquina superior derecha.
* **Cuerpo Didáctico**:
  * Rejillas de 2 o 3 columnas (`grid-2`, `grid-3`) para comparar conceptos.
  * Tarjetas con bordes sutiles (`card`) para agrupar ideas.
  * Cajas didácticas destacadas (`highlight-box`, `concept-box`, `warning-box`).
  * Listas de viñetas con glifos limpios (`bullet-list`).
  * Tablas estilizadas (`slide-table`) y bloques de código de alto contraste (`code-block`).
* **Pie de Diapositiva Obligatorio**:
  * **Izquierda**: Módulo y Unidad de Trabajo.
  * **Centro**: **CIFP Avilés · Sergio Capdevila Díez**.
  * **Derecha**: Contador de diapositiva en formato monoespaciado (`XX / YY`).

### 3. Navegación Interactiva (Proyector & PDI):
* **Teclado**: Flechas $\leftarrow$ / $\rightarrow$, Barra Espaciadora, `RePág` / `AvPág`, `Inicio` / `Fin`.
* **Pantalla Completa**: Tecla `F` o botón táctil flotante `⛶ Pantalla Completa`.
* **Pizarra Digital (PDI)**: Botones táctiles inferiores y detección de gestos táctiles *swipe* izquierda/derecha.
* **Barra de Progreso**: Indicador dinámico superior que muestra el avance en tiempo real.

### 4. Cero Páginas en Blanco o con Controles al Final (PDF A4 Landscape):
* La maquetación `@media print` adapta automáticamente las diapositivas al tamaño `297mm x 210mm` (A4 apaisado).
* **Prohibida la página extra o en blanco al final**:
  * En la última diapositiva (`.slide:last-child`, `.slide:last-of-type`), se debe definir obligatoriamente `page-break-after: avoid !important; break-after: avoid !important;`.
  * Todos los contenedores de controles de navegación (`#controls`, `#nav-controls`, `.controls-overlay`, `.controls`, `nav`, `.nav-btn`, `.control-btn`, `.btn-nav`, `.keyboard-hint`) deben tener `display: none !important; visibility: hidden !important; height: 0 !important; margin: 0 !important; padding: 0 !important;` en `@media print` para evitar que se impriman en una página adicional como caracteres o botones sueltos (`‹ › ⛶ 🖨️`).
* Queda estrictamente prohibida la generación de páginas en blanco intermedias, al inicio o al final del documento.

---

## 🛠️ Procedimiento de Generación

### Paso 1: Extracción Curricular y Contenidos
1. Obtener los conceptos atómicos desde `01-Modulos/<Modulo>/02-Conceptos/UTx/`.
2. Estructurar la sesión en bloques de 8 a 14 diapositivas para clases de 50-60 minutos.

### Paso 2: Generación del Archivo HTML
1. Crear el archivo HTML en la subcarpeta correspondiente:
   `01-Modulos/<Modulo>/07-Presentaciones/UTx/<CODIGO>-UTx-Presentacion-<Tema>.html`
2. Embeber los estilos de [estilo-presentaciones.css](./resources/estilo-presentaciones.css) e incrustar el logo en base64 desde [assets_base64.json](./resources/assets/assets_base64.json) para que sea un archivo único, independiente y portable.

### Paso 3: Conversión Automatizada a PDF
Ejecutar el script automatizado mediante PowerShell:
```powershell
powershell -ExecutionPolicy Bypass -File ".agents/skills/generar-presentaciones/scripts/html-to-pdf.ps1" -HtmlPath "01-Modulos/<Modulo>/07-Presentaciones/UTx/<Archivo>.html"
```

### Paso 4: Enlace y Actualización del Vault
1. Enlazar la presentación (HTML y PDF) en el MOC del módulo (`01-Modulos/<Modulo>/MOC-...`).
2. Enlazar en la ficha de la unidad correspondiente (`01-Modulos/<Modulo>/01-Unidades/UD...`).