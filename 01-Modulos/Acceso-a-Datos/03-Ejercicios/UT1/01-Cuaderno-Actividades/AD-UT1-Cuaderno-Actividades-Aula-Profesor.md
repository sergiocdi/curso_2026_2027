---
tipo: solucionario_docente
modulo: "Acceso a Datos"
ud: "UD01"
titulo: "Cuaderno de Actividades de Aula - Solucionario Explicado y Guía Docente"
curso_academico: "2026-2027"
docente: "Sergio Capdevila Díez"
fecha: 2026-09-16
destinatario: "Profesor / Solucionario de Aula"
---

# 🎓 Cuaderno de Actividades de Aula (UT1) — Guía Docente y Solucionario Explicado

> **Módulo:** [[MOC-Acceso-a-Datos|Acceso a Datos (DAM2)]]  
> **Unidad:** [[UD01-Manejo-de-Ficheros|UT1: Manejo de Ficheros]]  
> **Docente:** Sergio Capdevila Díez · CIFP Avilés  
> **Propósito:** Documento de referencia para el profesor con el código fuente resuelto de cada actividad, explicaciones pedagógicas de apoyo, errores comunes que cometerán los alumnos y directrices para guiar la sesión de aula en vivo.  
> **Estilo de código:** Java claro, directo, sin construcciones innecesariamente complejas o crípticas, idóneo para segundo curso de Formación Profesional.

---

## 📑 Índice de Actividades

