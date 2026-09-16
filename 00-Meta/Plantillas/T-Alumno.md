---
tipo: alumno
grupo: "{{grupo}}" # Ej: DAM2-Presencial-AD
nombre_completo: "{{apellidos_nombre}}"
email_corporativo: "{{email}}"
telefono_contacto: ""
github_user: ""
neae: false # true | false
medidas_dua: "Ninguna destacada"
estado_matricula: ordinaria # ordinaria | convalidada | pendiente_evaluar | baja
observaciones: ""
---

# 👤 Alumno: {{apellidos_nombre}}

> **Grupo**: `{{grupo}}` | **Email**: `{{email_corporativo}}` | **GitHub**: `{{github_user}}`

---

## 📋 Información y Adaptaciones (DUA / NEAE)
- **Necesidades Específicas / DUA**: `{{neae}}`
- **Medidas aplicadas**: `{{medidas_dua}}`
- **Observaciones de tutoría / seguimiento**: `{{observaciones}}`

---

## 📊 Calificaciones y Evidencias del Alumno

### Evaluaciones por Resultados de Aprendizaje:
| RA / Criterio | Instrumento | Fecha | Calificación (0-10) | Ponderación | Observaciones / Feedback |
| :--- | :--- | :---: | :---: | :---: | :--- |
| **RA1** - Ficheros | Práctica UD01 | 2026-10-15 | 8.5 | 15% | Buen manejo de streams y excepciones |
| **RA1** - Ficheros | Test UD01 | 2026-10-22 | 7.0 | 5% | Repasar serialización binaria |
| **RA2** - Conectores JDBC | Práctica UD02 | 2026-11-20 | - | 20% | - |

---

## 📝 Diario de Seguimiento Individual / Incidencias
- **2026-09-15**: Incorporación al grupo. Entorno de desarrollo configurado correctamente.
- **2026-10-02**: Consulta en tutoría sobre la estructura de persistencia en ficheros binarios.
