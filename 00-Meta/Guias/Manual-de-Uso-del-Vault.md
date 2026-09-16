---
tipo: guia_usuario
titulo: Manual de Uso del Vault Docente de Formación Profesional
autor: "Profesor Sergio"
version: "1.0"
actualizado: 2026-09-04
---

# 📖 Manual de Uso del Vault Docente - Formación Profesional

Este manual explica los flujos de trabajo diarios para sacar el máximo rendimiento a tu sistema de gestión en **Obsidian** basado en el principio de **Única Fuente de Verdad (Single Source of Truth - SSOT)**.

---

## 🧭 1. El Mapa de Contenido Principal (MOC)
El punto de entrada del sistema es siempre el archivo:
- `[[00-Mapa-de-Contenido-Principal]]`

Fíjalo como nota anclada (*Pinned tab*) en Obsidian. Desde él tienes acceso inmediato a tus 4 módulos, a los paneles de tus 5 grupos, a los bancos de preguntas globales y a las fichas de recursos.

---

## 🏛️ 2. El Principio SSOT (Fuente Única): Módulos vs Grupos

El error más común en la gestión docente es duplicar materiales cuando un módulo se da en dos modalidades distintas (como **Acceso a Datos** en presencial y virtual).

### ¿Cómo lo resolvemos aquí?
1. **En `01-Modulos/Acceso-a-Datos/`**:
   - Viven los RAs, Criterios de Evaluación, Saberes Básicos, Unidades Didácticas, Conceptos Clave, Ejercicios y Banco de Preguntas.
   - **Solo se editan aquí**. Si mejoras una explicación de JDBC o corriges una errata en un ejercicio, se actualiza automáticamente tanto para el grupo presencial como para el virtual.
2. **En `02-Grupos/`**:
   - `DAM2-Presencial-AD/` gestiona el calendario de clases de aula 204, las faltas de asistencia, el diario de clase presencial y las fichas de sus alumnos.
   - `DAM2-Virtual-AD/` gestiona las quincenas de trabajo, las grabaciones de Google Meet, las dudas de foros de Moodle y las calificaciones de la plataforma.
   - Ambos grupos **enlazan y transcluyen** el material de `01-Modulos/Acceso-a-Datos/`.

---

## 📑 3. Cómo se genera la Programación Didáctica

Has indicado expresamente que **no quieres una plantilla monolítica** de programación didáctica, sino que cada apartado se trabaje de forma individual e independiente.

### Estructura de Apartados:
En cada módulo encontrarás la carpeta `00-Programacion/` con archivos atómicos:
- `01-Identificacion-y-Datos-Informativos.md`
- `02-Contexto-del-Centro-y-Alumnado.md`
- `03-Resultados-de-Aprendizaje-y-Criterios.md`
- `04-Contenidos-y-Saberes-Basicos.md`
- `05-Unidades-Didacticas-y-Temporalizacion.md`
- `06-Metodologia-Didactica-y-Estrategias.md`
- `07-Evaluacion-Instrumentos-y-Calificacion.md`
- `08-Atencion-a-la-Diversidad-DUA.md`
- `09-Planes-de-Recuperacion-y-Pendientes.md`
- `10-Recursos-y-Espacios-Didacticos.md`

### ¿Cómo se genera el documento completo?
Cada módulo dispone de un **Compilador** (por ejemplo, `[[Compilador-Programacion-Didactica-AD]]`):
- Este archivo utiliza la sintaxis de transclusión de Obsidian: `![[01-Identificacion...]]`, `![[02-Contexto...]]`, etc.
- Cuando abres el compilador en modo lectura (*Reading view*) o lo exportas a PDF / Word, **Obsidian renderiza todo el documento continuo**, con numeración impecable y tablas actualizadas.
- Si la jefatura de estudios te pide cambiar la temporalización o los criterios de calificación, solo abres el apartado individual correspondiente, lo editas, y la programación completa queda actualizada en el acto.

---

## ❓ 4. Creación y Generación de Exámenes desde el Banco de Preguntas

