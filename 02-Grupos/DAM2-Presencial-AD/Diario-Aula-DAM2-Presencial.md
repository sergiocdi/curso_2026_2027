---
tipo: hub_diario_aula
grupo: "DAM2-Presencial-AD"
---

# 📝 Diario de Aula: DAM2 Presencial (Acceso a Datos)

> Registro cronológico de sesiones de clase, incidencias de taller/aula y seguimiento del grupo.

---

## 📅 Registro Completo de Sesiones
```dataview
TABLE fecha as "Fecha", ud_trabajada as "Unidad", hora_inicio + " - " + hora_fin as "Horario", file.link as "Ficha Sesión"
FROM "02-Grupos/DAM2-Presencial-AD/Diario-Aula"
WHERE tipo = "diario_sesion"
SORT fecha DESC
```

---

## 📌 Crear Nueva Sesión
Usa la plantilla `[[00-Meta/Plantillas/T-Sesion-Diario|T-Sesion-Diario]]` para registrar cada clase impartida.
