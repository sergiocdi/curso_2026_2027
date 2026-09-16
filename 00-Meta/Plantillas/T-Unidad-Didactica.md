---
tipo: unidad_didactica
modulo: "{{modulo}}"
numero_ud: "UD01"
titulo: "{{titulo_ud}}"
horas_estimadas: 20
ra_asociados: [RA1]
ce_asociados: [CE1.a, CE1.b, CE1.c]
trimestre: 1 # 1, 2 o 3
estado: desarrollo # borrador | desarrollo | impartida | revisada
---

# {{numero_ud}}: {{titulo_ud}}

## 🎯 Identificación Curricular
- **Módulo**: [[MOC-{{modulo}}|{{modulo}}]]
- **Horas lectivas estimadas**: `{{horas_estimadas}} h`
- **Resultados de Aprendizaje**: `{{ra_asociados}}`
- **Criterios de Evaluación**: `{{ce_asociados}}`

---

## 💡 Introducción y Justificación
<!-- Contextualización de la unidad, motivación profesional, reto inicial -->

---

## 🧱 Bloques de Saberes Básicos / Contenidos
1. **Conceptos Fundamentales**:
   - ...
2. **Implementación Práctica**:
   - ...
3. **Buenas Prácticas y Seguridad**:
   - ...

---

## 🧠 Conceptos Clave
```dataview
TABLE dificultad, estado
FROM "01-Modulos"
WHERE tipo = "concepto" AND ud = this.numero_ud AND modulo = this.modulo
SORT file.name ASC
```

---

## 💻 Actividades y Prácticas
```dataview
TABLE tipo_actividad, dificultad, ra_asociados
FROM "01-Modulos"
WHERE tipo = "ejercicio" AND ud = this.numero_ud AND modulo = this.modulo
SORT file.name ASC
```

---

## ❓ Preguntas de Evaluación y Test Asociadas
```dataview
TABLE subtipo, dificultad, ra_asociados
FROM "01-Modulos"
WHERE tipo = "item_evaluacion" AND ud = this.numero_ud AND modulo = this.modulo
```

---

## 📦 Recursos Pesados y Enlaces
```dataview
TABLE formato, tamano_aprox, enlace_descarga
FROM "01-Modulos"
WHERE tipo = "recurso_externo" AND ud = this.numero_ud AND modulo = this.modulo
```
