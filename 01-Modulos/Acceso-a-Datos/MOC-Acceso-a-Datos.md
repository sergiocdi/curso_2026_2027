---
tipo: moc_modulo
modulo: "Acceso a Datos"
ciclo: "DAM"
curso: 2
codigo_oficial: "0486"
horas_anuales: 140
horas_semanales: 4
---

# 💾 MOC: Acceso a Datos (DAM2) - Fuente Única (SSOT)

> **Este módulo es la fuente central de verdad**. Aquí se define y actualiza el currículo, las unidades didácticas, los conceptos, los ejercicios y el banco de preguntas.
> Tanto el grupo **DAM2 Presencial** como **DAM2 Virtual** beben directamente de este directorio.

---

## 📑 1. Programaciones Didácticas Oficiales (Presencial y A Distancia)

### 🏫 A. Modalidad Presencial (5 horas semanales: Lunes 3h y Miércoles 2h · Aula C210)
- 📖 **Compilador Markdown**: [[Compilador-Programacion-Didactica-AD-Presencial|📄 Programación Completa Presencial]]
- 📑 **Documentos Oficiales Maquetados (CIFP Avilés)**:
  - [🌐 Versión Web Institucional (HTML)](file:///c:/Users/capsx/Documents/trabajo/proyectos%20IA/profe-sergio/01-Modulos/Acceso-a-Datos/00-Programacion/Presencial/Programacion-Didactica-0486-AD-Presencial.html)
  - [📄 Documento Oficial de Entrega / Inspección (PDF A4)](file:///c:/Users/capsx/Documents/trabajo/proyectos%20IA/profe-sergio/01-Modulos/Acceso-a-Datos/00-Programacion/Presencial/Programacion-Didactica-0486-AD-Presencial.pdf)
- 🗂️ **Apartados Atómicos**: `00-Programacion/Presencial/` (01 a 10)

### 💻 B. Modalidad A Distancia / Virtual (2 horas de clase virtual los lunes + Campus Moodle)
- 📖 **Compilador Markdown**: [[Compilador-Programacion-Didactica-AD-Distancia|📄 Programación Completa A Distancia]]
- 📑 **Documentos Oficiales Maquetados (CIFP Avilés)**:
  - [🌐 Versión Web Institucional (HTML)](file:///c:/Users/capsx/Documents/trabajo/proyectos%20IA/profe-sergio/01-Modulos/Acceso-a-Datos/00-Programacion/Distancia/Programacion-Didactica-0486-AD-Distancia.html)
  - [📄 Documento Oficial de Entrega / Inspección (PDF A4)](file:///c:/Users/capsx/Documents/trabajo/proyectos%20IA/profe-sergio/01-Modulos/Acceso-a-Datos/00-Programacion/Distancia/Programacion-Didactica-0486-AD-Distancia.pdf)
- 🗂️ **Apartados Atómicos**: `00-Programacion/Distancia/` (01 a 10)

---

## 🎯 2. Resultados de Aprendizaje Oficiales (Currículo)
```dataview
TABLE codigo as "Código", peso_porcentaje + "%" as "Ponderación", descripcion as "Descripción"
FROM "01-Modulos/Acceso-a-Datos/00-Curriculo"
WHERE tipo = "ra"
SORT codigo ASC
```

---

## 📦 3. Unidades Didácticas
```dataview
TABLE numero_ud as "UD", horas_estimadas as "Horas", ra_asociados as "RAs", trimestre as "Trimestre"
FROM "01-Modulos/Acceso-a-Datos/01-Unidades"
WHERE tipo = "unidad_didactica"
SORT numero_ud ASC
```

---

## 🧠 4. Conceptos Clave
> Notas atómicas curriculares organizadas en subcarpetas por Unidad de Trabajo (`02-Conceptos/UT1/` a `UT6/`).

```dataview
TABLE ud as "Unidad", dificultad as "Dificultad", ra_asociados as "RAs"
FROM "01-Modulos/Acceso-a-Datos/02-Conceptos"
WHERE tipo = "concepto"
SORT ud ASC, file.name ASC
```

---

## 💻 5. Ejercicios y Prácticas de Aula
> Actividades y prácticas guiadas organizadas en subcarpetas por UT (`03-Ejercicios/UT1/` a `UT6/`).

```dataview
TABLE ud as "Unidad", tipo_actividad as "Tipo", dificultad as "Dificultad", tiempo_estimado_min + " min" as "Tiempo"
FROM "01-Modulos/Acceso-a-Datos/03-Ejercicios"
WHERE tipo = "ejercicio"
SORT ud ASC, file.name ASC
```

### 🚀 Cuaderno de Actividades de Aula Acompañado (Sincronizado con Teoría):
- 📓 **[[AD-UT1-Cuaderno-Actividades-Aula|Cuaderno de Actividades de Aula UT1 (12 Actividades Guiadas - Alumnado)]]**:
  - [🌐 Versión Web HTML](file:///c:/Users/capsx/Documents/trabajo/proyectos%20IA/profe-sergio/01-Modulos/Acceso-a-Datos/03-Ejercicios/UT1/AD-UT1-Cuaderno-Actividades-Aula.html) · [📄 PDF Imprimible (A4)](file:///c:/Users/capsx/Documents/trabajo/proyectos%20IA/profe-sergio/01-Modulos/Acceso-a-Datos/03-Ejercicios/UT1/AD-UT1-Cuaderno-Actividades-Aula.pdf)
- 🔒 **[[AD-UT1-Cuaderno-Actividades-Aula-Profesor|Guía Docente y Solucionario Explicado UT1 (Profesor)]]**:
  - [🌐 Versión Web HTML](file:///c:/Users/capsx/Documents/trabajo/proyectos%20IA/profe-sergio/01-Modulos/Acceso-a-Datos/03-Ejercicios/UT1/AD-UT1-Cuaderno-Actividades-Aula-Profesor.html) · [📄 PDF Imprimible (A4)](file:///c:/Users/capsx/Documents/trabajo/proyectos%20IA/profe-sergio/01-Modulos/Acceso-a-Datos/03-Ejercicios/UT1/AD-UT1-Cuaderno-Actividades-Aula-Profesor.pdf)

### 🚀 Práctica Diagnóstica Oficial (Evaluación Inicial):
- 📋 **[[PRAC-AD-Evaluacion-Inicial|Práctica de Evaluación Inicial: Diagnóstico en Java y Persistencia Básica]]**:
  - [🌐 Versión Web HTML](file:///c:/Users/capsx/Documents/trabajo/proyectos%20IA/profe-sergio/01-Modulos/Acceso-a-Datos/03-Ejercicios/Evaluacion-Inicial/PRAC-AD-Evaluacion-Inicial.html) · [📄 PDF Imprimible con Rúbrica (A4)](file:///c:/Users/capsx/Documents/trabajo/proyectos%20IA/profe-sergio/01-Modulos/Acceso-a-Datos/03-Ejercicios/Evaluacion-Inicial/PRAC-AD-Evaluacion-Inicial.pdf)

---

## ❓ 6. Banco de Preguntas de Test y Evaluación
> Preguntas de autoevaluación y examen organizadas en subcarpetas por UT (`04-Banco-Items/UT1/` a `UT6/`).

```dataview
TABLE ud as "Unidad", subtipo as "Tipo", ra_asociados as "RAs", dificultad as "Dificultad", correcta as "Resp. Correcta"
FROM "01-Modulos/Acceso-a-Datos/04-Banco-Items"
WHERE tipo = "item_evaluacion"
SORT ud ASC, file.name ASC
```

- 📋 **[[EV-INIC-AD-Programa-Diagnostico-Java|Prueba de Evaluación Inicial Diagnóstica (Gestor de Inventario en Java SE)]]**

---

## 📦 7. Recursos Pesados y Enlaces Externos
> Máquinas virtuales, volcados SQL y recursos organizados en subcarpetas por UT (`05-Recursos/UT1/` a `UT6/`).

```dataview
TABLE ud as "Unidad", formato as "Formato", tamano_aprox as "Tamaño", enlace_onedrive_drive as "Enlace Nube"
FROM "01-Modulos/Acceso-a-Datos/05-Recursos"
WHERE tipo = "recurso_externo"
SORT ud ASC
```

---

## 📑 8. Documentos de Apuntes Maquetados (HTML & PDF)
- 📄 **UT1 · Manual Técnico Completo y Unificado - Manejo de Ficheros (Texto, Binarios y XML)**:
  - [🌐 Versión Web HTML Exhaustiva](file:///c:/Users/capsx/Documents/trabajo/proyectos%20IA/profe-sergio/01-Modulos/Acceso-a-Datos/06-Apuntes/UT1/AD-UT1-Apuntes-Manejo-Ficheros.html) | [📄 Documento PDF Imprimible (A4 - 1.47 MB)](file:///c:/Users/capsx/Documents/trabajo/proyectos%20IA/profe-sergio/01-Modulos/Acceso-a-Datos/06-Apuntes/UT1/AD-UT1-Apuntes-Manejo-Ficheros.pdf)

---

## 🖥️ 9. Presentaciones y Diapositivas de Aula (16:9 HTML Interactivo & PDF)
> Diapositivas proyectables para explicaciones en clase y sesiones síncronas virtuales.

### 🚀 Presentaciones Iniciales del Módulo (Presencial y A Distancia)
- 🏫 **Modalidad Presencial (5 horas semanales: Lunes 3h y Miércoles 2h · Aula C210)**:
  - [🚀 Presentación Interactiva Web (HTML 16:9)](file:///c:/Users/capsx/Documents/trabajo/proyectos%20IA/profe-sergio/01-Modulos/Acceso-a-Datos/07-Presentaciones/Presentacion-Inicial/AD-Presencial-Presentacion-Inicial.html) · [📄 Versión PDF Apaisado](file:///c:/Users/capsx/Documents/trabajo/proyectos%20IA/profe-sergio/01-Modulos/Acceso-a-Datos/07-Presentaciones/Presentacion-Inicial/AD-Presencial-Presentacion-Inicial.pdf) · [[AD-Presencial-Presentacion-Inicial|📝 Guión Markdown]]
- 💻 **Modalidad A Distancia (2 horas de clase virtual síncrona los lunes + Campus Moodle)**:
  - [🚀 Presentación Interactiva Web (HTML 16:9)](file:///c:/Users/capsx/Documents/trabajo/proyectos%20IA/profe-sergio/01-Modulos/Acceso-a-Datos/07-Presentaciones/Presentacion-Inicial/AD-Distancia-Presentacion-Inicial.html) · [📄 Versión PDF Apaisado](file:///c:/Users/capsx/Documents/trabajo/proyectos%20IA/profe-sergio/01-Modulos/Acceso-a-Datos/07-Presentaciones/Presentacion-Inicial/AD-Distancia-Presentacion-Inicial.pdf) · [[AD-Distancia-Presentacion-Inicial|📝 Guión Markdown]]

### 📦 Unidades Temáticas (Contenidos Teóricos):
- 🖥️ **UT1 Oficial - Manejo de Ficheros (Tema Claro Institucional · 22 Diapositivas)**:
  - [🚀 Presentación Interactiva Web (HTML 16:9)](file:///c:/Users/capsx/Documents/trabajo/proyectos%20IA/profe-sergio/01-Modulos/Acceso-a-Datos/07-Presentaciones/UT1/AD-UT1-Pres-Teoria-Ficheros.html) | [📄 Versión Proyección / Impresión (PDF Apaisado A4 - 22 Páginas)](file:///c:/Users/capsx/Documents/trabajo/proyectos%20IA/profe-sergio/01-Modulos/Acceso-a-Datos/07-Presentaciones/UT1/AD-UT1-Pres-Teoria-Ficheros.pdf)

---

## 👥 10. Grupos que Cursan este Módulo
- 🏫 [[Dashboard-Grupo-DAM2-Presencial|DAM2 Presencial (Aula C210 - Turno de Tarde)]]
- 💻 [[Dashboard-Grupo-DAM2-Virtual|DAM2 Virtual (Aula C212 + Moodle)]]

