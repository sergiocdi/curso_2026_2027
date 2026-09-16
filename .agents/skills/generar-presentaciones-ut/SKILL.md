---
name: generar-presentaciones-ut
description: >-
  Genera presentaciones y diapositivas didácticas para los contenidos teóricos
  de las Unidades de Trabajo (UTs / UDs) en Formación Profesional. Utiliza una
  paleta institucional luminosa en tema claro (#f8fafc), tipografía extra grande
  para máxima visibilidad desde el fondo del aula de informática, y un enfoque
  pedagógico de alta claridad conceptual con analogías, ejemplos paso a paso y
  cero páginas en blanco en exportación a PDF apaisado (A4).
---

# 🖥️ Skill: Generación de Presentaciones Didácticas de Unidades de Trabajo (Tema Claro)

Esta skill es la **herramienta oficial y especializada** para generar presentaciones interactivas de **contenidos teóricos de Unidades de Trabajo (UTs / UDs)** para proyectar en aula y pizarra digital interactiva (PDI).

> [!IMPORTANT]
> **Delimitación de Roles respecto a `generar-presentaciones`:**
> - `generar-presentaciones`: Reservada exclusivamente para las **presentaciones de inicio de curso e introducción general de módulos** (guía docente, evaluación, calendario con tema oscuro *tech*).
> - **`generar-presentaciones-ut`**: Obligatoria para **todas las presentaciones de contenidos teóricos de las unidades didácticas (UT1, UT2, etc.)**.

---

## 🎨 1. Estándar Visual Institucional en Tema Claro (Luminoso y Nítido)

Para sesiones teóricas diurnas en aulas de ordenadores, el tema claro optimiza la agudeza visual y evita el deslumbramiento:

1. **Paleta de Colores**:
   - **Fondo General**: `#f8fafc` (slate-50, blanco suave que previene fatiga visual).
   - **Superficie de Tarjetas**: `#ffffff` en blanco puro con borde nítido `#e2e8f0` y sombra sutil.
   - **Texto Principal**: `#0f172a` (slate-900) para un contraste tipográfico máximo.
   - **Texto Secundario**: `#334155` (slate-700).
   - **Acentos Institucionales**: Azul corporativo CIFP Avilés (`#1e40af`, `#2563eb`), cian técnico (`#0284c7`), verde resultados (`#16a34a`), ámbar avisos (`#d97706`).
2. **Cajas Didácticas Especializadas (Callouts)**:
   - `concept-box`: Fondo `#eff6ff`, borde izquierdo `5px solid #2563eb`, texto `#1e3a8a`.
   - `highlight-box`: Fondo `#f0fdf4`, borde izquierdo `5px solid #16a34a`, texto `#14532d`.
   - `warning-box`: Fondo `#fffbeb`, borde izquierdo `5px solid #d97706`, texto `#78350f`.
   - `analogia-box`: Fondo `#faf5ff`, borde izquierdo `5px solid #9333ea`, texto `#581c87`.
   - `error-comun-box`: Fondo `#fef2f2`, borde izquierdo `5px solid #dc2626`, texto `#991b1b`.

---

## 📏 2. Tipografía Extra Grande (Visibilidad Garantizada)

Las fuentes deben garantizar que cualquier estudiante situado en la última fila del aula de informática pueda leer perfectamente sin forzar la vista:

### Visualización en Pantalla Panorámica (16:9 / PDI):
- **Títulos de Diapositiva (`.slide-title`)**: **`40px - 42px`** con peso visual `800`.
- **Subtítulos Explicativos (`.slide-subtitle`)**: **`20px`**.
- **Títulos de Tarjeta (`.card-title`)**: **`23px - 25px`**.
- **Cuerpo de Texto y Viñetas (`.card-desc`, `ul.bullet-list li`)**: **`18.5px - 19.5px`** con interlineado `1.6`.
- **Cajas Didácticas**: **`18.5px - 19.5px`** con acolchado de `16px 24px`.
- **Fórmulas y Valores Numéricos Clave**: **`28px - 36px`** con tipografía monoespaciada de alto impacto.
- **Pie de Diapositiva**: **`14.5px`**.

### Modo Impresión y Exportación a PDF (A4 Apaisado 297x210 mm):
- **Títulos de Diapositiva**: **`24px - 25px`**.
- **Títulos de Tarjetas**: **`17.5px - 18px`**.
- **Cuerpo de Texto**: **`14.5px`** con interlineado proporcional.
- **Pie de Diapositiva**: **`12px`**, perfectamente visible y anclado.

---

## 🧠 3. Principios Pedagógicos Obligatorios (Claridad de Conceptos)

Cada diapositiva teórica debe diseñarse pensando en la asimilación del alumnado de FP:

1. **Regla de Una Sola Idea Central por Diapositiva**:
   - Nunca saturar una diapositiva con múltiples temas heterogéneos.
   - Si un concepto es complejo (ej. sistemas de numeración o conmutación), dividirlo en *Parte I* y *Parte II*.
2. **Definiciones en Lenguaje Llano antes del Tecnicismo**:
   - Explicar qué problema real resuelve el concepto antes de detallar el protocolo o el estándar.
3. **Uso Obligatorio de Analogías Cotidianas**:
   - Utilizar la caja `.analogia-box` para conectar el concepto abstracto con una metáfora del mundo real (ej. la autopista y los carriles para explicar ancho de banda; la carta postal para explicar tramas con cabeceras).
4. **Ejemplos Numéricos Resueltos Paso a Paso**:
   - Desglosar cada cálculo matemático en 3 pasos claros (conversión de unidades, operación en segundos y conversión final a minutos).
5. **Caja de Errores Comunes de Alumnado**:
   - Utilizar `.warning-box` o `.error-comun-box` para advertir explícitamente sobre los errores habituales en exámenes y prácticas de taller (ej. confundir bits y Bytes, olvidar multiplicar por 8, etc.).

---

## 🏛️ 4. Estándar Institucional y Autoría

Todas las presentaciones deben incluir:
- **Cabecera**: Membrete del CIFP Avilés, título temático, subtítulo y logotipo incrustado en base64.
- **Metadatos de Portada**: Módulo curricular, código, ciclo formativo (1º SMR, DAM, DAW), Resultados de Aprendizaje (RAs) y Criterios de Evaluación (CEs).
- **Pie Obligatorio en Todas las Diapositivas**:
  - Izquierda: Módulo y Unidad de Trabajo.
  - Centro: **`CIFP Avilés · Sergio Capdevila Díez`**.
  - Derecha: Contador de diapositivas monoespaciado (`XX / YY`).

---

## 🖨️ 5. Exportación Automatizada a PDF (A4 Apaisado)

1. En `@media print`, forzar obligatoriamente en la última diapositiva:
   ```css
   .slide:last-child, .slide:last-of-type {
     page-break-after: avoid !important;
     break-after: avoid !important;
   }
   ```
2. Ocultar todos los controles flotantes (`#nav-controls`, `.keyboard-hint`, `#progress-bar`) con `display: none !important; height: 0 !important;`.
3. Ejecutar la compilación mediante PowerShell:
   ```powershell
   powershell -ExecutionPolicy Bypass -File ".agents/skills/generar-presentaciones-ut/scripts/html-to-pdf.ps1" -HtmlPath "<Ruta-Al-Html>"
   ```
4. Ubicación de archivos:
   - HTML: `01-Modulos/<Modulo>/07-Presentaciones/UTx/<CODIGO>-UTx.y-Presentacion-<Tema>.html`
   - PDF: `01-Modulos/<Modulo>/07-Presentaciones/UTx/<CODIGO>-UTx.y-Presentacion-<Tema>.pdf`
