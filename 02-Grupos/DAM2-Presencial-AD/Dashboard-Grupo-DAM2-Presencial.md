---
tipo: dashboard_grupo
grupo: "DAM2-Presencial-AD"
curso: "DAM 2º"
modulo: "Acceso a Datos"
modalidad: "Presencial"
aula: "Aula C210"
horario: "5 horas semanales: Lunes (3h: 17:35-20:50) y Miércoles (2h: 17:35-19:55)"
tutor: "Sergio"
---

# 🏫 Grupo: DAM2 Presencial - Acceso a Datos

> **Módulo Curricular (SSOT)**: [[MOC-Acceso-a-Datos|Acceso a Datos]]  
> **Aula**: C210 | **Modalidad**: Presencial (Tarde) | **Horas Semanales**: **5h** (Lunes 3h y Miércoles 2h)  
> **Horario Oficial**: [[Horario-Docente-Sergio-2026-2027|Ver Horario Completo]]

---

## ⚡ Accesos Operativos Rápidos
- 🚀 [Presentación Primer Día de Clase (HTML 16:9)](file:///c:/Users/capsx/Documents/trabajo/proyectos%20IA/profe-sergio/01-Modulos/Acceso-a-Datos/07-Presentaciones/Presentacion-Inicial/AD-Presencial-Presentacion-Inicial.html) · [Versión PDF](file:///c:/Users/capsx/Documents/trabajo/proyectos%20IA/profe-sergio/01-Modulos/Acceso-a-Datos/07-Presentaciones/Presentacion-Inicial/AD-Presencial-Presentacion-Inicial.pdf)
- 📋 [Práctica de Evaluación Inicial (HTML)](file:///c:/Users/capsx/Documents/trabajo/proyectos%20IA/profe-sergio/01-Modulos/Acceso-a-Datos/03-Ejercicios/Evaluacion-Inicial/PRAC-AD-Evaluacion-Inicial.html) · [PDF A4](file:///c:/Users/capsx/Documents/trabajo/proyectos%20IA/profe-sergio/01-Modulos/Acceso-a-Datos/03-Ejercicios/Evaluacion-Inicial/PRAC-AD-Evaluacion-Inicial.pdf)
- 📖 [[Compilador-Programacion-Didactica-AD-Presencial|Programación Didáctica Oficial (Presencial)]] · [PDF Oficial](file:///c:/Users/capsx/Documents/trabajo/proyectos%20IA/profe-sergio/01-Modulos/Acceso-a-Datos/00-Programacion/Presencial/Programacion-Didactica-0486-AD-Presencial.pdf)
- 📅 [[Planificacion-Temporalizacion-AD-Presencial|Calendario y Planificación Sesión a Sesión]]
- 📊 [[Cuaderno-Notas-DAM2-Presencial|Cuaderno de Calificaciones y RAs]]
- 📝 [[Diario-Aula-DAM2-Presencial|Diario de Aula e Incidencias]]
- 🕒 [[Horario-Docente-Sergio-2026-2027|Horario Docente y Ubicación de Aulas]]

> [!TIP]
> **Entorno de Trabajo e Inteligencia Artificial:**
> - **IDE Principal**: **Eclipse IDE** (entorno de referencia en C210; se admite otro como IntelliJ o VS Code con Maven).
> - **Política de IA**: 
>   - *1ª Evaluación*: Permitida solo para estudio/dudas. **No recomendada en ejercicios/prácticas formativas** y **terminantemente prohibida en exámenes**.
>   - *2ª Evaluación (Proyecto)*: Permitida, pero con **defensa técnica individual obligatoria** (se exigirá explicar y justificar todo el código).

---

## 👥 Listado de Alumnos del Grupo
```dataview
TABLE nombre_completo as "Nombre y Apellidos", email_corporativo as "Email", github_user as "GitHub", neae as "NEAE"
FROM "02-Grupos/DAM2-Presencial-AD/Alumnos"
WHERE tipo = "alumno"
SORT file.name ASC
```

---

## ⚠️ Atención a la Diversidad / Alumnado con Adaptación (NEAE / DUA)
```dataview
TABLE nombre_completo as "Alumno", medidas_dua as "Medidas y Adaptaciones"
FROM "02-Grupos/DAM2-Presencial-AD/Alumnos"
WHERE tipo = "alumno" AND neae = true
```

---

## 📅 Últimas Sesiones en el Diario de Aula
```dataview
TABLE fecha as "Fecha", ud_trabajada as "Unidad", hora_inicio + " - " + hora_fin as "Horario"
FROM "02-Grupos/DAM2-Presencial-AD/Diario-Aula"
WHERE tipo = "diario_sesion"
SORT fecha DESC
LIMIT 5
```
