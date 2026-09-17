---
tipo: unidad_didactica
modulo: "Acceso a Datos"
numero_ud: "UD01"
titulo: "UT1: Manejo de Ficheros"
horas_estimadas: 30
ra_asociados: ["RA1"]
ce_asociados: ["CE1.a", "CE1.b", "CE1.c", "CE1.d", "CE1.e"]
trimestre: 1
estado: en_desarrollo
---

# UT1 / UD01: Manejo de Ficheros

> **Módulo**: [[MOC-Acceso-a-Datos|Acceso a Datos]] | **Horas**: `30 h` | **Trimestre**: `1º` | **RA**: `RA1`

---

## 💡 Justificación y Reto Inicial
Casi toda aplicación requiere persistir configuraciones locales, procesar registros del sistema o intercambiar datos estructurados sin depender de un motor de bases de datos. En esta unidad, los alumnos construirán utilidades y analizadores para procesar ficheros de texto plano, flujos binarios de datos tipados y documentos XML estandarizados.

---

## 🧱 Bloques de Contenidos Principales

### 1. Lectura y Escritura de Ficheros de Texto
- Jerarquía de flujos de caracteres: clases abstractas `Reader` y `Writer`.
- Manejo de ficheros de texto con `FileReader` y `FileWriter`.
- Optimización de E/S con búfer: `BufferedReader` (método `readLine()`) y `BufferedWriter` (método `newLine()`).
- Clases de conveniencia: `Scanner` y `PrintWriter`.
- Manejo moderno de ficheros de texto con `java.nio.file.Path` y `java.nio.file.Files` (`readString()`, `writeString()`, `lines()`).
- Gestión de juegos de caracteres y codificación (UTF-8, ISO-8859-1).

### 2. Lectura y Escritura de Ficheros de Datos
- Jerarquía de flujos de bytes: clases abstractas `InputStream` y `OutputStream`.
- Flujos de ficheros binarios: `FileInputStream` y `FileOutputStream`.
- Lectura y escritura de tipos primitivos de datos: `DataInputStream` y `DataOutputStream` (`writeInt()`, `readUTF()`, etc.).
- Ficheros de acceso aleatorio: `RandomAccessFile` (puntero de archivo, método `seek()`, modos "r" y "rw").
- Serialización y deserialización de objetos en Java:
  - Interfaz `java.io.Serializable` y el identificador de versión `serialVersionUID`.
  - Canales de objetos: `ObjectOutputStream` y `ObjectInputStream`.
  - Exclusión de atributos sensibles o volátiles mediante la palabra clave `transient`.

### 3. Lectura y Escritura en Ficheros XML
- Fundamentos y estructura de documentos XML: elementos, atributos, prólogo y validación básica.
- Procesamiento y generación de XML mediante **DOM (Document Object Model)**:
  - Creación del árbol en memoria con `DocumentBuilderFactory` y `DocumentBuilder`.
  - Navegación, búsqueda de nodos (`getElementsByTagName()`) y modificación de elementos.
  - Escritura y volcado a fichero XML mediante `TransformerFactory` y `Transformer`.
- Procesamiento de XML mediante **SAX (Simple API for XML)**:
  - Lectura orientada a eventos para ficheros de gran tamaño (`DefaultHandler`, `startElement()`, `characters()`, `endElement()`).
- Alternativa declarativa: Mapeo Objeto-XML con **JAXB** (`@XmlRootElement`, `@XmlElement`, Marshaller y Unmarshaller).

---

## 🧠 Conceptos Clave
```dataview
TABLE dificultad, estado
FROM "01-Modulos/Acceso-a-Datos/02-Conceptos"
WHERE tipo = "concepto" AND ud = "UD01"
SORT file.name ASC
```

---

