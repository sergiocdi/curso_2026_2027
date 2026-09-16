---
tipo: concepto
modulo: "Acceso a Datos"
ud: "UD01"
ra_asociados: ["RA1"]
tags: [concepto, java, texto, nio2, streams, bufferedreader, printwriter]
dificultad: basica
estado: revisado
---

# 💡 Concepto: Lectura y Escritura de Ficheros de Texto (java.io y java.nio.2)

> **Módulo**: [[MOC-Acceso-a-Datos|Acceso a Datos]] | **UD**: [[UD01-Manejo-de-Ficheros|UD01 / UT1]] | **RA**: [[RA01-Manejo-Ficheros|RA1]]

---

## 👨‍🏫 Introducción del Profesor: ¿Por qué Ficheros de Texto Plano?
En cualquier sistema informático profesional, los **ficheros de texto plano** (extensiones `.txt`, `.csv`, `.log`, `.json`, `.xml`, `.properties`) representan el estándar universal para la interoperabilidad humana y de software.
A diferencia de los ficheros binarios, un fichero de texto codifica información mediante caracteres legibles organizados en secuencias de líneas. Sin embargo, en el desarrollo en Java surgen tres preguntas críticas que todo programador de FP debe dominar:
1. ¿Cómo se representan internamente los caracteres en disco? (**Juegos de caracteres y codificación**).
2. ¿Cómo evitamos colapsar el disco físico con accesos lentos? (**Patrón decorador y Buffers de memoria**).
3. ¿Qué herramientas ofrece el ecosistema moderno de Java para procesar texto de forma concisa y segura? (**Java NIO.2 y la clase `Files`**).

---

## 🔤 1. Codificación de Caracteres y Charsets

En memoria RAM, Java almacena los caracteres (`char` y `String`) utilizando **UTF-16** (16 bits por carácter). Sin embargo, al persistir los datos en un disco duro o transmitirlos por red, los caracteres deben transformarse en secuencias de bytes según una tabla de codificación (**Charset**):

- **ASCII**: 7 bits (128 caracteres). Insuficiente para caracteres no ingleses (carece de tildes, 'ñ', etc.).
- **ISO-8859-1 (Latin-1)**: 8 bits (256 caracteres). Histórico en Windows y Europa Occidental. Si se abre un archivo con caracteres especiales en una máquina configurada con otro charset, se produce el temido fenómeno *Mojibake* (ej. "aÃ±o" en vez de "año").
- **UTF-8 (Estándar de la Industria)**: Longitud variable (de 1 a 4 bytes por carácter). Es compatible hacia atrás con ASCII (1 byte para caracteres básicos en inglés) y utiliza 2 o más bytes para tildes, caracteres cirílicos, asiáticos o emojis.

> [!WARNING]
> **El gran error de aula**: Instanciar `new FileReader("archivo.txt")` sin indicar el juego de caracteres asume por defecto `Charset.defaultCharset()`. Si el código se compila y prueba en Windows (a menudo `windows-1252` en versiones antiguas) y luego se despliega en un servidor Linux en la nube (`UTF-8`), la lectura de tildes y eñes fallará estrepitosamente.
> **Regla de oro**: Especificar siempre explícitamente `StandardCharsets.UTF_8`.

---

## 🧱 2. Enfoque Clásico (`java.io`): Jerarquía de Flujos de Caracteres

La biblioteca clásica `java.io` separa estrictamente los flujos de bytes (`InputStream`/`OutputStream`) de los flujos de caracteres (`Reader`/`Writer`).

### 2.1 El Patrón Decorador y la Necesidad de Buffers
Acceder al disco físico o al SSD para leer o escribir un único carácter requiere una interrupción del sistema operativo y una operación de entrada/salida (*I/O Call*) extremadamente costosa en tiempo de CPU.
Para optimizar esto, Java implementa el **patrón Decorador**:
- `FileReader` / `FileWriter`: Se encargan de la conexión física básica con el archivo en disco.
- `BufferedReader` / `BufferedWriter`: Envoltorios (*wrappers*) que interponen un buffer en memoria RAM (por defecto de 8 KB). Leen o escriben bloques grandes de golpe en disco y entregan al programador los datos línea a línea desde la memoria ultra-rápida.

