---
tipo: ejercicio
modulo: "Acceso a Datos"
ud: "UD01"
ra_asociados: ["RA1"]
ce_asociados: ["CE1.a", "CE1.b"]
tipo_actividad: practica_guiada
dificultad: basica-media
tiempo_estimado_min: 60
entregable: codigo_fuente
estado: listo
---

# 💻 Ejercicio: Procesador de Logs y Configuraciones con java.io y Java NIO.2

> **Módulo**: [[MOC-Acceso-a-Datos|Acceso a Datos]] | **UD**: [[UD01-Manejo-de-Ficheros|UD01 / UT1]] | **Conceptos**: [[CON-AD-01-Flujos-Streams-Java|Ficheros de Texto y NIO.2]]

---

## 🎯 Objetivo Pedagógico
En este ejercicio aprenderás a procesar ficheros de texto en dos escenarios profesionales reales:
1. **Lectura y escritura clásica con Buffer**: Sanitizar y normalizar un fichero de configuración con codificación conflictiva.
2. **Procesamiento masivo y reactivo con Java NIO.2 y Streams**: Filtrar incidencias críticas de un fichero de log de servidor sin saturar la memoria RAM.

---

## 📝 Enunciado de la Actividad

### Parte 1: Normalizador de Configuración (`ConfigSanitizer.java`)
Una empresa dispone de un archivo legacy `servidor.ini` generado en Windows con codificación `ISO-8859-1`. Tu programa debe:
1. Leer el fichero línea a línea utilizando `BufferedReader` especificando `StandardCharsets.ISO_8859_1`.
2. Omitir las líneas que comiencen por `#` o `;` (comentarios) y las líneas vacías o en blanco.
3. Para cada parámetro `clave=valor`, convertir la clave a mayúsculas y limpiar espacios sobrantes (`trim()`).
4. Escribir el resultado normalizado en un nuevo archivo `servidor_normalizado.cfg` en **UTF-8** utilizando `BufferedWriter`.

### Parte 2: Extractor de Logs Críticos con NIO.2 (`LogAnalyzerNIO.java`)
Se te proporciona un log de servidor `app-server.log` (puede tener cientos de miles de líneas). Empleando la clase `java.nio.file.Files`:
1. Utilizar `Files.lines(Path)` dentro de un bloque `try-with-resources`.
2. Filtrar únicamente las líneas que contengan `[CRITICAL]` o `[FATAL]`.
3. Contar el número total de errores y escribir en un fichero resumen `errores_criticos.txt` las líneas filtradas precedidas de un contador secuencial.

---

## 💡 Código de Partida y Pistas Didácticas

```java
import java.io.*;
import java.nio.charset.StandardCharsets;
import java.nio.file.*;
import java.util.stream.Stream;

public class SolucionTextoNIO {

    public static void normalizarConfiguracion(Path origen, Path destino) throws IOException {
        try (BufferedReader br = Files.newBufferedReader(origen, StandardCharsets.ISO_8859_1);
             BufferedWriter bw = Files.newBufferedWriter(destino, StandardCharsets.UTF_8)) {
            
            String linea;
            while ((linea = br.readLine()) != null) {
                linea = linea.trim();
                if (linea.isEmpty() || linea.startsWith("#") || linea.startsWith(";")) {
                    continue; // Omitir comentarios y líneas vacías
                }
                
                if (linea.contains("=")) {
                    String[] partes = linea.split("=", 2);
                    String clave = partes[0].trim().toUpperCase();
                    String valor = partes[1].trim();
                    bw.write(clave + "=" + valor);
                    bw.newLine();
                }
            }
        }
    }

    public static long extraerErroresCriticos(Path logOrigen, Path salidaResumen) throws IOException {
        try (Stream<String> lineas = Files.lines(logOrigen, StandardCharsets.UTF_8);
             PrintWriter pw = new PrintWriter(Files.newBufferedWriter(salidaResumen, StandardCharsets.UTF_8))) {
            
            final int[] contador = {1};
            lineas.filter(l -> l.contains("[CRITICAL]") || l.contains("[FATAL]"))
                  .forEach(l -> pw.printf("[%04d] %s%n", contador[0]++, l));
            
            return contador[0] - 1;
        }
    }
}
```

---

## 🔍 Criterios de Evaluación
- **Uso estricto de `try-with-resources`**: 30%.
- **Correcto tratamiento de codificaciones (`StandardCharsets`)**: 25%.
- **Uso adecuado de Buffers y prevención de fugas de memoria**: 25%.
- **Manejo controlado de excepciones de I/O (`NoSuchFileException`, etc.)**: 20%.
