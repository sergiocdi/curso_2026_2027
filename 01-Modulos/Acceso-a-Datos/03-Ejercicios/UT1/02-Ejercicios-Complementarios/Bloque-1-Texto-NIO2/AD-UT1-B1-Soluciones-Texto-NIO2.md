---
tipo: solucionario_docente
modulo: "Acceso a Datos"
ud: "UD01"
bloque: "Bloque 1 - Ficheros de Texto Plano y Java NIO.2"
destinatario: profesor
---

# 🔑 Solucionario Docente: Bloque 1 - Ficheros de Texto Plano y Java NIO.2

> **Módulo**: [[MOC-Acceso-a-Datos|Acceso a Datos]] | **Ciclo**: DAM2 | **Unidad**: [[UD01-Manejo-de-Ficheros|UT1]]  
> **Hoja de Enunciados**: [[AD-UT1-B1-Ejercicios-Texto-NIO2|Ver Enunciados para Alumnos]]  
> **Docente**: Sergio Capdevila Díez · CIFP Avilés

---

## 💡 Solución Ejercicio 1: Validador y Normalizador de CSV (`ValidadorCSV.java`)

```java
package soluciones_b1;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;

public class ValidadorCSV {

    public static void main(String[] args) {
        Path rutaOrigen = Path.of("datos", "empleados_raw.csv");
        Path rutaDestino = Path.of("datos", "empleados_limpios.csv");
        Path rutaErrores = Path.of("datos", "empleados_errores.log");

        int lineasValidas = 0;
        int lineasRechazadas = 0;
        int numeroFila = 0;

        try (BufferedReader br = Files.newBufferedReader(rutaOrigen, StandardCharsets.ISO_8859_1);
             BufferedWriter bwLimpios = Files.newBufferedWriter(rutaDestino, StandardCharsets.UTF_8);
             BufferedWriter bwErrores = Files.newBufferedWriter(rutaErrores, StandardCharsets.UTF_8)) {

            String linea;
            // Escribir cabecera en el fichero destino
            if ((linea = br.readLine()) != null) {
                numeroFila++;
                bwLimpios.write(linea);
                bwLimpios.newLine();
            }

            while ((linea = br.readLine()) != null) {
                numeroFila++;
                String lineaTrim = linea.trim();
                if (lineaTrim.isEmpty()) {
                    continue; // Ignorar líneas en blanco
                }

                String[] campos = linea.split(";", -1);
                if (campos.length != 5) {
                    bwErrores.write(String.format("[LÍNEA %d] Error: Número de campos incorrecto (%d esperados: 5) -> %s%n",
                            numeroFila, campos.length, linea));
                    lineasRechazadas++;
                    continue;
                }

                String dni = campos[0].trim();
                String nombre = campos[1].trim();
                String departamento = campos[2].trim();
                String salarioStr = campos[3].trim();
                String fechaAlta = campos[4].trim();

                if (dni.isBlank()) {
                    bwErrores.write(String.format("[LÍNEA %d] Error: DNI vacío -> %s%n", numeroFila, linea));
                    lineasRechazadas++;
                    continue;
                }

                double salario;
                try {
                    salario = Double.parseDouble(salarioStr);
                    if (salario <= 0) {
                        throw new NumberFormatException("Salario negativo o cero");
                    }
                } catch (NumberFormatException e) {
                    bwErrores.write(String.format("[LÍNEA %d] Error: Salario inválido ('%s') -> %s%n",
                            numeroFila, salarioStr, linea));
                    lineasRechazadas++;
                    continue;
                }

                // Si supera las validaciones, escribir en el fichero normalizado
                bwLimpios.write(String.format("%s;%s;%s;%.2f;%s", dni, nombre, departamento, salario, fechaAlta));
                bwLimpios.newLine();
                lineasValidas++;
            }

            System.out.printf("✅ Proceso completado: %d válidos, %d rechazados.%n", lineasValidas, lineasRechazadas);

        } catch (IOException e) {
            System.err.println("Error crítico de E/S: " + e.getMessage());
        }
    }
}
```

---

## 💡 Solución Ejercicio 2: Generador de Informes de Ventas (`GeneradorInforme.java`)

