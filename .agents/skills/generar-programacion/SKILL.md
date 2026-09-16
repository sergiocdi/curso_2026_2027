---
name: generar-programacion
description: >-
  Genera programaciones didácticas oficiales y formales para Formación Profesional
  (CIFP Avilés / Principado de Asturias) con maquetación profesional en HTML institucional
  y exportación automática a PDF (A4) listo para entrega e inspección. Usar cada vez que el
  usuario solicite crear, compilar o generar la programación didáctica de un módulo.
---

# 📑 Skill: Generación de Programaciones Didácticas Oficiales (HTML -> PDF)

Esta skill define el procedimiento estandarizado para generar **programaciones didácticas oficiales** para el centro docente **CIFP Avilés (Principado de Asturias)**, garantizando el cumplimiento estricto del modelo institucional extraído del documento de referencia de jefatura de estudios y departamento (`IFC302_486_2024_AccesoDatos.docx`), con maquetación HTML de alta fidelidad y exportación directa a PDF (A4).

---

## 🏛️ 1. Identidad Visual y Estilo Institucional

1. **Paleta Cromática Corporativa**:
   - **Azul Institucional Primario**: `#365F91` (Encabezados H1, H2, bordes de acento y cabeceras de tablas).
   - **Azul Marino Secundario**: `#243F60` (Encabezados H3, texto de énfasis y bordes estructurales).
   - **Azul Suave de Fondo / Sombreado**: `#DCE6F1` y `#F4F7FA` (Alternancia de filas en tablas y fondos de tarjetas de metadatos).
   - **Bordes Finos de Tabla**: `#B8CCE4` / `#D9D9D9`.

2. **Tipografía Oficial**:
   - **Títulos y Encabezados**: Familia `Cambria`, serif, formal y de corte institucional.
   - **Cuerpo de Texto y Tablas**: `Segoe UI`, `Calibri`, `Arial`, sans-serif, tamaño 9.5pt a 10pt con interlineado 1.45.

3. **Portada Oficial Obligatoria (Sin Páginas en Blanco)**:
   - **Membrete Superior**: Logotipo oficial del Gobierno del Principado de Asturias y Consejería de Educación (`resources/assets/logo-asturias.jpg`).
   - **Franja Lateral**: Rótulo vertical en mayúsculas `PROGRAMACIÓN DOCENTE` o `PROGRAMACIÓN DIDÁCTICA` en color azul institucional (`#5B9BD5` / `#365F91`).
   - **Bloque Central**: Logotipo circular del **CIFP Avilés** (`resources/assets/logo-cifp.png`) con el nombre del centro y "Principado de Asturias".
   - **Cuadro de Metadatos Enmarcado**: Recuadro con borde izquierdo destacado conteniendo Departamento, Ciclo Formativo, Modalidad (Presencial/Virtual), Módulo Formativo con código, Docente y Curso Académico.
   - **Pie Institucional**: Emblema de la Unión Europea / Fondo Social Europeo (`resources/assets/logo-fse-ue.png`) y mención a la Consejería de Educación.
   - **Regla Estricta**: La portada ocupa exactamente la primera página A4. Está prohibido que se genere una primera página en blanco previa o posterior a la portada.

4. **Marca de Agua en Páginas Interiores**:
   - Fondo tenue con el escudo del Principado de Asturias (`resources/assets/escudo-asturias-marca-agua.png`) al 3-4% de opacidad para no comprometer la legibilidad.

---

## 🎨 2. Principio Rector: Estilo Institucional vs. Contenido Docente (SSOT)

> **REGLA FUNDAMENTAL DE LA SKILL:**
> Esta skill está diseñada para **aplicar el estilo visual institucional, maquetación profesional y exportación a PDF (A4)**.
> **LA SKILL ES PARA EL ESTILO, NO PARA LOS CONTENIDOS:** No debe alterar, forzar ni inventar contenidos o secciones que no hayan sido definidas previamente por el docente en el módulo.

### Flexibilidad Estructural según el Módulo
1. **Fidelidad Absoluta al Contenido (SSOT)**:
   - Los contenidos y apartados deben extraerse fielmente de `01-Modulos/<Modulo>/00-Programacion/` y de su correspondiente compilador (`Compilador-Programacion-Didactica-...md`).
   - El agente no debe inventar apartados ni reestructurar arbitrariamente el contenido que el docente ha preparado.
