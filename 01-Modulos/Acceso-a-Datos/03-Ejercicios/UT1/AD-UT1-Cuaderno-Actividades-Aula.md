---
tipo: ejercicio
modulo: "Acceso a Datos"
ud: "UD01"
ra_asociados: ["RA1"]
ce_asociados: ["CE1.a", "CE1.b", "CE1.c", "CE1.d", "CE1.e"]
tipo_actividad: cuaderno_aula
dificultad: progresiva
tiempo_estimado_min: 180
entregable: proyecto_eclipse
estado: listo
---

# 📓 Cuaderno de Actividades de Aula: UT1 Manejo de Ficheros

> **Módulo**: [[MOC-Acceso-a-Datos|Acceso a Datos]] | **Ciclo**: DAM2 | **Docente**: Sergio Capdevila Díez
> **Documento Adjunto a la Presentación y Apuntes**: Trabajo práctico síncrono en directo mientras el docente explica la unidad.

---

## 🎯 Instrucciones de Trabajo en el Aula
Este cuaderno contiene actividades guiadas paso a paso organizadas en estricta sincronía con las diapositivas de clase y los apuntes de la unidad.
Cada vez que en la presentación aparezca el aviso:
> **💻 Práctica en Vivo en Aula: Actividad X.Y**

El alumnado detendrá la toma de notas teóricas, abrirá su entorno de desarrollo (Eclipse IDE / IntelliJ con Java 21) y desarrollará la actividad correspondiente en el proyecto de clase `UT01_ManejoFicheros`.

---

## 🔤 BLOQUE 1: Ficheros de Texto Plano (java.io y Java NIO.2)

### 📌 Actividad 1.1: Diagnóstico de Charset y Conversión ISO-8859-1 a UTF-8
- **Momento de clase**: Tras explicar la diapositiva 3 (Charsets, UTF-8 y Mojibake).
- **Objetivo**: Detectar fallos de codificación y convertir un fichero sin perder tildes ni caracteres especiales.
- **Supuesto**: Se dispone de un fichero `usuarios_legacy.txt` generado en Windows con codificación `ISO-8859-1`.
- **Tareas**:
  1. Abrir el fichero especificando `StandardCharsets.ISO_8859_1` con `BufferedReader`.
  2. Leer su contenido y escribirlo en `usuarios_utf8.txt` utilizando `StandardCharsets.UTF_8` con `BufferedWriter`.
  3. Verificar abriendo en el editor que palabras como "Administración", "Diseño" y "Año" se visualizan nítidas sin caracteres extraños.

```java
// Código de partida: Actividad1_1_Charset.java
Path origen = Path.of("datos", "usuarios_legacy.txt");
Path destino = Path.of("datos", "usuarios_utf8.txt");
// TODO: Implementar la copia convirtiendo el juego de caracteres
```

---

### 📌 Actividad 1.2: Filtrado y Normalización con BufferedReader y BufferedWriter
- **Momento de clase**: Tras explicar la diapositiva 4 (Patrón Decorador y Buffers).
- **Objetivo**: Procesar líneas omitiendo comentarios y líneas en blanco.
- **Tareas**:
  1. Leer `config.ini` línea a línea con `br.readLine()`.
  2. Si la línea empieza por `#` o está vacía (`isBlank()`), descartarla.
  3. Escribir las líneas válidas en mayúsculas en `config_clean.ini` usando `bw.newLine()`.

---

### 📌 Actividad 1.3: Generador de Informe Formateado con PrintWriter
- **Momento de clase**: Tras explicar la diapositiva 5 (Escritura y Formateo con PrintWriter).
- **Objetivo**: Generar una tabla de facturación con alineación de columnas.
- **Tareas**:
  1. Instanciar `PrintWriter` sobre `factura.txt`.
  2. Usar `pw.printf("%-12s %-25s %8.2f€%n", ...)` para imprimir cabecera y 3 líneas de artículos.
  3. Comprobar que los importes quedan perfectamente alineados a la derecha.