```java
package soluciones_b1;

import java.io.*;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.Locale;

public class GeneradorInforme {

    public static void main(String[] args) {
        Path entrada = Path.of("datos", "ventas_diarias.txt");
        File salida = new File("datos/informe_ventas.txt");

        double totalFacturacion = 0;
        int totalUnidades = 0;
        int numTiendas = 0;
        String tiendaLider = "";
        double maxVentas = -1;

        try (BufferedReader br = Files.newBufferedReader(entrada, StandardCharsets.UTF_8);
             PrintWriter pw = new PrintWriter(new BufferedWriter(new FileWriter(salida, StandardCharsets.UTF_8)))) {

            pw.println("===============================================================================");
            pw.println("                 INFORME DIARIO DE LIQUIDACIÓN DE TIENDAS                      ");
            pw.println("                      CIFP AVILÉS · RED DE VENTAS                              ");
            pw.println("===============================================================================");
            pw.printf(Locale.US, "%-6s %-22s %12s %8s %14s%n", "ID", "CIUDAD", "IMPORTE NETO", "UNIDADES", "TICKET MEDIO");
            pw.println("-------------------------------------------------------------------------------");

            String linea;
            while ((linea = br.readLine()) != null) {
                if (linea.isBlank() || linea.startsWith("#")) continue;

                String[] p = linea.split("\\|");
                String id = p[0].trim();
                String ciudad = p[1].trim();
                double importe = Double.parseDouble(p[2].trim());
                int unidades = Integer.parseInt(p[3].trim());

                double ticketMedio = unidades > 0 ? (importe / unidades) : 0;
                totalFacturacion += importe;
                totalUnidades += unidades;
                numTiendas++;

                if (importe > maxVentas) {
                    maxVentas = importe;
                    tiendaLider = ciudad;
                }

                pw.printf(Locale.US, "%-6s %-22s %10.2f € %8d %12.2f €%n",
                        id, ciudad, importe, unidades, ticketMedio);
            }

            double mediaPorTienda = numTiendas > 0 ? (totalFacturacion / numTiendas) : 0;

            pw.println("===============================================================================");
            pw.printf(Locale.US, "TOTALES: %d Tiendas | %d Unidades Vendidas | Facturación Total: %10.2f €%n",
                    numTiendas, totalUnidades, totalFacturacion);
            pw.printf(Locale.US, "PROMEDIO POR TIENDA: %10.2f € | TIENDA LÍDER: %s (%.2f €)%n",
                    mediaPorTienda, tiendaLider, maxVentas);
            pw.println("===============================================================================");

            System.out.println("✅ Informe generado con éxito en: " + salida.getPath());

        } catch (IOException e) {
            System.err.println("Error procesando ventas: " + e.getMessage());
        }
    }
}
```

---

## 💡 Solución Ejercicio 3: Analizador Forense con Java NIO.2 y Streams (`LogAnalyzerNIO.java`)

```java
package soluciones_b1;

import java.io.IOException;
import java.io.PrintWriter;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.Map;
import java.util.stream.Collectors;
import java.util.stream.Stream;

public class LogAnalyzerNIO {

    public static void main(String[] args) {
        Path logPath = Path.of("datos", "access.log");
        Path alertasPath = Path.of("datos", "peticiones_sospechosas.txt");

        try {
            // 1. Total de peticiones (Stream directo sin almacenar en memoria)
            try (Stream<String> lineas = Files.lines(logPath, StandardCharsets.UTF_8)) {
                long total = lineas.count();
                System.out.println("1. Total de peticiones auditadas: " + total);
            }

            // 2. Filtrado de HTTP >= 400 y volcado con PrintWriter
            try (Stream<String> lineas = Files.lines(logPath, StandardCharsets.UTF_8);
                 PrintWriter pw = new PrintWriter(Files.newBufferedWriter(alertasPath, StandardCharsets.UTF_8))) {

                long errores = lineas.filter(l -> {
                    String[] partes = l.split(" ");
                    if (partes.length >= 9) {
                        try {
                            int status = Integer.parseInt(partes[partes.length - 2]);
                            return status >= 400;
                        } catch (NumberFormatException ignored) {}
                    }
                    return false;
                }).peek(pw::println).count();

                System.out.println("2. Peticiones de error (>=400) registradas en alertas: " + errores);
            }

            // 3. Suma de bytes transmitidos por respuestas 200 OK
            try (Stream<String> lineas = Files.lines(logPath, StandardCharsets.UTF_8)) {
                long bytesTotales = lineas
                        .filter(l -> l.contains("\" 200 "))
                        .mapToLong(l -> {
                            String[] partes = l.split(" ");
                            try {
                                return Long.parseLong(partes[partes.length - 1]);
                            } catch (Exception e) {
                                return 0L;
                            }
                        })
                        .sum();

                System.out.printf("3. Bytes totales transferidos con éxito (200 OK): %,d bytes (%.2f MB)%n",
                        bytesTotales, (bytesTotales / (1024.0 * 1024.0)));
            }

            // 4. Top 3 Direcciones IP más activas (groupingBy + limit)
            try (Stream<String> lineas = Files.lines(logPath, StandardCharsets.UTF_8)) {
                System.out.println("4. Top 3 Direcciones IP más activas:");
                lineas.map(l -> l.split(" ")[0].trim())
                      .collect(Collectors.groupingBy(ip -> ip, Collectors.counting()))
                      .entrySet().stream()
                      .sorted(Map.Entry.<String, Long>comparingByValue().reversed())
                      .limit(3)
                      .forEach(entry -> System.out.printf("   - IP: %-15s -> %d peticiones%n", entry.getKey(), entry.getValue()));
            }

        } catch (IOException e) {
            System.err.println("Error en lectura NIO.2: " + e.getMessage());
        }
    }
}
```