2. **Diversidad de Modelos y Enfoques**:
   - Cada módulo curricular tiene su propia naturaleza pedagógica y operativa.
   - Habrá programaciones que mantengan los 12 apartados clásicos de jefatura de estudios (como *Acceso a Datos* o *Sostenibilidad*).
   - Habrá otras programaciones que no necesiten todos esos puntos y cuenten con una estructura propia adaptada a su realidad docente (como *Proyecto Intermodular*, enfocado en fases de desarrollo, metodologías predictivas y ágiles, entregables estrictos y rúbricas específicas).
3. **Rol de la Maquetación**:
   - La skill viste con diseño profesional institucional el contenido existente: genera la portada oficial, aplica la tipografía institucional `Cambria`, estiliza las tablas, recuadros informativos (*callouts*), marcas de agua y numeración de páginas sin tocar la esencia ni la estructura de los contenidos reales del profesor.

### Estructura de Referencia Orientativa (Modelo Centro - Opcional)
Como referencia informativa de los apartados tradicionales que suelen solicitarse en programaciones estándar de aula (`IFC302_486_2024_AccesoDatos.docx`), se puede consultar el siguiente esquema orientativo (aplicable solo cuando el módulo así lo requiera):
1. Identificación de la Programación
2. Concreción del Currículo. Aspectos destacables
3. Competencias Profesionales, Personales y Sociales & Objetivos Generales
4. Resultados de Aprendizaje y Criterios de Evaluación
5. Realizaciones Profesionales (si procede)
6. Unidades de Trabajo, Temporalización y Relación con RAs (si procede)
7. Contenidos y Saberes Básicos
8. Organización Académica y Procedimientos de Evaluación
9. Metodología Didáctica
10. Materiales y Recursos Didácticos
11. Atención a la Diversidad y Coeducación
12. Actividades Complementarias y Extraescolares

---

## 🛠️ 3. Procedimiento de Ejecución Paso a Paso

### Paso 1: Recopilación de Datos Curriculares (SSOT)
1. Leer los archivos de `01-Modulos/<Modulo>/00-Programacion/` y su compilador `Compilador-Programacion-Didactica-...md`.
2. Tomar como base la estructura exacta de apartados que ha definido el docente para ese módulo (ya sean 5, 6, 8 o 12 apartados), respetando su contenido y títulos.
3. Verificar horas anuales oficiales, ponderaciones y criterios definidos en el módulo.

### Paso 2: Generación del Documento HTML Institucional
1. Crear el archivo HTML en:
   `01-Modulos/<Modulo>/00-Programacion/Programacion-Didactica-<CODIGO>-<MODULO>.html`
2. Utilizar los estilos de [estilo-programacion.css](./resources/estilo-programacion.css) y la estructura de [plantilla-programacion.html](./resources/plantilla-programacion.html).
3. **Embeber las imágenes en Base64 o rutas relativas portables** para asegurar que el archivo HTML se renderice de manera autónoma en cualquier visor o navegador sin depender de un servidor web.

### Paso 3: Conversión Automatizada a PDF (A4)
Ejecutar el script de conversión headless mediante PowerShell:
```powershell
powershell -ExecutionPolicy Bypass -File ".agents/skills/generar-programacion/scripts/html-to-pdf.ps1" -HtmlPath "01-Modulos/<Modulo>/00-Programacion/Programacion-Didactica-<CODIGO>-<MODULO>.html"
```
El script utilizará el motor Chromium instalado (Microsoft Edge o Google Chrome) para generar un documento PDF de alta fidelidad gráfica sin marcas de agua ni cabeceras externas no deseadas.

### Paso 4: Verificación de Calidad
- Comprobar que el archivo `.pdf` resultante tiene un tamaño superior a 0 KB.
- Validar que la primera página sea la portada oficial completa y que la página 2 comience directamente con la sección 1 (sin saltos en blanco).
- Enlazar el documento en el MOC del módulo (`MOC-<Modulo>.md`), en el compilador (`Compilador-Programacion-Didactica-...`) y en `00-Mapa-de-Contenido-Principal.md`.
