---
name: generar-practicas
description: >-
  Genera documentos formales de prácticas técnicas, retos y proyectos de aula
  para Formación Profesional con maquetación profesional en HTML y exportación
  automática a PDF (A4). Cada práctica incluye cabecera institucional,
  Resultados de Aprendizaje (RA) y Criterios de Evaluación (CE) asociados,
  enunciado técnico detallado, pautas de entorno de trabajo (Eclipse/Maven),
  política de IA y una rúbrica analítica completa de evaluación sobre 10 puntos.
---

# 🛠️ Skill: Generación y Maquetación de Prácticas Técnicas (HTML -> PDF)

Esta skill define el estándar obligatorio y procedimiento sistematizado para diseñar, redactar y maquetar **enunciados de prácticas técnicas**, proyectos guiados y actividades formativas o evaluables para los ciclos de Formación Profesional en el **CIFP Avilés**.

---

## 📌 1. Componentes Obligatorios de Toda Práctica

Cada documento de práctica debe incorporar rigurosamente los siguientes cinco bloques estructurales:

1. **Cabecera Institucional y Cuadro Técnico**:
   - Membrete oficial del **CIFP Avilés** (Departamento de Informática y Comunicaciones).
   - Título descriptivo y subtítulo que clarifique el reto técnico.
   - Metadatos esenciales: Módulo profesional (nombre y código), Ciclo formativo (DAM/DAW/SMR), Curso, Modalidad (Presencial / A Distancia), Tiempo estimado y Carácter (Formativa / Diagnóstica / Sumativa).
2. **Alineación Curricular Explícita (RAs y CEs)**:
   - Identificación visible de los **Resultados de Aprendizaje (RA)** y **Criterios de Evaluación (CE)** trabajados, presentados mediante badges visuales contrastados (`.badge-ra`, `.badge-ce`).
   - Breve descripción del impacto competencial de la práctica.
3. **Enunciado Técnico y Requerimientos Funcionales**:
   - Contextualización en un **caso de uso del mundo real** o empresarial (no ejercicios abstractos).
   - Requerimientos numerados paso a paso con detalle de entradas, procesos y salidas.
   - Fragmentos de código base, esquemas de datos (CSV, JSON, XML, BSON o SQL) y estructuras de paquetes recomendadas.
4. **Entorno de Desarrollo y Política de Inteligencia Artificial (IA)**:
   - **IDE de Referencia**: Indicar **Eclipse IDE** como entorno principal de aula, mencionando la posibilidad optativa de emplear otros entornos (IntelliJ IDEA, VS Code) bajo compatibilidad Maven.
   - **Regulación de IA**: Reflejar explícitamente las normas docentes:
     - *En la 1ª Evaluación*: Se permite solo como estudio/consulta; **no se recomienda usarla en ejercicios y prácticas formativas** para consolidar la lógica autónoma del estudiante; **prohibida en exámenes**.
     - *En el Proyecto Intermodular (2ª Evaluación)*: Permitida, pero con **defensa técnica individual obligatoria** donde el docente exigirá explicaciones exhaustivas del código.
     - *En Evaluaciones Iniciales*: Prohibida para garantizar un diagnóstico auténtico de competencias previas.
5. **Rúbrica Analítica de Evaluación (Total 10.0 Puntos)**:
   - Tabla formal con filas por cada indicador/criterio evaluado y su ponderación.
   - Columnas para 4 niveles de desempeño: **Excelente (100%)**, **Notable (75%)**, **Aprobado (50%)** e **Insuficiente (<50%)**.
   - Fila de cierre con la puntuación total máxima (10.0 puntos).
6. **Instrucciones Claras de Entrega**:
   - Formato de entrega (repositorio GitHub / GitHub Classroom o archivo comprimido `.zip`).
   - Estructura esperada de carpetas, código limpio, documentación o memoria explicativa.

---

## 🎨 2. Estándar Visual y Maquetación Web/Impresión

- **Estilos Semánticos**: Emplear los estilos definidos en `.agents/skills/generar-practicas/resources/estilo-practicas.css` (o embeberlos directamente en el HTML para portabilidad total).
- **Tipografía y Legibilidad**: Fuentes sans-serif limpias (`Inter`, `system-ui`) para el cuerpo y fuentes monoespaciadas (`JetBrains Mono`, `Consolas`) para fragmentos de código.
- **Cero Páginas en Blanco**: El CSS de impresión (`@media print`) debe configurar márgenes A4 adecuados (`16mm 14mm`), evitando saltos forzados indebidos que generen páginas vacías al principio o final del PDF.

---

## ⚙️ 3. Procedimiento de Ejecución Paso a Paso

### Paso 1: Contexto y Extracción Curricular
1. Consultar el MOC del módulo (`01-Modulos/<Modulo>/MOC-...`).
2. Identificar la Unidad Didáctica y los RAs/CEs a trabajar.
3. Redactar el contenido pedagógico y la rúbrica asociada.

### Paso 2: Generar el Documento HTML
1. Ubicar el archivo HTML en la carpeta correspondiente del módulo:
   - Para ejercicios o prácticas de una UT: `01-Modulos/<Modulo>/03-Ejercicios/UTx/<Nombre-Practica>.html`
   - Para la evaluación inicial: `01-Modulos/<Modulo>/03-Ejercicios/Evaluacion-Inicial/<Nombre-Practica>.html`
2. Embeber o enlazar `estilo-practicas.css`.

### Paso 3: Conversión Automatizada a PDF (A4)
Ejecutar el script de conversión:
```powershell
powershell -ExecutionPolicy Bypass -File ".agents/skills/generar-practicas/scripts/html-to-pdf.ps1" -HtmlPath "<Ruta-Al-Html>"
```

### Paso 4: Registro y Enlace
1. Comprobar que el PDF se genera con tamaño $> 0$ KB y maquetación correcta.
2. Enlazar la práctica tanto en su formato `.html` como `.pdf` en el MOC del módulo y en el panel docente principal `00-Mapa-de-Contenido-Principal.md`.