```
[ Disco Físico ] <---> [ FileReader (Bytes a Caracteres) ] <---> [ BufferedReader (Buffer 8KB en RAM) ] <---> [ Tu Código Java ]
```

### 2.2 Lectura de Ficheros Línea a Línea con `BufferedReader`

El método estrella es `readLine()`, el cual lee una línea completa omitiendo los caracteres de fin de línea (`\n` o `\r\n`) y retorna `null` cuando alcanza el fin del fichero (*EOF - End of File*).

```java
import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.nio.charset.StandardCharsets;

public class LectorTextoClasico {
    public static void leerFichero(String rutaFichero) {
        // Uso obligatorio de try-with-resources (cierre automático de recursos)
        try (BufferedReader br = new BufferedReader(new FileReader(rutaFichero, StandardCharsets.UTF_8))) {
            String linea;
            int numeroLinea = 1;
            while ((linea = br.readLine()) != null) {
                System.out.printf("[%04d] %s%n", numeroLinea++, linea);
            }
        } catch (IOException e) {
            System.err.println("Error de I/O al procesar el archivo: " + e.getMessage());
        }
    }
}
```

### 2.3 Escritura Eficiente con `BufferedWriter` y `PrintWriter`

Para escribir texto disponemos de dos herramientas complementarias:
1. `BufferedWriter`: Ofrece alto rendimiento, el método `write(String)` y el método portable `newLine()` (que inserta el salto de línea adecuado según el sistema operativo: `\r\n` en Windows o `\n` en Linux/macOS).
2. `PrintWriter`: Envoltorio de conveniencia que implementa los métodos `print()`, `println()` y `printf()`, facilitando el volcado de datos formateados sin necesidad de conversiones manuales a `String`.

```java
import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.charset.StandardCharsets;

public class EscritorTextoClasico {
    
    // Método 1: Uso de BufferedWriter para escritura pura
    public static void escribirConBuffer(String ruta, String[] lineas, boolean append) {
        // Si append es true, no sobrescribe el archivo sino que añade al final
        try (BufferedWriter bw = new BufferedWriter(new FileWriter(ruta, StandardCharsets.UTF_8, append))) {
            for (String linea : lineas) {
                bw.write(linea);
                bw.newLine(); // Inserta salto de línea multiplataforma
            }
            // bw.flush(); // No estrictamente necesario aquí porque try-with-resources hace close(), que fuerza el flush
        } catch (IOException e) {
            System.err.println("Error al escribir: " + e.getMessage());
        }
    }

    // Método 2: Uso de PrintWriter para formateo avanzado (facturas, informes, tablas)
    public static void generarInforme(String ruta) {
        try (PrintWriter pw = new PrintWriter(new FileWriter(ruta, StandardCharsets.UTF_8, false))) {
            pw.println("==========================================");
            pw.println("        REPORTE DE INVENTARIO CIFP        ");
            pw.println("==========================================");
            pw.printf("%-10s %-20s %10s%n", "CODIGO", "PRODUCTO", "PRECIO (€)");
            pw.println("------------------------------------------");
            pw.printf("%-10s %-20s %10.2f%n", "ART-001", "Teclado Mecánico", 45.99);
            pw.printf("%-10s %-20s %10.2f%n", "ART-002", "Monitor 27 Pulgadas", 189.50);
            pw.println("==========================================");
        } catch (IOException e) {
            System.err.println("Error al generar informe: " + e.getMessage());
        }
    }
}
```

---

## 🚀 3. Enfoque Moderno: Java NIO.2 (`java.nio.file`)

Introducido a partir de Java 7 y perfeccionado en versiones posteriores (Java 11+ y Java 21), la API **NIO.2 (New I/O)** reemplaza la vetusta clase `java.io.File` por las interfaces `Path` y la clase utilitaria `java.nio.file.Files`.

### 3.1 Ventajas de NIO.2
- Tratamiento exhaustivo de excepciones con información real del sistema operativo (`NoSuchFileException`, `AccessDeniedException`).
- Operaciones atómicas y soporte avanzado de atributos del sistema de ficheros (permisos POSIX, enlaces simbólicos).
- Código infinitamente más limpio, expresivo y menos propenso a errores de liberación de recursos.

