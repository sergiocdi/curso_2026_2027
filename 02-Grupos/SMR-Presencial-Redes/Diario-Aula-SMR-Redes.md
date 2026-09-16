---
tipo: hub_diario_aula
grupo: "SMR-Presencial-Redes"
---

# 📝 Diario de Aula: SMR Redes Locales

```dataview
TABLE fecha as "Fecha", ud_trabajada as "Unidad", hora_inicio + " - " + hora_fin as "Horario"
FROM "02-Grupos/SMR-Presencial-Redes/Diario-Aula"
WHERE tipo = "diario_sesion"
SORT fecha DESC
```