---

### 📌 Actividad 1.4: Operaciones Instantáneas con Java NIO.2 (Files)
- **Momento de clase**: Tras explicar la diapositiva 6 (API Moderna NIO.2: Paths y Files).
- **Objetivo**: Persistir y leer configuraciones atómicas en una sola línea de código.
- **Tareas**:
  1. Definir un `String config = "puerto=9000\ndatabase=test_db\nssl=enabled";`.
  2. Guardarlo en `app.properties` con `Files.writeString()` usando `StandardOpenOption.CREATE`.
  3. Recuperarlo en una variable con `Files.readString()` e imprimir su longitud.

---

### 📌 Actividad 1.5: Filtrado de Logs Masivos con Files.lines() (Stream Reactivo)
- **Momento de clase**: Tras explicar la diapositiva 7 (Procesamiento masivo sin OutOfMemoryError).
- **Objetivo**: Extraer incidencias críticas de un fichero de log simulado sin cargarlo entero en memoria RAM.
- **Tareas**:
  1. Abrir un log con `Files.lines(Path)`.
  2. Aplicar un filtro para localizar líneas que contengan `[ERROR]`.
  3. Imprimir el total de errores y escribir los 10 primeros en `alertas.txt`.

---

## 🔢 BLOQUE 2: Ficheros Binarios y Serialización de Objetos

### 📌 Actividad 2.1: Telemetría de Sensores con DataOutputStream
- **Momento de clase**: Tras explicar la diapositiva 9 (DataStreams y Tipos Primitivos).
- **Objetivo**: Guardar datos de mediciones industriales en binario estricto.
- **Tareas**:
  1. Crear `telemetria.dat` con `DataOutputStream`.
  2. Escribir 3 sensores: ID (`int`), Nombre (`writeUTF`), Temperatura (`double`) y Alarma (`boolean`).
  3. Comprobar con el explorador de archivos que el tamaño en disco es mínimo e ilegible en un bloc de notas.

---

### 📌 Actividad 2.2: Detección Limpia de Fin de Archivo con EOFException
- **Momento de clase**: Tras explicar la diapositiva 10 (Trampa de Examen: EOFException).
- **Objetivo**: Leer un fichero binario secuencial hasta el final sin corromper la ejecución.
- **Tareas**:
  1. Abrir `telemetria.dat` con `DataInputStream`.
  2. Implementar un bucle `while (true)` que lea los 4 campos en el orden exacto.
  3. Capturar `EOFException` para finalizar imprimiendo "Lectura completada con éxito".

---

### 📌 Actividad 2.3: Modificación Directa con RandomAccessFile (RAF)
- **Momento de clase**: Tras explicar las diapositivas 11 y 12 (RAF, File Pointer y Registros Fijos).
- **Objetivo**: Actualizar el saldo de un empleado específico sin leer ni reescribir los demás registros.
- **Supuesto**: Registros de 36 bytes (ID: 4B, Apellido: 20B, Dep: 4B, Salario: 8B).
- **Tareas**:
  1. Crear un archivo `empleados.dat` con 3 registros.
  2. Implementar `modificarSalario(int numRegistro, double nuevoSalario)` calculando `offset = (numRegistro * 36) + 28`.
  3. Ejecutar `raf.seek(offset)` y `raf.writeDouble(nuevoSalario)`.
  4. Leer el registro modificado y comprobar que los demás datos permanecen intactos.

---

### 📌 Actividad 2.4: Serialización de Objetos con Campos Transient
- **Momento de clase**: Tras explicar la diapositiva 13 (Serializable, serialVersionUID y transient).
- **Objetivo**: Persistir instancias completas en disco ocultando credenciales sensibles.
- **Tareas**:
  1. Crear la clase `Usuario` con `implements Serializable`, `serialVersionUID = 1L;` y atributo `transient String tokenSesion`.
  2. Serializar 2 usuarios en `usuarios.bin` con `ObjectOutputStream.writeObject()`.
  3. Deserializarlos con `ObjectInputStream.readObject()` y constatar que `tokenSesion` recupera el valor `null`.