Cada pregunta de evaluación se almacena como una nota independiente con metadatos:
```yaml
---
tipo: item_evaluacion
subtipo: test
modulo: "Acceso a Datos"
ud: "UD01"
ra_asociados: ["RA1"]
dificultad: media
correcta: "B"
---
```

### Para generar un examen para los alumnos (sin respuestas):
Crea una nota nueva `Examen-UD01-AD-Alumnos.md` e incrusta una consulta Dataview o transcluye los enunciados:
```markdown
# Examen Parcial: Unidad Didáctica 1 (Manejo de Ficheros)

![[TEST-AD-01-Streams-Buffer#Enunciado]]
![[TEST-AD-01-Streams-Buffer#Opciones]]

---

![[TEST-AD-02-Serializacion-Transient#Enunciado]]
![[TEST-AD-02-Serializacion-Transient#Opciones]]
```

### Para el modelo de corrección del profesor:
En la ficha del examen del profesor, transcluyes además `#Justificación` y consultas la clave `correcta`.

---

## 👥 5. Gestión de Alumnos y Cuaderno de Notas

### Dar de alta a un nuevo alumno:
1. Navega a `02-Grupos/<Nombre-Grupo>/Alumnos/`.
2. Crea una nota con el nombre `Apellidos_Nombre.md`.
3. Aplica la plantilla `[[00-Meta/Plantillas/T-Alumno|T-Alumno]]`.
4. Rellena los datos (email, GitHub, si tiene NEAE/DUA).

### Cuaderno de Notas automático:
El archivo `Cuaderno-Notas-DAM2-Presencial.md` incluye una consulta **Dataview** que lee automáticamente el valor `nota_ra1`, `nota_ra2`, etc., de la cabecera de cada ficha de alumno y calcula la **media ponderada oficial en tiempo real**:
$$\text{Nota Final} = 0.15 \cdot \text{RA1} + 0.20 \cdot \text{RA2} + 0.25 \cdot \text{RA3} + 0.10 \cdot \text{RA4} + 0.20 \cdot \text{RA5} + 0.10 \cdot \text{RA6}$$

---

## 📦 6. Gestión de Recursos Pesados (Archivos > 50 MB)

Para mantener el Vault de Obsidian rápido, ligero y fácil de sincronizar en la nube (GitHub, Google Drive, iCloud) sin superar cuotas de almacenamiento:
1. **Nunca almacenes archivos pesados directamente en el vault** (imágenes ISO, máquinas virtuales `.ova`, vídeos largos, grandes datasets).
2. Sube el archivo pesado a tu almacenamiento corporativo (OneDrive de la Consejería / Google Drive / Moodle).
3. En la carpeta `05-Recursos/` del módulo correspondiente, crea una ficha usando la plantilla `[[00-Meta/Plantillas/T-Ficha-Recurso-Pesado|T-Ficha-Recurso-Pesado]]`.
4. En esa ficha anotas:
   - Enlace directo de descarga.
   - Enlace a la tarea en Moodle.
   - Requisitos hardware y credenciales por defecto.
   - Checksum SHA-256 para verificar la integridad del archivo descargado por los alumnos.

---

## 🔌 7. Plugins Esenciales Recomendados para Instalar en Obsidian

Para disfrutar al 100% de este sistema, instala desde *Ajustes -> Complementos de la comunidad*:
1. **Dataview** *(Imprescindible)*: Permite renderizar todas las tablas dinámicas de RAs, alumnos, unidades y notas.
2. **Templater**: Facilita la creación rápida de notas a partir de las plantillas de `00-Meta/Plantillas/`.
3. **Advanced Tables**: Te permite editar tablas Markdown de notas y criterios con la comodidad de Excel (tecla Tab, ordenación).
4. **Kanban**: Para visualizar los estados de los proyectos intermodulares o entregas de alumnos en columnas visuales.
5. **Better Export PDF** o **Pandoc**: Para exportar la programación didáctica completa a un documento PDF o Word oficial con formato profesional para entregar a Jefatura de Estudios o Inspección.