- **Bloque 1: Ficheros de Texto Plano (java.io y Java NIO.2)**
  - [[#📌 Actividad 1.1: Diagnóstico de Charset y Conversión ISO-8859-1 a UTF-8|Actividad 1.1: Diagnóstico de Charset y Conversión ISO-8859-1 a UTF-8]]
  - [[#📌 Actividad 1.2: Lectura y Escritura Clásica Optimizada con Búferes|Actividad 1.2: Lectura y Escritura Clásica Optimizada con Búferes]]
  - [[#📌 Actividad 1.3: Generador de Informes Formateados con PrintWriter|Actividad 1.3: Generador de Informes Formateados con PrintWriter]]
  - [[#📌 Actividad 1.4: Operaciones Rápidas con Java NIO.2 (Files)|Actividad 1.4: Operaciones Rápidas con Java NIO.2 (Files)]]
  - [[#📌 Actividad 1.5: Filtro de Logs en Streaming con Files.lines()|Actividad 1.5: Filtro de Logs en Streaming con Files.lines()]]
- **Bloque 2: Ficheros Binarios de Datos Simples y Objetos**
  - [[#📌 Actividad 2.1: Flujos Binarios Primitivos y Control Canónico de EOFException|Actividad 2.1: Flujos Binarios Primitivos y Control Canónico de EOFException]]
  - [[#📌 Actividad 2.2: Almacén de Registros de Longitud Fija con RandomAccessFile|Actividad 2.2: Almacén de Registros de Longitud Fija con RandomAccessFile]]
  - [[#📌 Actividad 2.3: Actualización In-Situ de Stock con RandomAccessFile|Actividad 2.3: Actualización In-Situ de Stock con RandomAccessFile]]
  - [[#📌 Actividad 2.4: Serialización de Objetos con Campos Transient|Actividad 2.4: Serialización de Objetos con Campos Transient]]
  - [[#📌 Actividad 2.5: El Gran Reto - Persistencia Incremental sin Corrupción (MiObjectOutputStream)|Actividad 2.5: El Gran Reto - Persistencia Incremental sin Corrupción (MiObjectOutputStream)]]
- **Bloque 3: Ficheros XML (DOM, SAX y JAXB)**
  - [[#📌 Actividad 3.1: Consulta y Modificación de Catálogo con DOM|Actividad 3.1: Consulta y Modificación de Catálogo con DOM]]
  - [[#📌 Actividad 3.2: Generación de XML y Volcado Formateado con Transformer|Actividad 3.2: Generación de XML y Volcado Formateado con Transformer]]
  - [[#📌 Actividad 3.3: Analizador Reactivo sin Memoria con SAX|Actividad 3.3: Analizador Reactivo sin Memoria con SAX]]
  - [[#📌 Actividad 3.4: Mapeo Declarativo Objeto-XML con JAXB|Actividad 3.4: Mapeo Declarativo Objeto-XML con JAXB]]

---

## 🔤 BLOQUE 1: Ficheros de Texto Plano (java.io y Java NIO.2)

---

### 📌 Actividad 1.1: Diagnóstico de Charset y Conversión ISO-8859-1 a UTF-8

- **Momento didáctico:** Tras explicar la Diapositiva 03 y el apartado 1.0 de los Apuntes.
- **Concepto clave:** Los bytes en disco no tienen significado sin una tabla de codificación. Forzar el charset evita el *Mojibake* y fallos dependientes del sistema operativo.

#### 💻 Código de la Solución (Java claro y accesible):
```java
package es.cifpaviles.ad.ut1.soluciones;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.nio.charset.StandardCharsets;

public class SolucionActividad1_1 {

    public static void main(String[] args) {
        File origen = new File("datos/usuarios_legacy.txt");
        File destino = new File("datos/usuarios_utf8.txt");

        // Creamos la carpeta 'datos' si no existe
        if (!origen.getParentFile().exists()) {
            origen.getParentFile().mkdirs();
        }

        // 1. Abrimos el fichero origen leyendo explícitamente en ISO-8859-1
        // 2. Abrimos el fichero destino escribiendo explícitamente en UTF-8
        try (
            BufferedReader lector = new BufferedReader(
                new InputStreamReader(new FileInputStream(origen), StandardCharsets.ISO_8859_1)
            );
            BufferedWriter escritor = new BufferedWriter(
                new OutputStreamWriter(new FileOutputStream(destino), StandardCharsets.UTF_8)
            )
        ) {
            String linea;
            int totalLineas = 0;

            // Leemos línea a línea hasta que se acabe el fichero
            while ((linea = lector.readLine()) != null) {
                escritor.write(linea);
                escritor.newLine(); // Inserta el salto de línea adecuado al SO
                totalLineas++;
            }

            System.out.println("✅ Conversión completada con éxito.");
            System.out.println("Lineas procesadas: " + totalLineas);
            System.out.println("Archivo UTF-8 guardado en: " + destino.getAbsolutePath());

        } catch (IOException e) {
            System.err.println("❌ Error al procesar los archivos: " + e.getMessage());
        }
    }
}
```

#### 👨‍🏫 Guía para el Profesor en el Aula:
1. **Qué resaltar en la pizarra:** Explica el "sándwich" de clases: `FileInputStream` (lee bytes puros) $\rightarrow$ `InputStreamReader` (traduce bytes a letras usando la tabla indicada) $\rightarrow$ `BufferedReader` (añade búfer y el método `readLine()`).
2. **Error típico de los alumnos:** Usar `new FileReader(origen)` sin especificar el `Charset`. En Windows en español puede parecer que funciona porque el sistema usa `Windows-1252`, pero al desplegarlo en un servidor Linux en la nube fallará con caracteres extraños (`Ã±`, `Â¿`).
3. **Comprobación rápida:** Haz que abran el archivo generado en Eclipse y en el Bloc de notas comprobando que nombres como *"Peña"*, *"Ñandú"* o *"López"* se lean perfectos.

---

### 📌 Actividad 1.2: Lectura y Escritura Clásica Optimizada con Búferes

- **Momento didáctico:** Tras explicar la Diapositiva 04 y el apartado 1.1 de los Apuntes.
- **Concepto clave:** La memoria RAM es miles de veces más rápida que el disco. El búfer agrupa lecturas/escrituras para no castigar al disco con operaciones de 1 solo carácter.

#### 💻 Código de la Solución:
```java
package es.cifpaviles.ad.ut1.soluciones;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.nio.charset.StandardCharsets;

public class SolucionActividad1_2 {

    public static void main(String[] args) {
        File fOriginal = new File("datos/servidores.txt");
        File fCopia = new File("datos/servidores_backup.txt");

        // Creamos un fichero de prueba si no existiera
        crearFicheroEjemploSiNoExiste(fOriginal);

        // Usamos try-with-resources para garantizar el cierre automático
        try (
            BufferedReader br = new BufferedReader(new FileReader(fOriginal, StandardCharsets.UTF_8));
            BufferedWriter bw = new BufferedWriter(new FileWriter(fCopia, StandardCharsets.UTF_8))
        ) {
            String linea;
            int numLinea = 1;

            while ((linea = br.readLine()) != null) {
                // Escribimos la línea numerada en el backup
                bw.write("[" + numLinea + "] " + linea);
                bw.newLine();
                numLinea++;
            }

            // Forzamos el vaciado del búfer antes de cerrar (buena práctica)
            bw.flush();

            System.out.println("✅ Copia y numeración completada.");
            System.out.println("Total líneas copiadas: " + (numLinea - 1));

        } catch (IOException e) {
            System.err.println("❌ Error en operación I/O: " + e.getMessage());
        }
    }

    private static void crearFicheroEjemploSiNoExiste(File f) {
        if (!f.exists()) {
            try (BufferedWriter bw = new BufferedWriter(new FileWriter(f, StandardCharsets.UTF_8))) {
                bw.write("srv-db-prod.empresa.local 192.168.1.10");
                bw.newLine();
                bw.write("srv-web-frontend.empresa.local 192.168.1.20");
                bw.newLine();
                bw.write("srv-backup-storage.empresa.local 192.168.1.30");
                bw.newLine();
            } catch (IOException ignored) {}
        }
    }
}
```

#### 👨‍🏫 Guía para el Profesor en el Aula:
1. **Qué resaltar en la pizarra:** Explica la diferencia entre `\n` y `bw.newLine()`. En Windows el salto de línea es `\r\n` (CRLF) y en Linux es `\n` (LF). El método `newLine()` elige automáticamente el del sistema en el que se ejecuta.
2. **Error típico de los alumnos:** Olvidar llamar a `bw.newLine()`, con lo que todas las líneas se escriben pegadas en un único bloque continuo.
3. **Pregunta trampa para la clase:** *"¿Qué pasa si no usamos try-with-resources ni close()?"* $\rightarrow$ Parte de los datos se quedan atrapados en el búfer de 8 KB en memoria y el archivo resultante queda vacío o incompleto.

---

### 📌 Actividad 1.3: Generador de Informes Formateados con PrintWriter

- **Momento didáctico:** Tras la Diapositiva 05 y el apartado 1.2 de los Apuntes.
- **Concepto clave:** `PrintWriter` no lanza `IOException` en sus métodos y ofrece `printf()`, `println()` y `print()` igual que `System.out`.

#### 💻 Código de la Solución:
```java
package es.cifpaviles.ad.ut1.soluciones;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.charset.StandardCharsets;

public class SolucionActividad1_3 {

    public static void main(String[] args) {
        File informe = new File("datos/informe_ventas.txt");

        // Datos de ejemplo para generar el informe
        String[] productos = { "Teclado Mecánico RGB", "Ratón Óptico 16000 DPI", "Monitor 27 Pulgadas 4K", "Cable HDMI 2.1" };
        int[] unidades = { 15, 32, 8, 45 };
        double[] precios = { 79.99, 45.50, 289.00, 12.95 };

        // Abrimos PrintWriter directamente indicando charset UTF-8
        try (PrintWriter pw = new PrintWriter(new FileWriter(informe, StandardCharsets.UTF_8))) {

            // Cabecera del informe
            pw.println("================================================================================");
            pw.println("                 INFORME SEMANAL DE VENTAS - CIFP AVILÉS                       ");
            pw.println("================================================================================");
            pw.printf("%-30s | %10s | %12s | %12s%n", "PRODUCTO", "UNIDADES", "PRECIO (€)", "TOTAL (€)");
            pw.println("--------------------------------------------------------------------------------");

            double totalGlobal = 0.0;

            // Filas de datos formateadas con columnas fijas
            for (int i = 0; i < productos.length; i++) {
                double subtotal = unidades[i] * precios[i];
                totalGlobal += subtotal;

                // %-30s = texto justificado a la izquierda ocupando 30 huecos
                // %10d = entero a la derecha ocupando 10 huecos
                // %12.2f = decimal con 2 cifras decimales en 12 huecos
                pw.printf("%-30s | %10d | %12.2f | %12.2f%n", 
                          productos[i], unidades[i], precios[i], subtotal);
            }

            pw.println("================================================================================");
            pw.printf("%-30s   %10s   %12s | %12.2f €%n", "TOTAL GENERAL FACTURADO", "", "", totalGlobal);
            pw.println("================================================================================");

            // Comprobamos si ocurrió algún error interno
            if (pw.checkError()) {
                System.err.println("⚠️ Ocurrió algún problema al volcar el informe.");
            } else {
                System.out.println("✅ Informe generado con éxito en: " + informe.getAbsolutePath());
            }

        } catch (IOException e) {
            System.err.println("❌ No se pudo crear el archivo: " + e.getMessage());
        }
    }
}
```

#### 👨‍🏫 Guía para el Profesor en el Aula:
1. **Qué resaltar en la pizarra:** Explica el uso de `%n` en `printf` en lugar de `\n`. En `printf()`, `%n` es independiente de la plataforma.
2. **Error típico de los alumnos:** Pensar que `PrintWriter` silencia los errores por completo. Enséñales a comprobar `pw.checkError()`.

---

### 📌 Actividad 1.4: Operaciones Rápidas con Java NIO.2 (Files)

- **Momento didáctico:** Tras la Diapositiva 06 y el apartado 1.3 de los Apuntes.
- **Concepto clave:** Para ficheros pequeños/medianos (menos de 50-100 MB), `java.nio.file.Files` permite leer o escribir todo en 1 sola línea de código sin declarar flujos manuales.

#### 💻 Código de la Solución:
```java
package es.cifpaviles.ad.ut1.soluciones;

import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardOpenOption;
import java.util.List;

public class SolucionActividad1_4 {

    public static void main(String[] args) {
        Path rutaArchivo = Paths.get("datos/app_config.json");

        try {
            // Aseguramos que la carpeta exista
            if (rutaArchivo.getParent() != null && !Files.exists(rutaArchivo.getParent())) {
                Files.createDirectories(rutaArchivo.getParent());
            }

            // 1. Escritura directa de todo un texto en 1 sola línea
            String jsonInicial = "{\n  \"entorno\": \"produccion\",\n  \"puerto\": 8080,\n  \"debug\": false\n}";
            Files.writeString(rutaArchivo, jsonInicial, StandardCharsets.UTF_8);
            System.out.println("✅ Archivo JSON creado en 1 sola línea.");

            // 2. Lectura directa de todo el contenido como String
            String contenidoLeido = Files.readString(rutaArchivo, StandardCharsets.UTF_8);
            System.out.println("📄 Contenido leído completo:\n" + contenidoLeido);

            // 3. Lectura de todas las líneas en una List<String>
            List<String> lineas = Files.readAllLines(rutaArchivo, StandardCharsets.UTF_8);
            System.out.println("Número de líneas en el JSON: " + lineas.size());

            // 4. Modificación rápida: añadir una línea al final (APPEND)
            String nuevaPropiedad = "\n// Última modificación: 2026-09-16";
            Files.writeString(rutaArchivo, nuevaPropiedad, StandardCharsets.UTF_8, StandardOpenOption.APPEND);
            System.out.println("✅ Añadida nota con StandardOpenOption.APPEND.");

        } catch (IOException e) {
            System.err.println("❌ Error en Java NIO.2: " + e.getMessage());
        }
    }
}
```

#### 👨‍🏫 Guía para el Profesor en el Aula:
1. **Qué resaltar en la pizarra:** La evolución de Java: antes hacían falta 10 líneas de código con `FileReader` y `BufferedReader`; desde Java 11 se hace con `Files.writeString()` y `Files.readString()`.
2. **Advertencia crítica para la clase:** Jamás usar `Files.readString()` o `Files.readAllLines()` con un archivo de 4 GB, porque intentará cargarlo entero en la memoria RAM de golpe y lanzará un `java.lang.OutOfMemoryError: Java heap space`.

---

### 📌 Actividad 1.5: Filtro de Logs en Streaming con Files.lines()

- **Momento didáctico:** Tras la Diapositiva 07 y el apartado 1.4 de los Apuntes.
- **Concepto clave:** `Files.lines(path)` lee el fichero como un grifo que gotea línea a línea de forma perezosa (*lazy evaluation*). Consume apenas unos pocos megabytes de RAM aunque el archivo pese 20 GB.

#### 💻 Código de la Solución (Con Streams sencillos y comprensibles):
```java
package es.cifpaviles.ad.ut1.soluciones;

import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.stream.Stream;

public class SolucionActividad1_5 {

    public static void main(String[] args) {
        Path logOrigen = Paths.get("datos/servidor.log");
        Path logErrores = Paths.get("datos/solo_errores.log");

        // Creamos un fichero de log simulado si no existe
        crearLogSimulado(logOrigen);

        System.out.println("🔍 Iniciando filtrado en streaming de logs...");

        // IMPORTANTE: Files.lines abre un flujo del SO; DEBE ir dentro del try() para cerrarse
        try (
            Stream<String> lineasStream = Files.lines(logOrigen, StandardCharsets.UTF_8);
            BufferedWriter escritor = new BufferedWriter(new FileWriter(logErrores.toFile(), StandardCharsets.UTF_8))
        ) {
            // Usamos operaciones básicas de Stream:
            // 1. filter() para quedarnos con líneas que contengan "[ERROR]" o "[FATAL]"
            // 2. forEach() para escribir cada una en el fichero de salida
            lineasStream
                .filter(linea -> linea.contains("[ERROR]") || linea.contains("[FATAL]"))
                .forEach(linea -> {
                    try {
                        escritor.write(linea);
                        escritor.newLine();
                    } catch (IOException ex) {
                        System.err.println("Error al escribir línea filtrada: " + ex.getMessage());
                    }
                });

            System.out.println("✅ Filtrado finalizado con éxito.");
            System.out.println("Fichero con incidencias generado en: " + logErrores.toAbsolutePath());

        } catch (IOException e) {
            System.err.println("❌ Error al procesar el stream de logs: " + e.getMessage());
        }
    }

    private static void crearLogSimulado(Path p) {
        try (BufferedWriter bw = Files.newBufferedWriter(p, StandardCharsets.UTF_8)) {
            bw.write("2026-09-16 08:00:01 [INFO] Sistema iniciado correctamente."); bw.newLine();
            bw.write("2026-09-16 08:01:23 [DEBUG] Conexión establecida con la base de datos."); bw.newLine();
            bw.write("2026-09-16 08:04:12 [ERROR] Timeout al conectar con la pasarela de pago."); bw.newLine();
            bw.write("2026-09-16 08:05:00 [INFO] Petición GET /api/productos finalizada."); bw.newLine();
            bw.write("2026-09-16 08:07:44 [FATAL] Espacio en disco insuficiente en /var/data."); bw.newLine();
            bw.write("2026-09-16 08:10:00 [INFO] Servicio de telemetría activo."); bw.newLine();
        } catch (IOException ignored) {}
    }
}
```

#### 👨‍🏫 Guía para el Profesor en el Aula:
1. **Qué resaltar en la pizarra:** Enfatiza por qué `Stream<String>` implementa `AutoCloseable`. Si abres un `Stream` con `Files.lines()` fuera de un `try-with-resources`, el descriptor de archivo en el sistema operativo queda abierto (*file leak*).
2. **Alternativa tradicional para alumnos con dificultad:** Si a algún alumno le cuesta la sintaxis lambda de `Stream`, muéstrale que con un `BufferedReader.readLine()` dentro de un bucle `while` se consigue exactamente el mismo comportamiento en streaming sin saturar la RAM.

---

## 💾 BLOQUE 2: Ficheros Binarios de Datos Simples y Objetos

---

### 📌 Actividad 2.1: Flujos Binarios Primitivos y Control Canónico de EOFException

- **Momento didáctico:** Tras explicar la Diapositiva 09 y el apartado 2.1 de los Apuntes.
- **Concepto clave:** A diferencia de los ficheros de texto (que devuelven `null` o `-1` al terminar), `DataInputStream` **lanza obligatoriamente una excepción `EOFException`** cuando llega al final del archivo.

#### 💻 Código de la Solución:
```java
package es.cifpaviles.ad.ut1.soluciones;

import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.EOFException;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;

public class SolucionActividad2_1 {

    public static void main(String[] args) {
        File ficheroBinario = new File("datos/telemetria.dat");

        // 1. ESCRITURA: Guardamos pares de datos (int idSensor, double temperatura, boolean alarma)
        try (DataOutputStream dos = new DataOutputStream(new FileOutputStream(ficheroBinario))) {
            
            // Escribimos 3 lecturas consecutivas
            dos.writeInt(101);
            dos.writeDouble(22.45);
            dos.writeBoolean(false);

            dos.writeInt(102);
            dos.writeDouble(48.90);
            dos.writeBoolean(true); // Alarma activa

            dos.writeInt(103);
            dos.writeDouble(18.10);
            dos.writeBoolean(false);

            System.out.println("✅ Datos binarios primitivos escritos con éxito.");
            System.out.println("Tamaño total del fichero: " + ficheroBinario.length() + " bytes");
            // Cálculo didáctico: 3 registros * (4 bytes int + 8 bytes double + 1 byte boolean) = 3 * 13 = 39 bytes

        } catch (IOException e) {
            System.err.println("❌ Error en escritura: " + e.getMessage());
        }

        // 2. LECTURA: Bucle infinito controlado canónicamente por EOFException
        System.out.println("\n📡 Leyendo registros binarios...");
        try (DataInputStream dis = new DataInputStream(new FileInputStream(ficheroBinario))) {

            while (true) { // Bucle infinito intencionado
                int id = dis.readInt();
                double temp = dis.readDouble();
                boolean alarma = dis.readBoolean();

                System.out.printf("-> Sensor ID: %d | Temp: %.2f ºC | ¿Alarma?: %s%n",
                                  id, temp, (alarma ? "⚠️ SÍ" : "OK"));
            }

        } catch (EOFException e) {
            // Llegada natural al final del fichero. ¡NO es un error del sistema!
            System.out.println("🏁 Fin de fichero alcanzado correctamente (EOFException capturada).");
        } catch (IOException e) {
            System.err.println("❌ Error de lectura no esperado: " + e.getMessage());
        }
    }
}
```

#### 👨‍🏫 Guía para el Profesor en el Aula:
1. **Qué resaltar en la pizarra:** Explica el orden estricto de lectura. Si escribes `int`, `double`, `boolean`, **debes leer exactamente en ese mismo orden**: `readInt()`, `readDouble()`, `readBoolean()`. Si intentas leer primero un `readDouble()`, leerá 8 bytes mezclando el `int` y la mitad del `double`, produciendo un valor basura sin sentido.
2. **Error típico de los alumnos:** Asustarse al ver `EOFException` y creer que su código ha fallado. Recalca que en `DataInputStream` la excepción `EOFException` es el mecanismo oficial de parada.

---

### 📌 Actividad 2.2: Almacén de Registros de Longitud Fija con RandomAccessFile

- **Momento didáctico:** Tras explicar la Diapositiva 11 y el apartado 2.2 de los Apuntes.
- **Concepto clave:** Para saltar directamente a un registro concreto sin leer los anteriores, todos los registros deben medir exactamente la misma cantidad de bytes.

#### 💻 Código de la Solución:
```java
package es.cifpaviles.ad.ut1.soluciones;

import java.io.File;
import java.io.IOException;
import java.io.RandomAccessFile;

public class SolucionActividad2_2 {

    // ESTRUCTURA DE CADA REGISTRO:
    // int id           -> 4 bytes
    // String nombre    -> 10 caracteres * 2 bytes = 20 bytes
    // double precio    -> 8 bytes
    // -------------------------------------------------------
    // TOTAL REGISTRO   = 32 bytes exactos
    public static final int TAMANO_REGISTRO = 32;
    public static final int LONGITUD_MAX_NOMBRE = 10;

    public static void main(String[] args) {
        File f = new File("datos/almacen_raf.dat");

        // Usamos modo "rw" (lectura y escritura)
        try (RandomAccessFile raf = new RandomAccessFile(f, "rw")) {

            // Escribimos 3 productos con IDs 1, 2 y 3
            escribirProducto(raf, 0, 1, "Teclado", 49.99);
            escribirProducto(raf, 1, 2, "Raton", 19.50);
            escribirProducto(raf, 2, 3, "Auricular", 35.00);

            System.out.println("✅ 3 productos escritos con éxito.");
            System.out.println("Longitud total del fichero: " + raf.length() + " bytes (esperado: 3 * 32 = 96)");

            // Lectura secuencial de todos los registros
            System.out.println("\n📋 Listado completo de productos:");
            long totalRegistros = raf.length() / TAMANO_REGISTRO;
            for (int i = 0; i < totalRegistros; i++) {
                leerProductoEnPosicion(raf, i);
            }

        } catch (IOException e) {
            System.err.println("❌ Error en RandomAccessFile: " + e.getMessage());
        }
    }

    public static void escribirProducto(RandomAccessFile raf, int posicion, int id, String nombre, double precio) throws IOException {
        // Nos posicionamos en el byte inicial del registro
        long offset = (long) posicion * TAMANO_REGISTRO;
        raf.seek(offset);

        // 1. Escribimos el ID (4 bytes)
        raf.writeInt(id);

        // 2. Escribimos el Nombre asegurando exactamente 10 caracteres (20 bytes)
        StringBuffer sb = new StringBuffer(nombre);
        sb.setLength(LONGITUD_MAX_NOMBRE); // Si es más corto rellena con nulos '\0', si es más largo recorta
        raf.writeChars(sb.toString());

        // 3. Escribimos el Precio (8 bytes)
        raf.writeDouble(precio);
    }

    public static void leerProductoEnPosicion(RandomAccessFile raf, int posicion) throws IOException {
        long offset = (long) posicion * TAMANO_REGISTRO;
        raf.seek(offset);

        int id = raf.readInt();

        // Leemos 10 caracteres uno a uno
        char[] nombreChars = new char[LONGITUD_MAX_NOMBRE];
        for (int i = 0; i < LONGITUD_MAX_NOMBRE; i++) {
            nombreChars[i] = raf.readChar();
        }
        // Creamos el String y limpiamos los caracteres nulos sobrantes
        String nombre = new String(nombreChars).replace('\0', ' ').trim();

        double precio = raf.readDouble();

        System.out.printf("Reg [%d] -> Offset %2d | ID: %d | Nombre: %-10s | Precio: %.2f €%n",
                          posicion, offset, id, nombre, precio);
    }
}
```

#### 👨‍🏫 Guía para el Profesor en el Aula:
1. **Qué resaltar en la pizarra:** Dibuja una regla métrica en la pizarra dividida en casillas de 32 bytes (0, 32, 64). Explica la fórmula matemática del puntero: $\text{Offset} = \text{Posición} \times \text{Tamaño}$.
2. **El truco de `StringBuffer.setLength(10)`:** Explica por qué no podemos usar `writeUTF()` aquí: `writeUTF()` tiene longitud variable, lo que rompería la alineación fija de los registros.

---

### 📌 Actividad 2.3: Actualización In-Situ de Stock con RandomAccessFile

- **Momento didáctico:** Tras explicar la Diapositiva 12 y el apartado 2.2 de los Apuntes.
- **Concepto clave:** La magia de `seek()` radica en que podemos sobreescribir bytes en medio de un fichero sin tener que leer ni reescribir el resto del archivo.

#### 💻 Código de la Solución:
```java
package es.cifpaviles.ad.ut1.soluciones;

import java.io.File;
import java.io.IOException;
import java.io.RandomAccessFile;

public class SolucionActividad2_3 {

    public static void main(String[] args) {
        File f = new File("datos/almacen_raf.dat");

        // Queremos modificar directamente el PRECIO del SEGUNDO producto (posición índice 1: "Raton")
        int posicionAEditar = 1;
        double nuevoPrecio = 24.95;

        try (RandomAccessFile raf = new RandomAccessFile(f, "rw")) {

            // Cálculo del offset exacto del campo precio:
            // Inicio del registro: posicion * TAMANO_REGISTRO
            // + Salto de ID (4 bytes)
            // + Salto de Nombre (20 bytes)
            // = Desplazamiento de 24 bytes dentro del registro
            long offsetPrecio = ((long) posicionAEditar * SolucionActividad2_2.TAMANO_REGISTRO) + 4 + 20;

            System.out.println("🎯 Saltando directamente al offset del precio: " + offsetPrecio);
            raf.seek(offsetPrecio);

            // Leemos el precio antiguo para mostrarlo
            double precioAnterior = raf.readDouble();
            System.out.printf("Precio anterior del producto: %.2f €%n", precioAnterior);

            // Volvemos a retroceder 8 bytes para posicionarnos sobre el dato a sobreescribir
            raf.seek(offsetPrecio);
            raf.writeDouble(nuevoPrecio);
            System.out.printf("✅ Precio actualizado in-situ a: %.2f €%n", nuevoPrecio);

            // Verificamos volviendo a leer el registro completo usando el método de la Actividad 2.2
            System.out.println("\n🔍 Comprobando registro tras la edición:");
            SolucionActividad2_2.leerProductoEnPosicion(raf, posicionAEditar);

        } catch (IOException e) {
            System.err.println("❌ Error al actualizar in-situ: " + e.getMessage());
        }
    }
}
```

#### 👨‍🏫 Guía para el Profesor en el Aula:
1. **Qué resaltar en la pizarra:** Destaca que la lectura `readDouble()` avanza automáticamente el puntero 8 bytes hacia adelante. Por eso, antes de escribir el nuevo valor, es imprescindible volver a hacer `raf.seek(offsetPrecio)`.
2. **Analogía de aula:** Compara un fichero secuencial con una cinta de casete (tienes que rebobinar y pasar toda la cinta) y `RandomAccessFile` con la aguja de un tocadiscos o el cabezal de un disco duro que cae exactamente sobre el surco deseado.

---

### 📌 Actividad 2.4: Serialización de Objetos con Campos Transient

- **Momento didáctico:** Tras explicar la Diapositiva 13 y el apartado 2.3 de los Apuntes.
- **Concepto clave:** `implements Serializable` habilita la serialización automática del grafo de objetos. La palabra reservada `transient` evita que datos confidenciales o volátiles se guarden en disco.

#### 💻 Código de la Solución:

**Paso 1: La clase `Usuario`**
```java
package es.cifpaviles.ad.ut1.soluciones;

import java.io.Serializable;

public class Usuario implements Serializable {

    // Identificador de versión para evitar InvalidClassException
    private static final long serialVersionUID = 1L;

    private int id;
    private String login;
    private String email;

    // Campo marcado como TRANSIENT: NO se guardará en el fichero binario
    private transient String tokenSesion;

    public Usuario(int id, String login, String email, String tokenSesion) {
        this.id = id;
        this.login = login;
        this.email = email;
        this.tokenSesion = tokenSesion;
    }

    @Override
    public String toString() {
        return String.format("Usuario [ID=%d, Login='%s', Email='%s', Token='%s']",
                             id, login, email, (tokenSesion == null ? "NULL (Protegido)" : tokenSesion));
    }
}
```

**Paso 2: Programa principal de serialización y deserialización**
```java
package es.cifpaviles.ad.ut1.soluciones;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;

public class SolucionActividad2_4 {

    public static void main(String[] args) {
        File archivoBin = new File("datos/usuarios.bin");

        Usuario u1 = new Usuario(1, "scapdevila", "sergio@cifpaviles.es", "JWT_SECRET_TOKEN_XYZ123");
        Usuario u2 = new Usuario(2, "alumnodam", "alumno@cifpaviles.es", "TEMP_SESSION_ABC987");

        // 1. SERIALIZACIÓN (Guardar objetos en disco)
        try (ObjectOutputStream oos = new ObjectOutputStream(new FileOutputStream(archivoBin))) {
            oos.writeObject(u1);
            oos.writeObject(u2);
            System.out.println("✅ 2 objetos Usuario serializados en disco.");
            System.out.println("Valores antes de guardar:");
            System.out.println("  " + u1);
            System.out.println("  " + u2);
        } catch (IOException e) {
            System.err.println("❌ Error al serializar: " + e.getMessage());
        }

        // 2. DESERIALIZACIÓN (Recuperar objetos de disco)
        System.out.println("\n📥 Deserializando objetos desde el archivo...");
        try (ObjectInputStream ois = new ObjectInputStream(new FileInputStream(archivoBin))) {
            Usuario u1Recuperado = (Usuario) ois.readObject();
            Usuario u2Recuperado = (Usuario) ois.readObject();

            System.out.println("Valores recuperados:");
            System.out.println("  " + u1Recuperado);
            System.out.println("  " + u2Recuperado);

            // Demostración didáctica: el token debe ser null
            if (u1Recuperado.toString().contains("NULL")) {
                System.out.println("🔒 ÉXITO: El token transient no se guardó en el fichero.");
            }

        } catch (IOException | ClassNotFoundException e) {
            System.err.println("❌ Error al deserializar: " + e.getMessage());
        }
    }
}
```

#### 👨‍🏫 Guía para el Profesor en el Aula:
1. **Qué resaltar en la pizarra:** Explica el casting obligatorio: `(Usuario) ois.readObject()`. El método devuelve un `Object` genérico y debe ser convertido a la clase concreta.
2. **Excepción a vigilar:** `ClassNotFoundException` se produce si el archivo `.class` de la entidad no está en el classpath en el momento de leer.

---

### 📌 Actividad 2.5: El Gran Reto - Persistencia Incremental sin Corrupción (MiObjectOutputStream)

- **Momento didáctico:** Tras explicar las Diapositivas 14 y 15 y el apartado 2.4 de los Apuntes.
- **Concepto clave:** `ObjectOutputStream` escribe automáticamente una cabecera de 4 bytes (`0xACED0005`) al instanciarse. Si abres en modo append (`true`) con el `ObjectOutputStream` normal, se inserta una segunda cabecera en medio del fichero que provoca `StreamCorruptedException: invalid type code: AC`.

#### 💻 Código de la Solución:

**Paso 1: La subclase que anula la cabecera repetida**
```java
package es.cifpaviles.ad.ut1.soluciones;

import java.io.IOException;
import java.io.ObjectOutputStream;
import java.io.OutputStream;

/**
 * Subclase especial para añadir objetos a ficheros binarios ya existentes
 * sin repetir la cabecera de 4 bytes de Java Serialization.
 */
public class MiObjectOutputStream extends ObjectOutputStream {

    public MiObjectOutputStream(OutputStream out) throws IOException {
        super(out);
    }

    @Override
    protected void writeStreamHeader() throws IOException {
        // Al dejar este método completamente vacío, NO escribe la cabecera 0xACED0005.
        // Se preserva la cabecera original que ya tenía el fichero.
    }
}
```

**Paso 2: Gestor de persistencia que decide qué clase usar**
```java
package es.cifpaviles.ad.ut1.soluciones;

import java.io.EOFException;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;

public class SolucionActividad2_5 {

    private static final File FICHERO = new File("datos/usuarios_append.bin");

    public static void main(String[] args) {
        // Borramos el fichero previo para empezar la prueba desde cero
        if (FICHERO.exists()) {
            FICHERO.delete();
        }

        System.out.println("🚀 Ejecutando 3 inserciones incrementales separadas...");

        // Simulación de 3 ejecuciones en momentos diferentes
        guardarUsuario(new Usuario(10, "carlos_g", "carlos@empresa.com", "token_1"));
        guardarUsuario(new Usuario(20, "maria_dev", "maria@empresa.com", "token_2"));
        guardarUsuario(new Usuario(30, "laura_qa", "laura@empresa.com", "token_3"));

        // Comprobación: leemos todos los objetos consecutivamente
        leerTodosLosUsuarios();
    }

    public static void guardarUsuario(Usuario u) {
        // Condición clave: ¿El archivo existe Y ya tiene datos grabados?
        boolean yaExisteConDatos = FICHERO.exists() && FICHERO.length() > 0;

        try {
            // Abrimos FileOutputStream en modo append (true)
            FileOutputStream fos = new FileOutputStream(FICHERO, true);

            // Si ya tiene datos usamos MiObjectOutputStream; si es nuevo usamos ObjectOutputStream normal
            ObjectOutputStream oos = yaExisteConDatos 
                    ? new MiObjectOutputStream(fos) 
                    : new ObjectOutputStream(fos);

            oos.writeObject(u);
            oos.close(); // Cerramos el stream

            System.out.printf("  -> Añadido: %s (¿Usó MiObjectOutputStream?: %s)%n",
                              u, yaExisteConDatos ? "SÍ" : "NO, fue el primero");

        } catch (IOException e) {
            System.err.println("❌ Error al guardar usuario: " + e.getMessage());
        }
    }

    public static void leerTodosLosUsuarios() {
        System.out.println("\n📋 Leyendo fichero completo en bucle continuo:");

        try (ObjectInputStream ois = new ObjectInputStream(new FileInputStream(FICHERO))) {

            int contador = 0;
            while (true) {
                Usuario u = (Usuario) ois.readObject();
                contador++;
                System.out.println("  [" + contador + "] " + u);
            }

        } catch (EOFException e) {
            System.out.println("🏁 Lectura completada con éxito. ¡Ninguna cabecera corrupta detectada!");
        } catch (IOException | ClassNotFoundException e) {
            System.err.println("❌ Fallo grave de lectura (posible StreamCorruptedException): " + e.getMessage());
        }
    }
}
```

#### 👨‍🏫 Guía para el Profesor en el Aula:
1. **La demostración de impacto en clase:** Pide a los alumnos que primero intenten hacer los 3 `guardarUsuario()` usando **siempre** `new ObjectOutputStream(new FileOutputStream(FICHERO, true))`. Cuando ejecuten la lectura, verán el temido error en consola:
   `java.io.StreamCorruptedException: invalid type code: AC`
2. **La explicación mágica:** Explica que `AC` son los primeros dos caracteres de la cabecera `0xACED0005`. Al intentar leer el segundo objeto, Java espera un objeto, pero se topa con otra cabecera repetida y aborta.
3. **La solución:** Al sobrescribir `writeStreamHeader()` para no hacer nada, la cabecera intermedia desaparece y todos los objetos forman un único tren continuo.

---

## 🌳 BLOQUE 3: Ficheros XML (DOM, SAX y JAXB)

---

### 📌 Actividad 3.1: Consulta y Modificación de Catálogo con DOM

- **Momento didáctico:** Tras explicar la Diapositiva 17 y el apartado 3.1 de los Apuntes.
- **Concepto clave:** DOM carga el árbol completo en RAM. Los saltos de línea e indentaciones entre etiquetas son interpretados como nodos de texto (`#text`). Es obligatorio comprobar `getNodeType() == Node.ELEMENT_NODE`.

#### 💻 Código de la Solución:
```java
package es.cifpaviles.ad.ut1.soluciones;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

public class SolucionActividad3_1 {

    public static void main(String[] args) {
        File archivoXml = new File("datos/catalogo.xml");

        // Creamos un XML de prueba si no existe
        crearXmlEjemploSiNoExiste(archivoXml);

        try {
            // 1. Crear el parser DOM
            DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
            DocumentBuilder builder = factory.newDocumentBuilder();

            // 2. Parsear el archivo XML a un árbol Document en memoria RAM
            Document doc = builder.parse(archivoXml);

            // 3. Normalizar el árbol (elimina nodos de texto vacíos adyacentes)
            doc.getDocumentElement().normalize();

            System.out.println("Elemento raíz del documento: " + doc.getDocumentElement().getNodeName());

            // 4. Obtener todos los elementos <producto>
            NodeList listaProductos = doc.getElementsByTagName("producto");
            System.out.println("Total productos encontrados: " + listaProductos.getLength());

            for (int i = 0; i < listaProductos.getLength(); i++) {
                Node nodo = listaProductos.item(i);

                // FILTRADO OBLIGATORIO: Ignorar nodos de tipo comentario o espacios en blanco (#text)
                if (nodo.getNodeType() == Node.ELEMENT_NODE) {
                    Element elemento = (Element) nodo;

                    // Leer atributo "id"
                    String id = elemento.getAttribute("id");

                    // Leer etiquetas hijas <nombre> y <precio>
                    String nombre = elemento.getElementsByTagName("nombre").item(0).getTextContent();
                    String precioStr = elemento.getElementsByTagName("precio").item(0).getTextContent();

                    double precioOriginal = Double.parseDouble(precioStr);
                    double precioModificado = precioOriginal * 1.10; // Subida del 10%

                    // Modificamos el valor del nodo en el árbol DOM en memoria
                    elemento.getElementsByTagName("precio").item(0).setTextContent(String.format("%.2f", precioModificado).replace(',', '.'));

                    System.out.printf("  -> ID: %s | %-15s | Anterior: %.2f € -> Nuevo: %.2f €%n",
                                      id, nombre, precioOriginal, precioModificado);
                }
            }

            System.out.println("✅ Árbol DOM modificado en memoria con éxito (listo para volcar con Transformer).");

        } catch (Exception e) {
            System.err.println("❌ Error al procesar XML con DOM: " + e.getMessage());
        }
    }

    private static void crearXmlEjemploSiNoExiste(File f) {
        if (!f.exists()) {
            try (FileWriter fw = new FileWriter(f)) {
                fw.write("<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n");
                fw.write("<catalogo>\n");
                fw.write("  <producto id=\"P01\">\n");
                fw.write("    <nombre>Disco SSD 1TB</nombre>\n");
                fw.write("    <precio>85.50</precio>\n");
                fw.write("  </producto>\n");
                fw.write("  <producto id=\"P02\">\n");
                fw.write("    <nombre>Memoria RAM 16GB</nombre>\n");
                fw.write("    <precio>55.00</precio>\n");
                fw.write("  </producto>\n");
                fw.write("</catalogo>\n");
            } catch (IOException ignored) {}
        }
    }
}
```

#### 👨‍🏫 Guía para el Profesor en el Aula:
1. **Qué resaltar en la pizarra:** Dibuja el árbol jerárquico: Raíz (`<catalogo>`) $\rightarrow$ Elementos (`<producto>`) $\rightarrow$ Hojas (`<nombre>`, `<precio>`) $\rightarrow$ Texto del contenido.
2. **Error típico de los alumnos:** Intentar castear un nodo sin verificar: `(Element) lista.item(i)`. Si acceden con `getChildNodes()` en vez de `getElementsByTagName()`, el primer hijo suele ser un `#text` con el salto de línea y lanzará `ClassCastException`.

---

### 📌 Actividad 3.2: Generación de XML y Volcado Formateado con Transformer

- **Momento didáctico:** Tras explicar la Diapositiva 18 y el apartado 3.1 de los Apuntes.
- **Concepto clave:** Construir un documento XML nuevo desde código requiere crear elementos con `doc.createElement()` e irlos colgando con `appendChild()`. El volcado a disco se hace con la API `Transformer` activando la sangría (*pretty-print*).

#### 💻 Código de la Solución:
```java
package es.cifpaviles.ad.ut1.soluciones;

import java.io.File;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.transform.OutputKeys;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;
import org.w3c.dom.Document;
import org.w3c.dom.Element;

public class SolucionActividad3_2 {

    public static void main(String[] args) {
        File destinoXml = new File("datos/alumnos.xml");

        try {
            // 1. Crear un Document en blanco
            DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
            DocumentBuilder builder = factory.newDocumentBuilder();
            Document doc = builder.newDocument();

            // 2. Crear y añadir el nodo raíz <alumnos>
            Element raiz = doc.createElement("alumnos");
            doc.appendChild(raiz);

            // 3. Añadir el primer alumno
            Element alumno1 = crearElementoAlumno(doc, "EXP-2026-001", "Lucía Fernández", 9.50);
            raiz.appendChild(alumno1);

            // 4. Añadir el segundo alumno
            Element alumno2 = crearElementoAlumno(doc, "EXP-2026-002", "Marcos Peláez", 8.25);
            raiz.appendChild(alumno2);

            // 5. Configurar Transformer para volcar el árbol a disco con formato legible
            TransformerFactory tfFactory = TransformerFactory.newInstance();
            Transformer transformer = tfFactory.newTransformer();

            // Activar sangría bonita (Pretty Print)
            transformer.setOutputProperty(OutputKeys.INDENT, "yes");
            transformer.setOutputProperty(OutputKeys.ENCODING, "UTF-8");
            transformer.setOutputProperty("{http://xml.apache.org/xslt}indent-amount", "4");

            // Origen: el árbol DOM / Destino: el fichero en disco
            DOMSource origenDom = new DOMSource(doc);
            StreamResult destinoFichero = new StreamResult(destinoXml);

            transformer.transform(origenDom, destinoFichero);

            System.out.println("✅ Archivo XML generado y formateado con éxito en: " + destinoXml.getAbsolutePath());

        } catch (Exception e) {
            System.err.println("❌ Error al generar XML con Transformer: " + e.getMessage());
        }
    }

    private static Element crearElementoAlumno(Document doc, String expediente, String nombre, double nota) {
        Element elemAlumno = doc.createElement("alumno");
        elemAlumno.setAttribute("expediente", expediente); // Atributo

        Element elemNombre = doc.createElement("nombre");
        elemNombre.setTextContent(nombre);
        elemAlumno.appendChild(elemNombre);

        Element elemNota = doc.createElement("nota");
        elemNota.setTextContent(String.valueOf(nota));
        elemAlumno.appendChild(elemNota);

        return elemAlumno;
    }
}
```

#### 👨‍🏫 Guía para el Profesor en el Aula:
1. **Qué resaltar en la pizarra:** Si no configuran `OutputKeys.INDENT = "yes"` y la propiedad `{http://xml.apache.org/xslt}indent-amount`, todo el XML se escribe en una sola línea larguísima sin espacios, ilegible para un ser humano.
2. **La regla de oro del DOM:** No puedes hacer `new Element()`. Los elementos solo nacen a través de la factoría del documento: `doc.createElement("...")`.

---

### 📌 Actividad 3.3: Analizador Reactivo sin Memoria con SAX

- **Momento didáctico:** Tras explicar la Diapositiva 19 y el apartado 3.2 de los Apuntes.
- **Concepto clave:** SAX lee hacia adelante por eventos (*Push*). No construye ningún árbol. Es ultrarrápido y consume memoria plana (~0 KB). Se debe extender `DefaultHandler`.

#### 💻 Código de la Solución:
```java
package es.cifpaviles.ad.ut1.soluciones;

import java.io.File;
import javax.xml.parsers.SAXParser;
import javax.xml.parsers.SAXParserFactory;
import org.xml.sax.Attributes;
import org.xml.sax.SAXException;
import org.xml.sax.helpers.DefaultHandler;

public class SolucionActividad3_3 {

    public static void main(String[] args) {
        File archivoXml = new File("datos/catalogo.xml");

        try {
            // 1. Instanciar factoría y parser SAX
            SAXParserFactory factory = SAXParserFactory.newInstance();
            SAXParser saxParser = factory.newSAXParser();

            // 2. Crear nuestro manejador personalizado de eventos
            ManejadorCatalogoSAX handler = new ManejadorCatalogoSAX();

            // 3. Ejecutar el parseo reactivo
            System.out.println("⚡ Iniciando parseo SAX reactivo...");
            saxParser.parse(archivoXml, handler);

            // 4. Mostrar los resultados computados al vuelo
            System.out.println("\n📊 Resumen estadístico calculado por SAX:");
            System.out.println("  Total productos leídos: " + handler.getTotalProductos());
            System.out.printf("  Precio medio del catálogo: %.2f €%n", handler.calcularPrecioMedio());

        } catch (Exception e) {
            System.err.println("❌ Error en parseo SAX: " + e.getMessage());
        }
    }
}

/**
 * Manejador de eventos que hereda de DefaultHandler
 */
class ManejadorCatalogoSAX extends DefaultHandler {

    private StringBuilder acumuladorTexto = new StringBuilder();
    private int contadorProductos = 0;
    private double sumaPrecios = 0.0;
    private boolean dentroDePrecio = false;

    @Override
    public void startElement(String uri, String localName, String qName, Attributes attributes) throws SAXException {
        // Limpiamos el acumulador al entrar en cualquier etiqueta nueva
        acumuladorTexto.setLength(0);

        if (qName.equalsIgnoreCase("producto")) {
            contadorProductos++;
        } else if (qName.equalsIgnoreCase("precio")) {
            dentroDePrecio = true;
        }
    }

    @Override
    public void characters(char[] ch, int start, int length) throws SAXException {
        // Acumulamos los caracteres leídos (¡Ojo! El parser puede llamar varias veces a este método)
        acumuladorTexto.append(ch, start, length);
    }

    @Override
    public void endElement(String uri, String localName, String qName) throws SAXException {
        if (qName.equalsIgnoreCase("precio") && dentroDePrecio) {
            String textoPrecio = acumuladorTexto.toString().trim();
            double precio = Double.parseDouble(textoPrecio);
            sumaPrecios += precio;
            dentroDePrecio = false;
        }
    }

    public int getTotalProductos() {
        return contadorProductos;
    }

    public double calcularPrecioMedio() {
        return contadorProductos > 0 ? (sumaPrecios / contadorProductos) : 0.0;
    }
}
```

#### 👨‍🏫 Guía para el Profesor en el Aula:
1. **La gran trampa de SAX:** Explica por qué el método `characters()` **no garantiza entregar todo el texto en una sola llamada**. Si hay caracteres especiales o saltos de línea, el parser puede llamar a `characters()` 2 o 3 veces seguidas para la misma etiqueta. Por eso es obligatorio usar `StringBuilder.append()` y procesar el valor en `endElement()`.
2. **Comparativa en la Pizarra:** Recuerda a los alumnos: *"Para un fichero de 10 GB de facturas electrónicas de la Agencia Tributaria, DOM provocaría un OutOfMemoryError inmediato. SAX lo procesará con menos de 20 MB de memoria RAM sin inmutarse."*

---

### 📌 Actividad 3.4: Mapeo Declarativo Objeto-XML con JAXB

- **Momento didáctico:** Tras explicar la Diapositiva 20 y el apartado 3.4 de los Apuntes.
- **Concepto clave:** JAXB (*Jakarta XML Binding*) mapea clases POJO con etiquetas XML mediante anotaciones. Marshaller convierte de Objeto a XML; Unmarshaller convierte de XML a Objeto.

#### 💻 Código de la Solución:

**Paso 1: La entidad anotada con Jakarta / JAXB**
```java
package es.cifpaviles.ad.ut1.soluciones;

import jakarta.xml.bind.annotation.XmlAttribute;
import jakarta.xml.bind.annotation.XmlElement;
import jakarta.xml.bind.annotation.XmlRootElement;

@XmlRootElement(name = "curso")
public class Curso {

    private String codigo;
    private String nombre;
    private int horas;
    private String tutor;

    // Constructor sin argumentos obligatorio para que JAXB pueda instanciar la clase
    public Curso() {}

    public Curso(String codigo, String nombre, int horas, String tutor) {
        this.codigo = codigo;
        this.nombre = nombre;
        this.horas = horas;
        this.tutor = tutor;
    }

    @XmlAttribute(name = "codigo")
    public String getCodigo() { return codigo; }
    public void setCodigo(String codigo) { this.codigo = codigo; }

    @XmlElement(name = "denominacion")
    public String getNombre() { return nombre; }
    public void setNombre(String nombre) { this.nombre = nombre; }

    @XmlElement(name = "duracion_horas")
    public int getHoras() { return horas; }
    public void setHoras(int horas) { this.horas = horas; }

    @XmlElement(name = "tutor_responsable")
    public String getTutor() { return tutor; }
    public void setTutor(String tutor) { this.tutor = tutor; }

    @Override
    public String toString() {
        return String.format("Curso [Código=%s, Denominación='%s', Horas=%d, Tutor='%s']",
                             codigo, nombre, horas, tutor);
    }
}
```

**Paso 2: Programa de Marshalling y Unmarshalling**
```java
package es.cifpaviles.ad.ut1.soluciones;

import jakarta.xml.bind.JAXBContext;
import jakarta.xml.bind.Marshaller;
import jakarta.xml.bind.Unmarshaller;
import java.io.File;

public class SolucionActividad3_4 {

    public static void main(String[] args) {
        File destinoXml = new File("datos/curso_jaxb.xml");

        Curso cursoDam = new Curso("DAM2", "2º Desarrollo de Aplicaciones Multiplataforma", 1000, "Sergio Capdevila Díez");

        try {
            // 1. Crear el contexto JAXB indicando la clase raíz
            JAXBContext contexto = JAXBContext.newInstance(Curso.class);

            // =========================================================
            // 2. MARSHALLING: Objeto Java -> Fichero XML
            // =========================================================
            Marshaller marshaller = contexto.createMarshaller();
            // Formatear el XML con saltos de línea y sangrías
            marshaller.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true);

            marshaller.marshal(cursoDam, destinoXml);
            System.out.println("✅ Objeto Java serializado a XML con JAXB en: " + destinoXml.getAbsolutePath());

            // También lo mostramos directamente por consola
            System.out.println("\n📄 XML generado en consola:");
            marshaller.marshal(cursoDam, System.out);

            // =========================================================
            // 3. UNMARSHALLING: Fichero XML -> Objeto Java
            // =========================================================
            Unmarshaller unmarshaller = contexto.createUnmarshaller();
            Curso cursoLeido = (Curso) unmarshaller.unmarshal(destinoXml);

            System.out.println("\n📥 Objeto Java deserializado desde XML:");
            System.out.println("  " + cursoLeido);
            System.out.println("  Denominación leída: " + cursoLeido.getNombre());
            System.out.println("  Tutor leído: " + cursoLeido.getTutor());

        } catch (Exception e) {
            System.err.println("❌ Error en JAXB: " + e.getMessage());
            e.printStackTrace();
        }
    }
}
```

#### 👨‍🏫 Guía para el Profesor en el Aula:
1. **Requisito obligatorio de JAXB:** Toda clase vinculada con JAXB **debe tener un constructor vacío por defecto** `public Curso() {}`. Si se omite, JAXB lanzará `NoSuchMethodException` en tiempo de ejecución.
2. **Dependencias Maven en Java 11 o superior:** Recuerda a los alumnos que desde Java 9/11 JAXB no está incluido en el JDK base y se importa vía Maven (`jakarta.xml.bind-api` y `jaxb-runtime`).

---

## 🎯 Resumen y Recomendaciones Metodológicas de Aula

| Bloque | Actividades | Enfoque Metodológico | Reto Principal de los Alumnos |
| :--- | :---: | :--- | :--- |
| **1. Texto** | 1.1 a 1.5 | Demostrar por qué el charset UTF-8 es innegociable y cómo NIO.2 simplifica la sintaxis tradicional. | Entender cuándo usar `Files.readString()` vs cuándo usar `Files.lines()` en streaming para archivos grandes. |
| **2. Binarios** | 2.1 a 2.5 | Hacer visible que los datos binarios son puros bytes de máquina. Trabajar los offsets con calculadora en mano. | El Gran Reto 2.5: asimilar por qué Java escribe cabeceras duplicadas en modo append y cómo `MiObjectOutputStream` lo soluciona. |
| **3. XML** | 3.1 a 3.4 | Comparar visualmente en la pizarra el árbol DOM frente a la cinta transportadora de eventos de SAX. | La trampa de los nodos `#text` en DOM y el requisito del constructor vacío en entidades JAXB. |
