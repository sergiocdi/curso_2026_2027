---
tipo: ejercicio
modulo: "Acceso a Datos"
ud: "UD01"
ra_asociados: ["RA1"]
ce_asociados: ["CE1.a", "CE1.b", "CE1.c", "CE1.d", "CE1.e"]
tipo_actividad: practica_afianzamiento
dificultad: media
tiempo_estimado_min: 180
rubrica: "[[Rubrica-Practicas-Programacion]]"
---

# 🚀 Práctica de Afianzamiento UT1: CLI de Migración y Gestión Multi-Formato de Catálogo

> **Módulo**: [[MOC-Acceso-a-Datos|Acceso a Datos]] | **UD**: [[UD01-Manejo-de-Ficheros|UD01 / UT1]] | **RAs**: `RA1 (CE1.a al CE1.e)` | **Tiempo**: `180 min (3 sesiones)` | **Carácter**: `Formativo (No evaluable numéricamente - Afianzamiento previo a examen)`

---

## 🎯 Contexto del Proyecto

Una empresa de comercio electrónico local está modernizando su catálogo de productos. Actualmente disponen de datos dispersos en tres formatos incompatibles originados por diferentes terminales:
1. Archivos de texto plano delimitados por comas (`CSV`) exportados desde terminales punto de venta.
2. Archivos binarios propietarios de alta velocidad con transacciones de almacén (`.dat`).
3. Documentos de intercambio estándar `XML` para sincronización con proveedores externos.

Tu misión técnica consiste en construir una **herramienta de consola en Java** que consolide, filtre y transforme los datos entre estos tres formatos garantizando la integridad de los ficheros y un manejo riguroso de excepciones.

---

## 📋 Requerimientos Funcionales

El programa se ejecutará mediante un menú interactivo por consola con las siguientes opciones:

### 1. Ingesta y Limpieza de Fichero de Texto (CSV)
- Leer un archivo `data/productos_import.csv` (formato: `id,referencia,categoria,precio,stock`).
- Validar cada línea: descartar líneas corruptas o incompletas y volcar los errores a un log `data/errores_csv.log` indicando número de línea y causa.
- Cargar los productos válidos en una colección en memoria.

### 2. Exportación / Importación Binaria
- **Exportar a binario (`DataOutputStream`)**: Escribir los productos válidos en un fichero compacto `data/catalogo.dat`.
- **Acceso Aleatorio (`RandomAccessFile`)**: Permitir consultar o actualizar el stock de un producto directamente por su ID/posición física sin recorrer todo el fichero.
- **Copia de seguridad serializada (`ObjectOutputStream`)**: Exportar la lista completa de objetos `Producto` a `data/backup_catalogo.ser`, asegurando que atributos no exportables (por ejemplo, `costeInternoProveedor`) queden protegidos mediante `transient`.

### 3. Generación y Consulta de Catálogo XML (DOM)
- **Exportar a XML**: Generar a partir del catálogo en memoria un archivo bien estructurado `data/catalogo.xml`:
  ```xml
  <?xml version="1.0" encoding="UTF-8"?>
  <catalogo fecha="2026-10-15">
    <producto id="PROD-101" categoria="Informatica">
      <referencia>PORT-ASUS-16</referencia>
      <precio moneda="EUR">799.99</precio>
      <stock>14</stock>
    </producto>
  </catalogo>
  ```
- **Consulta DOM**: Implementar una función que filtre en `data/catalogo.xml` todos los productos de una categoría y muestre el stock acumulado de la misma.

---

## 🛠️ Requisitos Técnicos y de Calidad
1. **Manejo Seguro de E/S**: Empleo obligatorio de `try-with-resources` para evitar fugas de descriptores de fichero.
2. **Jerarquías de Clases y Enrutamiento**: Usar `java.nio.file.Path` y `Files` para verificar existencia, permisos y creación de carpetas.
3. **Manejo de Errores**: Capturar de manera diferenciada `FileNotFoundException`, `EOFException`, `InvalidClassException`, `ParserConfigurationException` y `TransformerException`.
4. **Clean Code**: Separación clara entre modelos (`Producto`), servicios de persistencia (`FicheroTextoService`, `FicheroBinarioService`, `FicheroXmlService`) y la capa de interfaz de usuario (`AppConsola`).

---

## 📊 Guía de Autoevaluación y Rúbrica Formativa de Competencias (RA1)
> Esta rúbrica permite al alumno comprobar su nivel de dominio antes de la prueba escrita/práctica de evaluación.

| Indicador de Dominio Técnico | Nivel Esperado para el Examen |
| :--- | :--- |
| **CE1.a / CE1.b: Ficheros de Texto** | Lectura y escritura con búfer sin fallos; filtrado robusto de líneas erróneas con log detallado. |
| **CE1.c: Persistencia Binaria** | Manejo impecable de tipos primitivos (`DataStreams`), acceso directo o serialización con `serialVersionUID` y `transient`. |
| **CE1.d / CE1.e: XML y DOM** | Generación de XML bien formado con indentación correcta y consultas DOM precisas filtrando por nodos elemento. |
| **Arquitectura, excepciones y código limpio** | Uso consistente de `try-with-resources`, paquetes ordenados y ausencia de bloqueos de ficheros. |

---

## 📦 Entregables
- Repositorio Git o archivo comprimido `.zip` con el proyecto Maven/Java estándar.
- Carpeta `data/` de prueba con datos de ejemplo en los tres formatos.
- Memoria breve (1-2 páginas o README en Markdown) detallando la estructura del proyecto y ejemplos de ejecución.
