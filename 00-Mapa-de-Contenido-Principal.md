---
tipo: moc_principal
curso_academico: "2026-2027"
profesor: "Profesor Sergio"
actualizado: 2026-09-17
---

# 🎓 Panel de Control Docente - Curso 2026-2027

Bienvenido al sistema de gestión docente basado en el principio de **Única Fuente de Verdad (SSOT)**.
Desde este panel puedes acceder a todos los módulos curriculares, a los grupos de clase presenciales y virtuales, a los bancos de evaluación y a las herramientas de aula.

---

## 📚 1. Módulos Curriculares (Fuente de Verdad - SSOT)
> Cada módulo almacena todo su currículo (RAs, Criterios, Saberes), unidades didácticas, conceptos, ejercicios y banco de preguntas de forma independiente al grupo que lo curse.

| Módulo | Ciclo | Modalidad | MOC del Módulo | Compilador Programación |
| :--- | :--- | :--- | :---: | :---: |
| **Acceso a Datos (Presencial)** | DAM2 | Presencial (5h: L 3h, X 2h) | [[MOC-Acceso-a-Datos\|Acceso a Datos]] | [[Compilador-Programacion-Didactica-AD-Presencial\|Ver Programación]] · [[Programacion-Didactica-0486-AD-Presencial.pdf\|PDF]] |
| **Acceso a Datos (A Distancia)** | DAM2 | A Distancia (Lunes 2h virt.) | [[MOC-Acceso-a-Datos\|Acceso a Datos]] | [[Compilador-Programacion-Didactica-AD-Distancia\|Ver Programación]] · [[Programacion-Didactica-0486-AD-Distancia.pdf\|PDF]] |
| **Redes Locales** | SMR1 / SMR | Presencial | [[MOC-Redes-Locales\|Redes Locales]] | [[Compilador-Programacion-Didactica-RL\|Ver Programación]] |
| **Proyecto Intermodular** | DAM 1º y 2º | Virtual | [[MOC-Proyecto-Intermodular\|Proyecto Intermodular (1º y 2º)]] | [[Compilador-Programacion-Didactica-PI\|Ver Programación Conjunta]] · [[Programacion-Didactica-Proyecto-Intermodular.pdf\|PDF Oficial]] |
| **Sostenibilidad Aplicada** | DAW1 | Virtual | [[MOC-Sostenibilidad\|Sostenibilidad]] | [[Compilador-Programacion-Didactica-SOST\|Ver Programación]] · [[Programacion-Didactica-1708-Sostenibilidad.pdf\|PDF]] |

---

## 👥 2. Grupos de Alumnos y Aulas (Instancias Operativas)
> Cada grupo gestiona su propia lista de alumnos, adaptaciones NEAE, diario de aula o tutorías, calendario específico y cuaderno de calificaciones.

```dataview
TABLE curso as "Curso/Nivel", modalidad as "Modalidad", tutor as "Tutoría"
FROM "02-Grupos"
WHERE tipo = "dashboard_grupo"
SORT file.name ASC
```