## 💻 Actividades y Prácticas
- 📓 **Cuaderno de Actividades de Aula Acompañado (Síncrono Teoría-Práctica)**:
  - [🌐 Cuaderno Interactivo de Aula - Alumnado (HTML)](file:///c:/Users/capsx/Documents/trabajo/proyectos%20IA/profe-sergio/01-Modulos/Acceso-a-Datos/03-Ejercicios/UT1/01-Cuaderno-Actividades/AD-UT1-Cuaderno-Actividades-Aula.html) · [📄 PDF A4](file:///c:/Users/capsx/Documents/trabajo/proyectos%20IA/profe-sergio/01-Modulos/Acceso-a-Datos/03-Ejercicios/UT1/01-Cuaderno-Actividades/AD-UT1-Cuaderno-Actividades-Aula.pdf) · [[AD-UT1-Cuaderno-Actividades-Aula|📝 Cuaderno Markdown]]
  - 🔒 [🌐 Guía Docente y Solucionario Explicado (HTML)](file:///c:/Users/capsx/Documents/trabajo/proyectos%20IA/profe-sergio/01-Modulos/Acceso-a-Datos/03-Ejercicios/UT1/01-Cuaderno-Actividades/AD-UT1-Cuaderno-Actividades-Aula-Profesor.html) · [📄 PDF A4](file:///c:/Users/capsx/Documents/trabajo/proyectos%20IA/profe-sergio/01-Modulos/Acceso-a-Datos/03-Ejercicios/UT1/01-Cuaderno-Actividades/AD-UT1-Cuaderno-Actividades-Aula-Profesor.pdf) · [[AD-UT1-Cuaderno-Actividades-Aula-Profesor|📝 Guía Markdown]]
- 📚 **Hojas de Ejercicios Complementarios por Bloques**:
  - `[[AD-UT1-B1-Ejercicios-Texto-NIO2]]`: Ficheros de texto, sanitización de ISO a UTF-8 y análisis forense con Streams (Solución: `[[AD-UT1-B1-Soluciones-Texto-NIO2]]`).
  - `[[AD-UT1-B2-Ejercicios-Binarios-RAF]]`: Telemetría con DataStreams, almacén in-situ con RAF y append con MiObjectOutputStream (Solución: `[[AD-UT1-B2-Soluciones-Binarios-RAF]]`).
  - `[[AD-UT1-B3-Ejercicios-XML]]`: Facturación DOM con Transformer, analizador reactivo SAX/StAX y mapeo POJO JAXB (Solución: `[[AD-UT1-B3-Soluciones-XML]]`).
- 🛠️ **Proyecto Capstone de Unidad**:
  - `[[PRAC-AD-UT1-Gestor-Ficheros-MultiFormato]]`: CLI de migración y gestión multi-formato de catálogo ([🌐 HTML](file:///c:/Users/capsx/Documents/trabajo/proyectos%20IA/profe-sergio/01-Modulos/Acceso-a-Datos/03-Ejercicios/UT1/02-Ejercicios-Complementarios/Proyecto-Capstone/PRAC-AD-UT1-Gestor-Ficheros-MultiFormato.html) · [📄 PDF A4](file:///c:/Users/capsx/Documents/trabajo/proyectos%20IA/profe-sergio/01-Modulos/Acceso-a-Datos/03-Ejercicios/UT1/02-Ejercicios-Complementarios/Proyecto-Capstone/PRAC-AD-UT1-Gestor-Ficheros-MultiFormato.pdf)).

```dataview
TABLE tipo_actividad, dificultad, tiempo_estimado_min + " min" as "Tiempo"
FROM "01-Modulos/Acceso-a-Datos/03-Ejercicios"
WHERE tipo = "ejercicio" AND ud = "UD01"
SORT file.name ASC
```

---

## ❓ Preguntas de Evaluación y Test Asociadas
```dataview
TABLE subtipo, dificultad, correcta as "Solución"
FROM "01-Modulos/Acceso-a-Datos/04-Banco-Items"
WHERE tipo = "item_evaluacion" AND ud = "UD01"
```

---

## 📦 Recursos Pesados
```dataview
TABLE formato, tamano_aprox, enlace_onedrive_drive
FROM "01-Modulos/Acceso-a-Datos/05-Recursos"
WHERE tipo = "recurso_externo" AND ud = "UD01"
```

---

## 📑 6. Documentos de Apuntes Maquetados (HTML & PDF)
- 📄 **Manual Técnico Completo y Unificado - Manejo de Ficheros (Texto, Binarios y XML)**:
  - [🌐 Versión Web Maquetada Exhaustiva (HTML)](file:///c:/Users/capsx/Documents/trabajo/proyectos%20IA/profe-sergio/01-Modulos/Acceso-a-Datos/06-Apuntes/UT1/AD-UT1-Apuntes-Manejo-Ficheros.html)
  - [📄 Documento Imprimible Oficial (PDF A4 - 1.47 MB)](file:///c:/Users/capsx/Documents/trabajo/proyectos%20IA/profe-sergio/01-Modulos/Acceso-a-Datos/06-Apuntes/UT1/AD-UT1-Apuntes-Manejo-Ficheros.pdf)

---

## 🖥️ 7. Diapositivas y Presentación de Aula
- 📽️ **Presentación Oficial de Teoría (Tema Claro Institucional · 22 Diapositivas)**:
  - [🚀 Presentación Interactiva Web (HTML 16:9)](file:///c:/Users/capsx/Documents/trabajo/proyectos%20IA/profe-sergio/01-Modulos/Acceso-a-Datos/07-Presentaciones/UT1/AD-UT1-Pres-Teoria-Ficheros.html)
  - [📄 Documento para Proyección / Impresión (PDF Apaisado A4)](file:///c:/Users/capsx/Documents/trabajo/proyectos%20IA/profe-sergio/01-Modulos/Acceso-a-Datos/07-Presentaciones/UT1/AD-UT1-Pres-Teoria-Ficheros.pdf)
