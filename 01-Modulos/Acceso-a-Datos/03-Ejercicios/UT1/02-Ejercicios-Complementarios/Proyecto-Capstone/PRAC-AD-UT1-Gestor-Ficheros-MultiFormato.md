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

## 💻 Entorno de Desarrollo y Política de Inteligencia Artificial
- **Entorno Oficial de Aula**: Eclipse IDE 2024 / 2025 (Java SE 21 LTS). Se admite IntelliJ IDEA o VS Code con compatibilidad Maven.
- **Regulación de IA (1ª Evaluación)**: Permitida exclusivamente como herramienta de consulta o depuración de errores conceptuales. No recomendada en la elaboración directa de la práctica para asegurar la soltura individual requerida en los exámenes. El profesor podrá exigir defensa técnica oral individual del código entregado.

---

## 📊 Rúbrica Analítica de Evaluación (Total: 10.0 Puntos)

| Criterio / Ponderación | Excelente (100%) | Notable (75%) | Aprobado (50%) | Insuficiente (<50%) |
| :--- | :--- | :--- | :--- | :--- |
| **1. Ficheros de Texto y NIO.2**<br>`[2.0 Puntos]` · *CE1.a, CE1.b* | Lectura con `Files.newBufferedReader` y `StandardCharsets.ISO_8859_1`; validación exhaustiva y volcado a `errores_csv.log` con formato riguroso. | Lee y normaliza el CSV correctamente. Detecta líneas erróneas con log básico. | Lee en UTF-8 sin controlar codificaciones conflictivas o interrumpe la ejecución ante registros corruptos. | No utiliza buffers, fallos graves en `split` o incapacidad de leer el archivo CSV. |
| **2. Persistencia Binaria, RAF y Serialización**<br>`[3.0 Puntos]` · *CE1.c, CE1.d* | Tipos con `DataStreams`; cálculo matemático exacto de offsets (`seek()`, registros fijos 56B) en RAF; serialización con `serialVersionUID`, `transient` y `MiObjectOutputStream` sin corrupción. | Escritura binaria y serialización correctas; actualización RAF funcional con pequeñas imprecisiones o ausencia de `transient`. | Escritura binaria básica; actualiza reescribiendo el archivo completo en lugar de `seek()` in-situ, o falla en append de objetos. | Ficheros corruptos por orden incorrecto de lectura, o no implementa `Serializable`. |
| **3. Ecosistema XML (DOM, Transformer y SAX/StAX)**<br>`[3.0 Puntos]` · *CE1.e* | Construcción DOM limpia con `Transformer` sangrado (pretty-print); consultas precisas esquivando nodos `#text`; procesador reactivo SAX o Pull StAX funcional. | Genera XML formateado y ejecuta consultas DOM correctas. Parser reactivo con advertencias leves. | Genera XML sin sangría legible y la consulta DOM falla ante saltos de línea al no validar `ELEMENT_NODE`; sin SAX/StAX. | Documento XML mal formado o colapso del programa ante parseo de nodos. |
| **4. Arquitectura, Clean Code y Excepciones**<br>`[2.0 Puntos]` · *CE1.a, Calidad* | Estructura modular perfecta en paquetes; uso riguroso de `try-with-resources`; menú CLI interactivo y captura diferenciada de excepciones. | Código limpio y empaquetado adecuado; gestión segura de flujos; menú funcional con gestión genérica de excepciones. | Clases concentradas en un único paquete o método monolítico; cierre manual sin `try-with-resources`. | Fugas masivas de recursos, código no compila o excepciones no controladas en consola. |
| **Puntuación Total Máxima** | | | | **10.0 PUNTOS** |

---

## 📦 Documentos y Entregables
- 🌐 **[Versión Maquetada para Aula (HTML)](file:///c:/Users/capsx/Documents/trabajo/proyectos%20IA/profe-sergio/01-Modulos/Acceso-a-Datos/03-Ejercicios/UT1/PRAC-AD-UT1-Gestor-Ficheros-MultiFormato.html)**
- 📄 **[Documento Imprimible en PDF (A4)](file:///c:/Users/capsx/Documents/trabajo/proyectos%20IA/profe-sergio/01-Modulos/Acceso-a-Datos/03-Ejercicios/UT1/PRAC-AD-UT1-Gestor-Ficheros-MultiFormato.pdf)**
- Repositorio Git o archivo comprimido `Apellido1_Apellido2_Nombre_UT1_Catálogo.zip` con el proyecto estándar.
- Carpeta `data/` con datos de prueba generados.
- Memoria técnica breve (`README.md`) detallando la estructura y fórmula de offsets.
