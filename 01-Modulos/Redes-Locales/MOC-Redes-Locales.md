---
tipo: moc_modulo
modulo: "Redes Locales"
ciclo: "SMR"
curso: 1
codigo_oficial: "0225"
horas_anuales: 200
horas_semanales: 6
actualizado: 2026-09-15
---

# 🔌 MOC: Redes Locales (SMR) - Fuente Única (SSOT)

> **Módulo de Grado Medio (Sistemas Microinformáticos y Redes)**.
> Centraliza todo el currículo oficial, unidades didácticas, conceptos, prácticas de taller, simulaciones en Packet Tracer, banco de preguntas y apuntes maquetados.

---

## 📑 1. Programación Didáctica (Apartados Individuales y Ensamblador)
- 🚀 **[[Compilador-Programacion-Didactica-RL|📄 Ver Programación Didáctica Completa Ensamblada]]**

### Apartados Individuales:
1. [[01-Identificacion-Modulo-RL|01. Identificación del Módulo y Datos Informativos]]
2. [[02-Contexto-SMR|02. Contexto del Centro y del Alumnado de Grado Medio]]
3. [[03-Resultados-Aprendizaje-RL|03. Resultados de Aprendizaje y Criterios de Evaluación]]
4. [[04-Contenidos-RL|04. Contenidos y Saberes Básicos]]
5. [[05-Unidades-Didacticas-RL|05. Unidades Didácticas y Temporalización]]
6. [[06-Metodologia-RL|06. Metodología de Taller y Práctica]]
7. [[07-Evaluacion-RL|07. Evaluación y Criterios de Calificación]]

---

## 🎯 2. Resultados de Aprendizaje Oficiales (Currículo)
```dataview
TABLE codigo as "Código", peso_porcentaje + "%" as "Peso", descripcion as "Descripción"
FROM "01-Modulos/Redes-Locales/00-Curriculo"
WHERE tipo = "ra"
SORT codigo ASC
```

---

## 📦 3. Unidades Didácticas
```dataview
TABLE numero_ud as "UD", horas_estimadas as "Horas", ra_asociados as "RAs", trimestre as "Trimestre"
FROM "01-Modulos/Redes-Locales/01-Unidades"
WHERE tipo = "unidad_didactica"
SORT numero_ud ASC
```

---

## 🧠 4. Conceptos Clave (SSOT Modular)
> Notas atómicas curriculares organizadas en subcarpetas por Unidad de Trabajo (`02-Conceptos/UT1/` a `UT8/`).

```dataview
TABLE ud as "Unidad", dificultad as "Dificultad", ra_asociados as "RAs"
FROM "01-Modulos/Redes-Locales/02-Conceptos"
WHERE tipo = "concepto"
SORT ud ASC, file.name ASC
```

---

## 💻 5. Ejercicios, Prácticas de Taller y Packet Tracer
> Actividades procedimentales organizadas en subcarpetas por UT (`03-Ejercicios/UT1/` a `UT8/`).

```dataview
TABLE ud as "Unidad", tipo_ejercicio as "Tipo", dificultad as "Dificultad", tiempo_estimado_min + " min" as "Tiempo"
FROM "01-Modulos/Redes-Locales/03-Ejercicios"
WHERE tipo = "ejercicio"
SORT ud ASC, file.name ASC
```