---

### 📌 Actividad 2.5 (El Gran Reto): Persistencia Incremental sin StreamCorruptedException
- **Momento de clase**: Tras explicar las diapositivas 14 y 15 (El problema del Append y MiObjectOutputStream).
- **Objetivo**: Añadir objetos a un archivo existente sin corromper la cabecera del stream.
- **Tareas**:
  1. Crear la clase `MiObjectOutputStream extends ObjectOutputStream` sobrescribiendo `writeStreamHeader()` para no hacer nada.
  2. Desarrollar el método `guardarUsuario(Usuario u)` que use `ObjectOutputStream` si el fichero mide 0 bytes, o `MiObjectOutputStream` si ya contiene datos.
  3. Añadir 3 usuarios en 3 ejecuciones separadas del programa.
  4. Leer todos los usuarios secuencialmente en un bucle y verificar que ya **no se produce** el error `StreamCorruptedException: invalid type code: AC`.

---

## 🌳 BLOQUE 3: Ficheros XML (DOM, SAX, StAX y JAXB)

### 📌 Actividad 3.1: Consulta y Modificación de Catálogo con DOM
- **Momento de clase**: Tras explicar la diapositiva 17 (DOM y árbol de nodos en RAM).
- **Objetivo**: Parsear `catalogo.xml`, navegar por las etiquetas `<producto>` y subir los precios un 10%.
- **Tareas**:
  1. Cargar el documento con `DocumentBuilder.parse()`.
  2. Normalizar con `doc.getDocumentElement().normalize()`.
  3. Recorrer `getElementsByTagName("producto")`, ignorando nodos que no sean `ELEMENT_NODE`.
  4. Modificar el texto del nodo `<precio>` multiplicándolo por 1.10.

---

### 📌 Actividad 3.2: Generación de XML y Volcado Formateado con Transformer
- **Momento de clase**: Tras explicar la diapositiva 18 (Creación y Transformer con sangría).
- **Objetivo**: Crear un XML desde código Java y volcarlo a disco con indentación bonita (*pretty print*).
- **Tareas**:
  1. Crear un `Document` nuevo con `builder.newDocument()`.
  2. Añadir raíz `<alumnos>` y dos hijos `<alumno>` con atributo `expediente` y etiquetas `<nombre>` y `<nota>`.
  3. Configurar `Transformer` con `OutputKeys.INDENT = "yes"` y sangría de 4 espacios, volcando el resultado en `alumnos.xml`.

---

### 📌 Actividad 3.3: Analizador Reactivo sin Memoria con SAX
- **Momento de clase**: Tras explicar la diapositiva 19 (SAX y procesamiento por eventos push).
- **Objetivo**: Calcular la media de precios de un catálogo XML sin construir ningún árbol en RAM.
- **Tareas**:
  1. Crear una clase que extienda `DefaultHandler`.
  2. Acumular texto en `characters()` con `StringBuilder`.
  3. En `endElement()`, cuando la etiqueta sea `precio`, sumar el valor y aumentar el contador.
  4. En `endDocument()`, imprimir la media final calculada.

---

### 📌 Actividad 3.4: Mapeo Declarativo Objeto-XML con JAXB
- **Momento de clase**: Tras explicar la diapositiva 20 (StAX y JAXB).
- **Objetivo**: Serializar y deserializar objetos Java directamente a XML sin manipular nodos.
- **Tareas**:
  1. Crear la clase `Curso` con `@XmlRootElement` y `@XmlElement`.
  2. Instanciar un `Marshaller` con `JAXB_FORMATTED_OUTPUT = true` y guardar el objeto en `curso.xml`.
  3. Cargar el XML resultante con `Unmarshaller` imprimiendo el objeto Java recuperado.