### Accesos Directos a Grupos:
- 🏫 **[[Dashboard-Grupo-DAM2-Presencial|DAM2 Presencial - Acceso a Datos]]**
  - [🚀 Presentación 1er Día (HTML)](file:///c:/Users/capsx/Documents/trabajo/proyectos%20IA/profe-sergio/01-Modulos/Acceso-a-Datos/07-Presentaciones/Presentacion-Inicial/AD-Presencial-Presentacion-Inicial.html) · [PDF](file:///c:/Users/capsx/Documents/trabajo/proyectos%20IA/profe-sergio/01-Modulos/Acceso-a-Datos/07-Presentaciones/Presentacion-Inicial/AD-Presencial-Presentacion-Inicial.pdf) | [[Compilador-Programacion-Didactica-AD-Presencial|Programación]] | [[Planificacion-Temporalizacion-AD-Presencial|Calendario y Sesiones]] | [[Cuaderno-Notas-DAM2-Presencial|Calificaciones]]
- 💻 **[[Dashboard-Grupo-DAM2-Virtual|DAM2 Virtual - Acceso a Datos]]**
  - [🚀 Presentación Inicio de Curso (HTML)](file:///c:/Users/capsx/Documents/trabajo/proyectos%20IA/profe-sergio/01-Modulos/Acceso-a-Datos/07-Presentaciones/Presentacion-Inicial/AD-Distancia-Presentacion-Inicial.html) · [PDF](file:///c:/Users/capsx/Documents/trabajo/proyectos%20IA/profe-sergio/01-Modulos/Acceso-a-Datos/07-Presentaciones/Presentacion-Inicial/AD-Distancia-Presentacion-Inicial.pdf) | [[Compilador-Programacion-Didactica-AD-Distancia|Programación]] | [[Cronograma-AD-Virtual|Cronograma Quincenal]] | [[Seguimiento-Tutorias-AD-Virtual|Tutorías]]
- 🚀 **[[Dashboard-Grupo-DAM2-Proyecto|DAM2 Virtual - Proyecto Intermodular 2]]**
  - [🚀 Presentación Inicio de Curso (HTML)](file:///c:/Users/capsx/Documents/trabajo/proyectos%20IA/profe-sergio/01-Modulos/Proyecto-Intermodular-2/07-Presentaciones/Presentacion-Inicial/PI-Presentacion-Inicial-Modulo.html) · [PDF](file:///c:/Users/capsx/Documents/trabajo/proyectos%20IA/profe-sergio/01-Modulos/Proyecto-Intermodular-2/07-Presentaciones/Presentacion-Inicial/PI-Presentacion-Inicial-Modulo.pdf) | [[Compilador-Programacion-Didactica-PI|Programación]] | [[Seguimiento-Proyectos-Fases|Seguimiento de Entregas]] | [[Cuaderno-Notas-DAM2-Proyecto|Calificaciones]] | [[Calificaciones-Proyecto-Intermodular-1|Notas 1º DAM (10%)]] | [[Enunciado-Proyecto-Intermodular-2|Enunciado]] | [[Plantilla-Memoria-Proyecto|Plantilla Memoria]] | [[Rubrica-Evaluacion-Proyecto|Rúbrica]]
- 🌱 **[[Dashboard-Grupo-DAW1-Sostenibilidad|DAW1 Virtual - Sostenibilidad]]**
  - [🚀 Presentación Inicio de Curso (HTML)](file:///c:/Users/capsx/Documents/trabajo/proyectos%20IA/profe-sergio/01-Modulos/Sostenibilidad/07-Presentaciones/Presentacion-Inicial/SOST-Distancia-Presentacion-Inicial.html) · [PDF](file:///c:/Users/capsx/Documents/trabajo/proyectos%20IA/profe-sergio/01-Modulos/Sostenibilidad/07-Presentaciones/Presentacion-Inicial/SOST-Distancia-Presentacion-Inicial.pdf) | [[Calendario-Sesiones-Sostenibilidad-Virtual|Calendario de Sesiones (Miércoles)]] | [[Cronograma-Sostenibilidad-Virtual|Cronograma]] | [[Cuaderno-Notas-DAW1-Sostenibilidad|Cuaderno de Calificaciones]]
- 🔌 **[[Dashboard-Grupo-SMR-Redes|SMR Presencial - Redes Locales]]**
  - [🚀 Presentación 1er Día (HTML)](file:///c:/Users/capsx/Documents/trabajo/proyectos%20IA/profe-sergio/01-Modulos/Redes-Locales/07-Presentaciones/Presentacion-Inicial/RL-Presentacion-Inicial-Modulo-Redes-Locales.html) · [PDF](file:///c:/Users/capsx/Documents/trabajo/proyectos%20IA/profe-sergio/01-Modulos/Redes-Locales/07-Presentaciones/Presentacion-Inicial/RL-Presentacion-Inicial-Modulo-Redes-Locales.pdf) | [[Planificacion-Temporalizacion-Redes-Presencial|Calendario y Sesiones]] | [[Cuaderno-Notas-SMR-Redes|Cuaderno de Calificaciones]] | [[Diario-Aula-SMR-Redes|Diario de Taller/Clase]]

---

## 🎯 3. Vista Rápida de Unidades Didácticas (SSOT)

```dataview
TABLE modulo as "Módulo", ra_asociados as "RAs", horas_estimadas as "Horas Estimadas"
FROM "01-Modulos"
WHERE tipo = "unidad_didactica"
SORT modulo ASC, file.name ASC
```

---

## 📝 4. Bancos de Evaluación y Preguntas Test

```dataview
TABLE modulo as "Módulo", ud as "UD", ra_asociados as "RAs", dificultad as "Dificultad"
FROM "01-Modulos"
WHERE tipo = "item_evaluacion"
SORT modulo ASC, ud ASC
```

### 📋 Evaluaciones Iniciales Diagnósticas (Comienzo de Curso):
- 🔌 **[[EV-INIC-RL-Test-y-Preguntas-Cortas|Redes Locales (1º SMR)]]**: Cuestionario tipo test (10 preguntas) + 4 supuestos prácticos ([📝 Word Alumnado (.docx)](file:///c:/Users/capsx/Documents/trabajo/proyectos%20IA/profe-sergio/01-Modulos/Redes-Locales/04-Banco-Items/Evaluacion-Inicial/EV-INIC-RL-Prueba-Inicial-Alumnado.docx) · [📄 PDF Imprimible](file:///c:/Users/capsx/Documents/trabajo/proyectos%20IA/profe-sergio/01-Modulos/Redes-Locales/04-Banco-Items/Evaluacion-Inicial/EV-INIC-RL-Prueba-Inicial-Alumnado.pdf) | [🔑 Solucionario Docente](file:///c:/Users/capsx/Documents/trabajo/proyectos%20IA/profe-sergio/01-Modulos/Redes-Locales/04-Banco-Items/Evaluacion-Inicial/EV-INIC-RL-Solucionario-Docente.docx)).
- 💾 **[[PRAC-AD-Evaluacion-Inicial|Acceso a Datos (2º DAM)]]**: Práctica de diagnóstico en Java 21 y Persistencia Básica ([🌐 HTML](file:///c:/Users/capsx/Documents/trabajo/proyectos%20IA/profe-sergio/01-Modulos/Acceso-a-Datos/03-Ejercicios/Evaluacion-Inicial/PRAC-AD-Evaluacion-Inicial.html) · [📄 PDF A4](file:///c:/Users/capsx/Documents/trabajo/proyectos%20IA/profe-sergio/01-Modulos/Acceso-a-Datos/03-Ejercicios/Evaluacion-Inicial/PRAC-AD-Evaluacion-Inicial.pdf)).
- 🌱 **[[EV-INIC-SOST-Test-Diagnostico-Sostenibilidad|Sostenibilidad Aplicada (1º DAW)]]**: Cuestionario tipo test (15 preguntas) sobre ODS, huella de carbono y sector digital.

### 🛠️ Prácticas de Afianzamiento y Ejercicios por Unidades:
- 📚 **Acceso a Datos UT1 (Hojas de Ejercicios y Solucionarios por Bloques)**:
  - 🔤 Bloque 1: Texto Plano y NIO.2 ([📄 Ejercicios PDF](file:///c:/Users/capsx/Documents/trabajo/proyectos%20IA/profe-sergio/01-Modulos/Acceso-a-Datos/03-Ejercicios/UT1/02-Ejercicios-Complementarios/Bloque-1-Texto-NIO2/AD-UT1-B1-Ejercicios-Texto-NIO2.pdf) · [🔑 Soluciones PDF](file:///c:/Users/capsx/Documents/trabajo/proyectos%20IA/profe-sergio/01-Modulos/Acceso-a-Datos/03-Ejercicios/UT1/02-Ejercicios-Complementarios/Bloque-1-Texto-NIO2/AD-UT1-B1-Soluciones-Texto-NIO2.pdf))
  - 🔢 Bloque 2: Ficheros Binarios y RAF ([📄 Ejercicios PDF](file:///c:/Users/capsx/Documents/trabajo/proyectos%20IA/profe-sergio/01-Modulos/Acceso-a-Datos/03-Ejercicios/UT1/02-Ejercicios-Complementarios/Bloque-2-Binarios-RAF-Serializacion/AD-UT1-B2-Ejercicios-Binarios-RAF.pdf) · [🔑 Soluciones PDF](file:///c:/Users/capsx/Documents/trabajo/proyectos%20IA/profe-sergio/01-Modulos/Acceso-a-Datos/03-Ejercicios/UT1/02-Ejercicios-Complementarios/Bloque-2-Binarios-RAF-Serializacion/AD-UT1-B2-Soluciones-Binarios-RAF.pdf))
  - 🌳 Bloque 3: Ecosistema XML ([📄 Ejercicios PDF](file:///c:/Users/capsx/Documents/trabajo/proyectos%20IA/profe-sergio/01-Modulos/Acceso-a-Datos/03-Ejercicios/UT1/02-Ejercicios-Complementarios/Bloque-3-XML/AD-UT1-B3-Ejercicios-XML.pdf) · [🔑 Soluciones PDF](file:///c:/Users/capsx/Documents/trabajo/proyectos%20IA/profe-sergio/01-Modulos/Acceso-a-Datos/03-Ejercicios/UT1/02-Ejercicios-Complementarios/Bloque-3-XML/AD-UT1-B3-Soluciones-XML.pdf))
- 💾 **[[PRAC-AD-UT1-Gestor-Ficheros-MultiFormato|Acceso a Datos UT1: CLI de Migración y Gestión Multi-Formato de Catálogo]]**: Texto CSV, RAF, Serialización y XML DOM/SAX ([🌐 HTML](file:///c:/Users/capsx/Documents/trabajo/proyectos%20IA/profe-sergio/01-Modulos/Acceso-a-Datos/03-Ejercicios/UT1/02-Ejercicios-Complementarios/Proyecto-Capstone/PRAC-AD-UT1-Gestor-Ficheros-MultiFormato.html) · [📄 PDF A4](file:///c:/Users/capsx/Documents/trabajo/proyectos%20IA/profe-sergio/01-Modulos/Acceso-a-Datos/03-Ejercicios/UT1/02-Ejercicios-Complementarios/Proyecto-Capstone/PRAC-AD-UT1-Gestor-Ficheros-MultiFormato.pdf)).

---

## 🛠️ 5. Herramientas y Metadatos del Sistema

- 📁 [[Manual-de-Uso-del-Vault|📖 Manual de Uso del Vault y Buenas Prácticas]]
- 🤖 [[AGENTS|🤖 Reglas y Directivas para Asistentes IA (AGENTS.md)]]
- 🖨️ [[.agents/skills/generar-apuntes/SKILL|🖨️ Skill Docente: Generación y Maquetación de Apuntes (HTML -> PDF)]] (con [[.agents/skills/generar-apuntes/references/prompt-maestro-apuntes-fp|Prompt Maestro de FP]], en `06-Apuntes/UTx/`)
- 📑 [[.agents/skills/generar-programacion/SKILL|📑 Skill Docente: Generación de Programaciones Didácticas Oficiales (HTML -> PDF)]] (en `00-Programacion/`)
- 🖥️ [[.agents/skills/generar-presentaciones/SKILL|🖥️ Skill Docente: Presentaciones Iniciales de Módulo (HTML -> PDF)]] (inicio de curso, tema oscuro en `07-Presentaciones/Presentacion-Inicial/`)
- 💡 [[.agents/skills/generar-presentaciones-ut/SKILL|💡 Skill Docente: Presentaciones Teóricas de Unidades de Trabajo (UT) (HTML -> PDF)]] (tema claro, letra extra grande, didáctica paso a paso en `07-Presentaciones/UTx/`)
- 🛠️ [[.agents/skills/generar-practicas/SKILL|🛠️ Skill Docente: Generación de Prácticas Técnicas y Rúbricas (HTML -> PDF)]] (organizadas en `03-Ejercicios/`)
- 🗂️ **Estructura Modular por UT**: Todos los contenidos (`02-Conceptos`, `03-Ejercicios`, `04-Banco-Items`, `05-Recursos`, `06-Apuntes`, `07-Presentaciones`) organizados en subcarpetas `UT1/`, `UT2/`, etc.
- 📋 [[00-Meta/Plantillas/|📁 Directorio de Plantillas (Templates)]]

- 📊 [[Rubrica-Practicas-Programacion|Rúbrica General de Prácticas]]
- 📅 [[Calendario-Escolar-2026-2027|Calendario Escolar Oficial (Avilés, Asturias)]]
- 🕒 [[Horario-Docente-Sergio-2026-2027|Horario Docente Oficial 2026-2027 (Aulas, Guardias y Departamentos)]]