### 📘 Dossiers y Cuadernos de Actividades Maquetados (HTML & PDF):
- 📄 **UT1 - Cuaderno de Actividades y Prácticas (Caracterización de Redes)**:
  - [Versión Web Interactiva (HTML)](file:///c:/Users/capsx/Documents/trabajo/proyectos%20IA/profe-sergio/01-Modulos/Redes-Locales/03-Ejercicios/UT1/RL-UT1-Cuaderno-Actividades-y-Practicas.html) | [Documento PDF Imprimible (A4)](file:///c:/Users/capsx/Documents/trabajo/proyectos%20IA/profe-sergio/01-Modulos/Redes-Locales/03-Ejercicios/UT1/RL-UT1-Cuaderno-Actividades-y-Practicas.pdf)

### 📝 Hojas de Comprobación en Aula (Ejercicios Breves durante Presentaciones):
- ✍️ **UT1.1 - Introducción y Sistemas de Numeración**: [[EJ-RL-01-03-Comprobacion-Aula-UT1.1-Sistemas-Numeracion|Ficha Obsidian]] | [📝 Alumnado (.docx)](file:///c:/Users/capsx/Documents/trabajo/proyectos%20IA/profe-sergio/01-Modulos/Redes-Locales/03-Ejercicios/UT1/RL-UT1.1-Comprobacion-Aula-Alumnado.docx) · [🔑 Solucionario Docente (.docx)](file:///c:/Users/capsx/Documents/trabajo/proyectos%20IA/profe-sergio/01-Modulos/Redes-Locales/03-Ejercicios/UT1/RL-UT1.1-Comprobacion-Aula-Docente-Solucionario.docx)
- ✍️ **UT1.2 - Caracterización, Topologías y Magnitudes**: [[EJ-RL-01-04-Comprobacion-Aula-UT1.2-Topologias-Magnitudes|Ficha Obsidian]] | [📝 Alumnado (.docx)](file:///c:/Users/capsx/Documents/trabajo/proyectos%20IA/profe-sergio/01-Modulos/Redes-Locales/03-Ejercicios/UT1/RL-UT1.2-Comprobacion-Aula-Alumnado.docx) · [🔑 Solucionario Docente (.docx)](file:///c:/Users/capsx/Documents/trabajo/proyectos%20IA/profe-sergio/01-Modulos/Redes-Locales/03-Ejercicios/UT1/RL-UT1.2-Comprobacion-Aula-Docente-Solucionario.docx)
- ✍️ **UT1.3 - Componentes y Estándares Internacionales**: [[EJ-RL-01-05-Comprobacion-Aula-UT1.3-Componentes-Estandares|Ficha Obsidian]] | [📝 Alumnado (.docx)](file:///c:/Users/capsx/Documents/trabajo/proyectos%20IA/profe-sergio/01-Modulos/Redes-Locales/03-Ejercicios/UT1/RL-UT1.3-Comprobacion-Aula-Alumnado.docx) · [🔑 Solucionario Docente (.docx)](file:///c:/Users/capsx/Documents/trabajo/proyectos%20IA/profe-sergio/01-Modulos/Redes-Locales/03-Ejercicios/UT1/RL-UT1.3-Comprobacion-Aula-Docente-Solucionario.docx)

---

## ❓ 6. Banco de Preguntas de Test y Evaluación
> Ítems y reactivos de evaluación organizados en subcarpetas por UT (`04-Banco-Items/UT1/` a `UT8/`).

```dataview
TABLE ud as "Unidad", formato as "Formato", ra_asociados as "RAs", dificultad as "Dificultad", correcta as "Resp. Correcta"
FROM "01-Modulos/Redes-Locales/04-Banco-Items"
WHERE tipo = "item_evaluacion"
SORT ud ASC, file.name ASC
```

- 📋 **[[EV-INIC-RL-Test-y-Preguntas-Cortas|Prueba de Evaluación Inicial Diagnóstica (Cuestionario General de Perfil + Test 10 Preguntas + 4 Supuestos Prácticos)]]**:
  - 📝 [Descargar Documento Word Digital Alumnado (.docx)](file:///c:/Users/capsx/Documents/trabajo/proyectos%20IA/profe-sergio/01-Modulos/Redes-Locales/04-Banco-Items/Evaluacion-Inicial/EV-INIC-RL-Prueba-Inicial-Alumnado.docx) | [Versión PDF Imprimible (A4)](file:///c:/Users/capsx/Documents/trabajo/proyectos%20IA/profe-sergio/01-Modulos/Redes-Locales/04-Banco-Items/Evaluacion-Inicial/EV-INIC-RL-Prueba-Inicial-Alumnado.pdf)
  - 🔑 [Descargar Solucionario y Guía Docente en Word (.docx)](file:///c:/Users/capsx/Documents/trabajo/proyectos%20IA/profe-sergio/01-Modulos/Redes-Locales/04-Banco-Items/Evaluacion-Inicial/EV-INIC-RL-Solucionario-Docente.docx) | [Solucionario en PDF](file:///c:/Users/capsx/Documents/trabajo/proyectos%20IA/profe-sergio/01-Modulos/Redes-Locales/04-Banco-Items/Evaluacion-Inicial/EV-INIC-RL-Solucionario-Docente.pdf)

---

## 📦 7. Recursos Externos, Topologías y Máquinas Virtuales
> Archivos de Packet Tracer, topologías y recursos organizados en subcarpetas por UT (`05-Recursos/UT1/` a `UT8/`).

```dataview
TABLE ud as "Unidad", formato as "Formato", tamano_aprox as "Tamaño", enlace_onedrive_drive as "Enlace Nube"
FROM "01-Modulos/Redes-Locales/05-Recursos"
WHERE tipo = "recurso_externo"
SORT ud ASC
```

---

## 📑 8. Documentos de Apuntes Maquetados (HTML & PDF)
> Documentos completos finales generados con la skill `generar-apuntes` clasificados por unidad de trabajo.

- 📄 **UD01 / UT1 - Introducción a las Redes Locales. Caracterización**:
  - [Versión Web HTML](file:///c:/Users/capsx/Documents/trabajo/proyectos%20IA/profe-sergio/01-Modulos/Redes-Locales/06-Apuntes/UT1/RL-UD01-Introduccion-Redes-Locales-Caracterizacion.html) | [Documento PDF Imprimible (A4)](file:///c:/Users/capsx/Documents/trabajo/proyectos%20IA/profe-sergio/01-Modulos/Redes-Locales/06-Apuntes/UT1/RL-UD01-Introduccion-Redes-Locales-Caracterizacion.pdf)

---

## 🖥️ 9. Presentaciones y Diapositivas de Aula (16:9 HTML & PDF)
> Diapositivas interactivas oficiales para proyector y PDI generadas con la skill `generar-presentaciones-ut` (CIFP Avilés · Sergio Capdevila Díez).

- 🚀 **Presentación Inicial del Módulo (Primer Día de Clase / Guía Docente)**:
  - [Abrir Presentación Interactiva en Navegador](file:///c:/Users/capsx/Documents/trabajo/proyectos%20IA/profe-sergio/01-Modulos/Redes-Locales/07-Presentaciones/Presentacion-Inicial/RL-Presentacion-Inicial-Modulo-Redes-Locales.html) | [Descargar Diapositivas en PDF Horizontal](file:///c:/Users/capsx/Documents/trabajo/proyectos%20IA/profe-sergio/01-Modulos/Redes-Locales/07-Presentaciones/Presentacion-Inicial/RL-Presentacion-Inicial-Modulo-Redes-Locales.pdf)
- 📽️ **UD01 / UT1 - Introducción a las Redes Locales. Caracterización (3 Sesiones)**:
  - 🌐 **Parte I (UT1.1)**: [Presentación HTML](file:///c:/Users/capsx/Documents/trabajo/proyectos%20IA/profe-sergio/01-Modulos/Redes-Locales/07-Presentaciones/UT1/RL-UT1.1-Presentacion-Introduccion-Representacion-Informacion.html) · [PDF A4](file:///c:/Users/capsx/Documents/trabajo/proyectos%20IA/profe-sergio/01-Modulos/Redes-Locales/07-Presentaciones/UT1/RL-UT1.1-Presentacion-Introduccion-Representacion-Informacion.pdf) | [📝 Alumnos (.docx)](file:///c:/Users/capsx/Documents/trabajo/proyectos%20IA/profe-sergio/01-Modulos/Redes-Locales/03-Ejercicios/UT1/RL-UT1.1-Comprobacion-Aula-Alumnado.docx) · [🔑 Docente (.docx)](file:///c:/Users/capsx/Documents/trabajo/proyectos%20IA/profe-sergio/01-Modulos/Redes-Locales/03-Ejercicios/UT1/RL-UT1.1-Comprobacion-Aula-Docente-Solucionario.docx)
  - 🌐 **Parte II (UT1.2)**: [Presentación HTML](file:///c:/Users/capsx/Documents/trabajo/proyectos%20IA/profe-sergio/01-Modulos/Redes-Locales/07-Presentaciones/UT1/RL-UT1.2-Presentacion-Caracterizacion-Topologias-Magnitudes.html) · [PDF A4](file:///c:/Users/capsx/Documents/trabajo/proyectos%20IA/profe-sergio/01-Modulos/Redes-Locales/07-Presentaciones/UT1/RL-UT1.2-Presentacion-Caracterizacion-Topologias-Magnitudes.pdf) | [📝 Alumnos (.docx)](file:///c:/Users/capsx/Documents/trabajo/proyectos%20IA/profe-sergio/01-Modulos/Redes-Locales/03-Ejercicios/UT1/RL-UT1.2-Comprobacion-Aula-Alumnado.docx) · [🔑 Docente (.docx)](file:///c:/Users/capsx/Documents/trabajo/proyectos%20IA/profe-sergio/01-Modulos/Redes-Locales/03-Ejercicios/UT1/RL-UT1.2-Comprobacion-Aula-Docente-Solucionario.docx)
  - 🌐 **Parte III (UT1.3)**: [Presentación HTML](file:///c:/Users/capsx/Documents/trabajo/proyectos%20IA/profe-sergio/01-Modulos/Redes-Locales/07-Presentaciones/UT1/RL-UT1.3-Presentacion-Componentes-LAN-Estandares.html) · [PDF A4](file:///c:/Users/capsx/Documents/trabajo/proyectos%20IA/profe-sergio/01-Modulos/Redes-Locales/07-Presentaciones/UT1/RL-UT1.3-Presentacion-Componentes-LAN-Estandares.pdf) | [📝 Alumnos (.docx)](file:///c:/Users/capsx/Documents/trabajo/proyectos%20IA/profe-sergio/01-Modulos/Redes-Locales/03-Ejercicios/UT1/RL-UT1.3-Comprobacion-Aula-Alumnado.docx) · [🔑 Docente (.docx)](file:///c:/Users/capsx/Documents/trabajo/proyectos%20IA/profe-sergio/01-Modulos/Redes-Locales/03-Ejercicios/UT1/RL-UT1.3-Comprobacion-Aula-Docente-Solucionario.docx)


---

## 👥 10. Grupos Asignados
- 🏫 [[Dashboard-Grupo-SMR-Redes|SMR Presencial (Taller de Redes 102)]]

