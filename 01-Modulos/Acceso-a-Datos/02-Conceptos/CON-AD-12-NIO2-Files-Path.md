---
tipo: concepto
modulo: "Acceso a Datos"
ud: "UD01"
ra_asociados: ["RA1"]
tags: [concepto, java, nio2, files, path, streams]
dificultad: basica
estado: revisado
---

# 💡 Concepto: Manejo Moderno de Ficheros de Texto con Java NIO.2 (`Files` y `Path`)

> **Módulo**: [[MOC-Acceso-a-Datos|Acceso a Datos]] | **UD**: [[UD01-Manejo-de-Ficheros|UD01 / UT1]] | **RA**: [[RA01-Manejo-Ficheros|RA1]]

---

## 📌 1. De `java.io.File` a la API Moderna NIO.2 (`java.nio.file`)

Durante años, Java utilizó la clase `java.io.File`. Aunque funcional, presentaba severas limitaciones:
- Muchos métodos devolvían un simple booleano (`false`) en caso de fallo sin explicar el motivo (¿permisos denegados?, ¿disco lleno?, ¿archivo inexistente?).
- No ofrecía soporte eficiente para enlaces simbólicos ni atributos de seguridad del sistema operativo.
- El renombramiento y copiado de ficheros exigía escribir bucles manuales de lectura y escritura de bytes.

Desde **Java 7 (NIO.2)**, el acceso al sistema de ficheros se modernizó a través de:
1. **`Path` y `Paths`**: Representación abstracta e inmutable de una ruta en el sistema de archivos (jerarquía de nombres y separadores del SO).
2. **`Files`**: Colección de métodos estáticos de alto nivel para realizar operaciones atómicas, lecturas rápidas, escrituras y consultas de metadatos.

---

## 💻 2. Rutas con `Path` y `Paths.get()`

```java
import java.nio.file.Path;
import java.nio.file.Paths;

public class EjemploRutas {
    public static void main(String[] args) {
        // Creación independiente del sistema operativo (Windows o Linux/Mac)
        Path rutaRelativa = Paths.get("data", "config", "parametros.txt");
        Path rutaAbsoluta = rutaRelativa.toAbsolutePath().normalize();

        System.out.println("Ruta normalizada: " + rutaAbsoluta);
        System.out.println("Nombre del fichero: " + rutaRelativa.getFileName());
        System.out.println("Directorio padre: " + rutaRelativa.getParent());
    }
}
```

---

## 🚀 3. Operaciones Rápidas con `java.nio.file.Files`

### A. Lectura Completa a Lista o String (Ficheros Pequeños / Medianos)
Para ficheros de configuración, CSVs pequeños o documentos que quepan holgadamente en la RAM:

```java
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.charset.StandardCharsets;
import java.util.List;

public class LecturaNIO {
    public static void main(String[] args) throws Exception {
        Path ruta = Paths.get("datos.txt");

        // 1. Leer todas las líneas de golpe en una List<String> con UTF-8
        List<String> lineas = Files.readAllLines(ruta, StandardCharsets.UTF_8);
        lineas.forEach(System.out::println);

        // 2. Leer todo el archivo como un único String (Java 11+)
        String contenido = Files.readString(ruta, StandardCharsets.UTF_8);
        System.out.println("Longitud total en caracteres: " + contenido.length());
    }
}
```

### B. Lectura Eficiente de Ficheros Grandes mediante Streams (`Files.lines()`)
Para ficheros extensos (gigabytes de logs), `readAllLines()` provocaría un `OutOfMemoryError`. La solución óptima es procesar un flujo reactivo perezoso (*lazy*):

```java
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.stream.Stream;

public class LectorLogsMasivos {
    public static void procesarLogs(Path logPath) throws Exception {
        // try-with-resources garantiza el cierre del descriptor del sistema operativo
        try (Stream<String> lineas = Files.lines(logPath)) {
            long errores404 = lineas
                .filter(linea -> linea.contains(" 404 "))
                .peek(System.out::println) // Inspección
                .count();

            System.out.println("Total de accesos 404: " + errores404);
        }
    }
}
```

### C. Escritura Directa
```java
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardOpenOption;
import java.util.List;

public class EscrituraNIO {
    public static void main(String[] args) throws Exception {
        Path salida = Paths.get("resultado.txt");

        List<String> registros = List.of("ID-01;OK", "ID-02;ERROR", "ID-03;OK");

        // Sobrescribe o crea el archivo si no existe
        Files.write(salida, registros);

        // O añadir al final (Append)
        Files.writeString(salida, "\nID-04;PENDIENTE", StandardOpenOption.APPEND);
    }
}
```

---

## 🛠️ 4. Inspección de Metadatos y Manipulación

```java
Path ruta = Paths.get("datos.txt");

boolean existe = Files.exists(ruta);
boolean esDirectorio = Files.isDirectory(ruta);
boolean esLegible = Files.isReadable(ruta);
long bytes = Files.size(ruta);

// Crear directorios intermedios si no existen
Path dirLogs = Paths.get("logs", "2026", "septiembre");
Files.createDirectories(dirLogs);

// Copiado y movimiento atómico
Files.copy(ruta, Paths.get("datos_copia.txt"));
```

---

## ⚠️ Buenas Prácticas y Errores Habituales
- **Olvidar cerrar `Files.lines()`**: A diferencia de `Files.readAllLines()`, el método `Files.lines()` mantiene abierto el canal de lectura mientras el stream esté activo. **Debe cerrarse siempre dentro de un `try-with-resources`**.
- **Codificación por defecto del sistema**: Nunca omitir el `Charset`. Si no se especifica `StandardCharsets.UTF_8`, el programa utilizará la codificación local de la máquina (CP1252 en Windows, UTF-8 en Linux), provocando errores de caracteres especiales (ñ, tildes) al migrar de entorno.
