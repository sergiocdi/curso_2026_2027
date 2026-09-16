---
tipo: unidad_didactica
modulo: "Acceso a Datos"
numero_ud: "UD06"
titulo: "UT6: Componentes de Acceso a Datos (Conceptos Básicos y Reutilización)"
horas_estimadas: 10
ra_asociados: ["RA6"]
ce_asociados: ["CE6.a", "CE6.b", "CE6.c"]
trimestre: 2
estado: en_desarrollo
---

# UT6 / UD06: Componentes de Acceso a Datos (Conceptos Básicos y Reutilización)

> **Módulo**: [[MOC-Acceso-a-Datos|Acceso a Datos]] | **Horas**: `10 h` | **Trimestre**: `2º` | **RA**: `RA6`

---

## 💡 Justificación y Enfoque de la Unidad
> [!NOTE]
> Esta unidad se aborda de forma sintética e introductoria al cierre del curso lectivo, priorizando la comprensión de los **conceptos fundamentales de reutilización de software** y un **ejemplo práctico guiado y sencillo** sin entrar en arquitecturas complejas.

En el desarrollo profesional de software, crear componentes reutilizables y desacoplados permite distribuir librerías entre distintos equipos de trabajo o proyectos cliente sin reescribir la lógica de conexión ni la lógica de persistencia.

---

## 🧱 Bloques de Contenidos Principales

### 1. Conceptos Básicos: ¿Qué es un Componente Software?
- Concepto de componente software y desarrollo basado en componentes (CBD): caja negra con interfaz pública definida.
- Ventajas: reutilización directa, mantenibilidad, testeo aislado y reducción de costes de desarrollo.
- El estándar histórico y canónico de Java: **JavaBeans**:
  - Constructor público por defecto (sin argumentos).
  - Propiedades privadas encapsuladas accesibles mediante métodos accesores (`get...()`, `set...()`, `is...()`).
  - Implementación de la interfaz `java.io.Serializable` para permitir la persistencia de su estado.
  - Eventos y propiedades vinculadas (*Bound Properties* con `PropertyChangeSupport`).

### 2. Empaquetado y Distribución en Librerías JAR
- Compilación y empaquetado de clases en un archivo comprimido estándar `.jar` (*Java Archive*).
- Empaquetado automatizado mediante herramientas de construcción:
  - Generación del artefacto con Maven (`mvn clean package`).
  - Instalación en el repositorio local del desarrollador (`mvn install`).
- Inclusión del componente como dependencia externa en otros proyectos Java.

### 3. Ejemplo Práctico Sencillo: Componente de Acceso a Datos Reutilizable
- **Desarrollo del componente (`GestorPersistenciaSimple.jar`)**:
  - Clase JavaBean que encapsula una consulta parametrizada o la lectura de un fichero de configuración.
  - Exposición de métodos sencillos: `conectar()`, `obtenerUltimoRegistro()`, `cerrar()`.
- **Consumo desde una aplicación cliente externa**:
  - Creación de un proyecto Java independiente.
  - Importación del archivo `.jar` como librería externa (en el *Classpath* o como dependencia Maven).
  - Instanciación y llamada directa a los métodos del componente sin necesidad de conocer su implementación interna.

---

## 🧠 Conceptos Clave
```dataview
TABLE dificultad, estado
FROM "01-Modulos/Acceso-a-Datos/02-Conceptos"
WHERE tipo = "concepto" AND ud = "UD06"
SORT file.name ASC
```

---

## 💻 Actividades y Prácticas
```dataview
TABLE tipo_actividad, dificultad, tiempo_estimado_min + " min" as "Tiempo"
FROM "01-Modulos/Acceso-a-Datos/03-Ejercicios"
WHERE tipo = "ejercicio" AND ud = "UD06"
SORT file.name ASC
```

---

## ❓ Preguntas de Evaluación y Test Asociadas
```dataview
TABLE subtipo, dificultad, correcta as "Solución"
FROM "01-Modulos/Acceso-a-Datos/04-Banco-Items"
WHERE tipo = "item_evaluacion" AND ud = "UD06"
```
