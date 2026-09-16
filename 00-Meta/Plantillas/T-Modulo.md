---
tipo: modulo_info
nombre_modulo: "{{nombre_modulo}}"
codigo_oficial: "{{codigo}}"
ciclo: "{{ciclo}}" # DAM, DAW, SMR
curso: "{{curso}}" # 1 o 2
horas_totales: 0
horas_semanales: 0
equivalencia_ects: 0
normativa_decreto: ""
---

# 📚 Módulo Profesional: {{nombre_modulo}}

> **Código Oficial**: `{{codigo_oficial}}` | **Ciclo**: `{{ciclo}} (Curso {{curso}})`  
> **Horas Totales**: `{{horas_totales}} h` | **Horas Semanales**: `{{horas_semanales}} h` | **ECTS**: `{{equivalencia_ects}}`

---

## 🎯 Resultados de Aprendizaje (RAs) del Módulo
```dataview
TABLE codigo as "Código", peso_porcentaje as "Peso (%)", descripcion as "Resultado de Aprendizaje"
FROM "01-Modulos"
WHERE tipo = "ra" AND modulo = this.nombre_modulo
SORT codigo ASC
```

---

## 📦 Unidades Didácticas Planificadas
```dataview
TABLE numero_ud as "UD", titulo as "Título", horas_estimadas as "Horas", ra_asociados as "RAs Asociados", trimestre as "Trimestre"
FROM "01-Modulos"
WHERE tipo = "unidad_didactica" AND modulo = this.nombre_modulo
SORT numero_ud ASC
```

---

## 👥 Grupos que Cursan este Módulo
```dataview
TABLE curso as "Nivel", modalidad as "Modalidad", aula as "Aula/Plataforma"
FROM "02-Grupos"
WHERE modulo = this.nombre_modulo
```
