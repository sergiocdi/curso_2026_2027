---
tipo: dashboard_grupo
grupo: "SMR-Presencial-Redes"
curso: "SMR 1º"
modulo: "Redes Locales"
modalidad: "Presencial"
aula: "Aula C209"
tutor: "Sergio"
horario: "Martes (08:30-09:25), Jueves (12:40-13:35), Viernes (10:20-11:15 y 11:45-12:40)"
---

# 🔌 Grupo: SMR Presencial - Redes Locales

> **Módulo Curricular (SSOT)**: [[MOC-Redes-Locales|Redes Locales]]  
> **Aula**: C209 | **Horas Semanales**: 4h lectivas  
> **Horario Oficial**: [[Horario-Docente-Sergio-2026-2027|Ver Horario Completo]]

---

## ⚡ Accesos Directos
- 🚀 [Presentación Primer Día de Clase (HTML 16:9)](file:///c:/Users/capsx/Documents/trabajo/proyectos%20IA/profe-sergio/01-Modulos/Redes-Locales/07-Presentaciones/Presentacion-Inicial/RL-Presentacion-Inicial-Modulo-Redes-Locales.html) · [Versión PDF](file:///c:/Users/capsx/Documents/trabajo/proyectos%20IA/profe-sergio/01-Modulos/Redes-Locales/07-Presentaciones/Presentacion-Inicial/RL-Presentacion-Inicial-Modulo-Redes-Locales.pdf)
- 📝 [Prueba de Evaluación Inicial Alumnado (.docx)](file:///c:/Users/capsx/Documents/trabajo/proyectos%20IA/profe-sergio/01-Modulos/Redes-Locales/04-Banco-Items/Evaluacion-Inicial/EV-INIC-RL-Prueba-Inicial-Alumnado.docx) · [Versión PDF Imprimible](file:///c:/Users/capsx/Documents/trabajo/proyectos%20IA/profe-sergio/01-Modulos/Redes-Locales/04-Banco-Items/Evaluacion-Inicial/EV-INIC-RL-Prueba-Inicial-Alumnado.pdf) | [Solucionario (.docx)](file:///c:/Users/capsx/Documents/trabajo/proyectos%20IA/profe-sergio/01-Modulos/Redes-Locales/04-Banco-Items/Evaluacion-Inicial/EV-INIC-RL-Solucionario-Docente.docx)
- 📅 [[Planificacion-Temporalizacion-Redes-Presencial|Calendario y Plan de Taller]]
- 📊 [[Cuaderno-Notas-SMR-Redes|Cuaderno de Calificaciones]] · [[Calificaciones-Reto-UT1.1|Calificaciones Reto UT1.1]]
- 📝 [[Diario-Aula-SMR-Redes|Diario de Aula e Incidencias en Taller]]
- 📖 [[Compilador-Programacion-Didactica-RL|Programación Didáctica Oficial]]
- 🕒 [[Horario-Docente-Sergio-2026-2027|Horario Docente y Distribución de Aulas]]

---

## 👥 Alumnos Matriculados (28 Alumnos)

```dataview
TABLE nombre_completo as "Nombre y Apellidos", email_corporativo as "Email", puesto_taller as "Puesto Taller", estado_matricula as "Matrícula", neae as "NEAE"
FROM "02-Grupos/SMR-Presencial-Redes/Alumnos"
WHERE tipo = "alumno"
SORT nombre_completo ASC
```

---

### 🔄 Alumnado Repetidor (5 Alumnos)
> [!INFO] Plan de Seguimiento y Refuerzo
> El alumnado repetidor cuenta con experiencia previa en el taller, pero requiere especial atención en el afianzamiento de los RAs prácticos no superados y seguimiento continuo de asistencia.

```dataview
TABLE nombre_completo as "Alumno/a", email_corporativo as "Email", observaciones as "Observaciones de Seguimiento"
FROM "02-Grupos/SMR-Presencial-Redes/Alumnos"
WHERE tipo = "alumno" AND estado_matricula = "repetidor"
SORT nombre_completo ASC
```