### 3.2 Operaciones Directas en Memoria: `readString()` y `writeString()` (Java 11+)
Ideales para archivos de configuración pequeños o medianos (hasta unos pocos megabytes) que pueden residir cómodamente en memoria RAM en un único paso:

```java
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardOpenOption;
import java.util.List;

public class ManejadorTextoNIO2 {

    public static void operacionesRapidas() throws IOException {
        Path ruta = Paths.get("datos", "servidor.cfg");

        // 1. Asegurar la existencia del directorio padre
        if (ruta.getParent() != null && !Files.exists(ruta.getParent())) {
            Files.createDirectories(ruta.getParent());
        }

        // 2. Escritura directa de un String completo en UTF-8
        String configuracion = "puerto=8080\nhost=localhost\nssl=true\n";
        Files.writeString(ruta, configuracion, StandardCharsets.UTF_8, 
                          StandardOpenOption.CREATE, StandardOpenOption.TRUNCATE_EXISTING);

        // 3. Lectura directa del archivo completo a un String
        String contenido = Files.readString(ruta, StandardCharsets.UTF_8);
        System.out.println("Configuración leída:\n" + contenido);

        // 4. Lectura de todas las líneas en una lista
        List<String> lineas = Files.readAllLines(ruta, StandardCharsets.UTF_8);
        System.out.println("Total líneas leídas: " + lineas.size());
    }
}
```

### 3.3 Procesamiento Masivo con Streams Funcionales: `Files.lines()`
Cuando nos enfrentamos a ficheros masivos (ej. archivos de log de servidores web de 500 MB o varios GB), utilizar `readAllLines()` provocaría un error fatal `java.lang.OutOfMemoryError`, ya que intenta alojar todas las líneas simultáneamente en memoria.

La solución profesional es `Files.lines(Path)`, que retorna un `Stream<String>` evaluado de forma **perezosa (lazy evaluation)**: las líneas se leen de disco una a una a medida que el pipeline del Stream las procesa.

```java
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.stream.Stream;

public class AnalizadorLogsMasivos {

    public static void filtrarErroresCriticos(String rutaLog) {
        Path path = Paths.get(rutaLog);

        // ¡IMPORTANTE! El Stream debe abrirse dentro de un try-with-resources porque mantiene un descriptor de archivo abierto
        try (Stream<String> lineas = Files.lines(path)) {
            long totalErrores = lineas
                .filter(linea -> linea.contains("[ERROR]") || linea.contains("[FATAL]"))
                .peek(System.out::println) // Muestra cada error filtrado por consola
                .count();

            System.out.println("Total de incidencias críticas detectadas: " + totalErrores);
        } catch (IOException e) {
            System.err.println("Error procesando log masivo: " + e.getMessage());
        }
    }
}
```

---

## ⚠️ Trampas Habituales y Buenas Prácticas para Evaluaciones

| Situación | Error Típico del Alumnado | Solución Profesional |
| :--- | :--- | :--- |
| **Cierre de recursos** | Cerrar el flujo dentro de un bloque `finally` manual con `flujo.close()`, arriesgando un nuevo `IOException`. | Usar siempre `try-with-resources`. Garantiza el cierre automático seguro. |
| **Pérdida de datos en disco** | El programa termina y el fichero de salida queda en 0 KB o incompleto. | Ocurre por no vaciar el buffer (`flush()`). El cierre correcto (`close()`) lo ejecuta automáticamente. |
| **Codificación de texto** | No especificar `Charset` y sufrir errores de visualización en producción con tildes o símbolos de euro. | Pasar siempre `StandardCharsets.UTF_8` en constructores y métodos utilitarios. |
| **Ficheros gigantescos** | Usar `Files.readAllLines()` en un fichero de 2 GB y provocar `OutOfMemoryError`. | Utilizar `Files.lines(path)` en un `try-with-resources` procesando línea a línea. |
| **Rutas relativas fijas** | Escribir `"C:\\usuarios\\sergio\\archivo.txt"` rompiendo la portabilidad en Linux o en el ordenador del profesor. | Usar rutas relativas con `Path.of("subcarpeta", "archivo.txt")` o `Paths.get(...)`. |
