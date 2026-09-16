---
tipo: ra
modulo: "{{modulo}}"
codigo: "{{ra_codigo}}" # Ej: RA1
peso_porcentaje: 0 # Ponderación dentro del módulo (ej: 15)
descripcion: "{{descripcion_ra}}"
---

# {{ra_codigo}} - {{descripcion_corta}}

> **Enunciado Oficial**: `{{descripcion_ra}}`  
> **Ponderación Global**: `{{peso_porcentaje}}%`

---

## 🎯 Criterios de Evaluación Asociados

| Código | Criterio de Evaluación | Ponderación en RA (%) | Instrumentos Habituales |
| :--- | :--- | :---: | :--- |
| **a)** | | 20% | Práctica de aula, Test |
| **b)** | | 25% | Proyecto, Rúbrica |
| **c)** | | 25% | Examen práctico |
| **d)** | | 30% | Práctica de entrega |

---

## 📦 Saberes Básicos / Contenidos Relacionados
- Bloque 1: ...
- Bloque 2: ...

---

## 📚 Unidades Didácticas donde se Trabaja
```dataview
LIST FROM "01-Modulos"
WHERE tipo = "unidad_didactica" AND contains(ra_asociados, this.codigo)
```

---

## 📝 Banco de Preguntas y Ejercicios Vinculados
```dataview
TABLE tipo, dificultad, ud
FROM "01-Modulos"
WHERE contains(ra_asociados, this.codigo)
```
