---
tipo: ejercicio
modulo: "Acceso a Datos"
ud: "UD01"
ra_asociados: ["RA1"]
ce_asociados: ["CE1.a", "CE1.b"]
tipo_actividad: evaluable
dificultad: media
tiempo_estimado_min: 90
rubrica: "[[Rubrica-Practicas-Programacion]]"
---

# 💻 Práctica: Analizador y Filtrador de Logs de Servidor Web

> **Módulo**: [[MOC-Acceso-a-Datos\|Acceso a Datos]] | **UD**: [[UD01-Manejo-de-Ficheros\|UD01]] | **RAs**: `RA1 (CE1.a, CE1.b)` | **Tiempo**: `90 min`

---

## 📋 Enunciado
Se proporciona un fichero de texto con el formato habitual de log de acceso Apache/Nginx (`access.log`).
Debes construir una aplicación en Java que:
1. Lea el fichero línea a línea mediante flujos con búfer eficientes.
2. Filtre aquellas peticiones que hayan devuelto un código de estado HTTP `404` (Not Found) o `500` (Internal Server Error).
3. Escriba las peticiones erróneas en un nuevo archivo `errores.log` indicando fecha, IP y código de estado.
4. Genere un informe final por pantalla con el número total de líneas leídas y el porcentaje de errores.

---

## 🛠️ Requisitos Técnicos
- Uso estricto de `try-with-resources`.
- Captura de excepciones específicas (`FileNotFoundException`, `IOException`).
- Manejo de rutas relativas y absolutas mediante `java.nio.file.Path`.

---

## 🔑 Solución Modelo (Profesor)
> [!NOTE]- Ver Solución (Haz clic para desplegar)
> ```java
> import java.io.BufferedReader;
> import java.io.BufferedWriter;
> import java.io.IOException;
> import java.nio.file.Files;
> import java.nio.file.Path;
> import java.nio.file.Paths;
> 
> public class LogAnalyzer {
>     public static void main(String[] args) {
>         Path entrada = Paths.get("data", "access.log");
>         Path salida = Paths.get("data", "errores.log");
>         
>         int total = 0, errores = 0;
>         try (BufferedReader reader = Files.newBufferedReader(entrada);
>              BufferedWriter writer = Files.newBufferedWriter(salida)) {
>              
>             String linea;
>             while ((linea = reader.readLine()) != null) {
>                 total++;
>                 if (linea.contains(" 404 ") || linea.contains(" 500 ")) {
>                     writer.write(linea);
>                     writer.newLine();
>                     errores++;
>                 }
>             }
>             System.out.printf("Proceso completado. Total: %d, Errores: %d (%.2f%%)%n", 
>                 total, errores, (errores * 100.0 / total));
>         } catch (IOException e) {
>             System.err.println("Error procesando fichero: " + e.getMessage());
>         }
>     }
> }
> ```
