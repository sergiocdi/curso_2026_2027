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
> **Entorno de Trabajo**: Eclipse IDE 2024/2025 o IntelliJ IDEA con **Java SE 21 LTS**. Proyecto de aula: `UT01_ManejoFicheros`.

---

## 🎯 Metodología y Dinámica de Trabajo en el Aula

Este cuaderno contiene **14 actividades prácticas guiadas paso a paso**, organizadas en estricta sincronía con las diapositivas de clase y los apuntes de la unidad.

Cada vez que en la presentación o en los apuntes aparezca el aviso:
> **💻 Práctica en Vivo en Aula: Actividad X.Y**

El alumnado detendrá la toma de notas teóricas, abrirá su IDE y desarrollará en el paquete correspondiente la actividad indicada. Cada actividad está diseñada para completarse en **10–15 minutos**, consolidando la instrucción Java recién explicada.

### Estructura de Carpetas Recomendada en el Proyecto:
```text
UT01_ManejoFicheros/
├── src/
│   ├── act1_texto/       (Actividades 1.1 a 1.5)
│   ├── act2_binarios/    (Actividades 2.1 a 2.5)
│   └── act3_xml/         (Actividades 3.1 a 3.4)
└── datos/                (Ficheros de entrada y salida generados)
```

---

## 🔤 BLOQUE 1: Ficheros de Texto Plano (java.io y Java NIO.2)

---

### 📌 Actividad 1.1: Diagnóstico de Charset y Conversión ISO-8859-1 a UTF-8

- **Momento didáctico**: Tras explicar la **Diapositiva 03** (Charsets, UTF-8 y Mojibake).
- **Problema profesional**: Migración de ficheros legados exportados por bases de datos antiguas en Windows (`ISO-8859-1` o `Windows-1252`) hacia servidores web modernos en Linux (`UTF-8`), donde caracteres como tildes, eñes y diéresis se rompen visualmente (*Mojibake*).
- **Datos de prueba (`datos/usuarios_legacy.txt`)**:
  Crea este archivo en la carpeta `datos/` asegurándote de guardarlo con codificación `ISO-8859-1` (en Eclipse: clic derecho en el archivo → *Properties* → *Resource* → *Text file encoding* → *Other: ISO-8859-1*):
  ```text
  1;García;Administración;garcia@empresa.com
  2;Muñoz;Diseño Gráfico;munoz@empresa.com
  3;Peña;Logística y Almacén;pena@empresa.com
  ```

#### 🛠️ Instrucciones Java Obligatorias:
| Clase / Método | Parámetros | Utilidad en la Actividad |
| :--- | :--- | :--- |
| `Files.newBufferedReader(Path, Charset)` | `Path origen, StandardCharsets.ISO_8859_1` | Abre flujo de lectura decodificando los bytes en ISO-8859-1. |
| `Files.newBufferedWriter(Path, Charset)` | `Path destino, StandardCharsets.UTF_8` | Abre flujo de escritura codificando en UTF-8 estándar. |
| `br.readLine()` | Ninguno | Lee una línea completa hasta encontrar `\n` o `\r\n`. Retorna `null` al llegar al final. |
| `bw.write(String)` y `bw.newLine()` | Cadena de texto | Escribe la línea y añade el separador de salto de línea nativo del sistema. |

#### 📝 Procedimiento Paso a Paso:
1. Crea la clase `Actividad1_1_Charset` en el paquete `act1_texto`.
2. Dentro del método `main`, define las rutas:
   `Path origen = Path.of("datos", "usuarios_legacy.txt");`  
   `Path destino = Path.of("datos", "usuarios_utf8.txt");`
3. Abre ambos flujos dentro de un bloque `try-with-resources` para garantizar el cierre automático.
4. Implementa un bucle `while ((linea = br.readLine()) != null)`.
5. Por cada línea leída, escríbela en el destino con `bw.write(linea)` y añade el salto con `bw.newLine()`.
6. Muestra un mensaje por consola indicando el total de líneas convertidas.

#### 💻 Código Esqueleto de Trabajo:
```java
package act1_texto;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;

public class Actividad1_1_Charset {
    public static void main(String[] args) {
        Path origen = Path.of("datos", "usuarios_legacy.txt");
        Path destino = Path.of("datos", "usuarios_utf8.txt");

        // TODO: Abrir con try-with-resources BufferedReader en ISO-8859-1 y BufferedWriter en UTF-8
        // TODO: Bucle de lectura línea a línea con br.readLine()
        // TODO: Escribir cada línea con bw.write() y bw.newLine()
        // TODO: Imprimir confirmación por consola
    }
}
```

#### ✅ Comprobación y Resultado Esperado:
- Abre `datos/usuarios_utf8.txt` en Eclipse o el Bloc de notas: palabras como **Administración**, **Diseño** y **Logística** deben verse perfectas.
- La consola debe imprimir: `✅ Migración completada con éxito. 3 líneas convertidas a UTF-8.`
- ⚠️ **Alerta de error típico**: Olvidar `bw.newLine()`. Si no lo pones, todas las líneas se escribirán pegadas en una sola línea continua.

---

### 📌 Actividad 1.2: Filtrado y Normalización con BufferedReader y BufferedWriter

- **Momento didáctico**: Tras explicar la **Diapositiva 04** (Patrón Decorador y Buffers).
- **Problema profesional**: Sanitizar ficheros de configuración `.ini` sucios antes de que una aplicación los cargue, eliminando líneas vacías, comentarios y espacios en blanco, y normalizando las claves a mayúsculas.
- **Datos de prueba (`datos/config.ini`)**:
  ```ini
  # Configuración General del Servidor
  ; Parámetros de Red
  servidor = 192.168.1.50
  puerto = 8080

  # Ajustes de Seguridad
  ssl_enabled = true
  timeout_segundos = 30
  ```

#### 🛠️ Instrucciones Java Obligatorias:
| Método | Clase | Utilidad en la Actividad |
| :--- | :--- | :--- |
| `linea.trim()` | `String` | Elimina espacios en blanco iniciales y finales. |
| `linea.startsWith("#")` / `linea.startsWith(";")` | `String` | Detecta si la línea es un comentario. |
| `linea.split("=", 2)` | `String` | Divide la línea en exactamente 2 partes: clave y valor. |
| `bw.newLine()` | `BufferedWriter` | Inserta salto de línea multiplataforma. |

#### 📝 Procedimiento Paso a Paso:
1. Crea la clase `Actividad1_2_ConfigSanitizer`.
2. Lee `datos/config.ini` línea a línea con `BufferedReader`.
3. Aplica la lógica de filtrado:
   - Limpia con `linea = linea.trim()`.
   - Si `linea.isEmpty()`, `linea.startsWith("#")` o `linea.startsWith(";")`, descártala con `continue`.
4. Divide la línea válida por el delimitador `=` con `split("=", 2)`.
5. Convierte la clave a mayúsculas (`partes[0].trim().toUpperCase()`) y conserva el valor (`partes[1].trim()`).
6. Escribe en `datos/config_clean.ini` con el formato `CLAVE=VALOR`.

#### 💻 Código Esqueleto de Trabajo:
```java
package act1_texto;

import java.io.*;
import java.nio.charset.StandardCharsets;
import java.nio.file.*;

public class Actividad1_2_ConfigSanitizer {
    public static void main(String[] args) {
        Path origen = Path.of("datos", "config.ini");
        Path destino = Path.of("datos", "config_clean.ini");

        // TODO: Configurar try-with-resources con Files.newBufferedReader y Files.newBufferedWriter
        // TODO: Leer línea a línea
        // TODO: Filtrar comentarios (# y ;) y líneas vacías
        // TODO: Transformar clave a mayúsculas y escribir en destino
    }
}
```

#### ✅ Comprobación y Resultado Esperado:
- El fichero `config_clean.ini` debe contener exactamente 4 líneas sin espacios sobrantes:
  ```ini
  SERVIDOR=192.168.1.50
  PUERTO=8080
  SSL_ENABLED=true
  TIMEOUT_SEGUNDOS=30
  ```
- ⚠️ **Alerta de error típico**: Usar `split("=")` sin el parámetro `2`. Si un valor contiene un signo igual (ej. `token=abc=123`), se fragmentaría incorrectamente.

---

### 📌 Actividad 1.3: Generador de Informe Formateado con PrintWriter

- **Momento didáctico**: Tras explicar la **Diapositiva 05** (Escritura y Formateo con PrintWriter).
- **Problema profesional**: Generación de informes impresos o tickets de facturación donde las columnas de texto deben quedar alineadas a la izquierda y los importes monetarios a la derecha con 2 decimales y el símbolo del euro.

#### 🛠️ Instrucciones Java Obligatorias:
| Instrucción | Utilidad |
| :--- | :--- |
| `new PrintWriter(new BufferedWriter(new FileWriter(...)))` | Cadena de decoradores para escritura formateada de alto rendimiento. |
| `pw.printf(formato, args...)` | Aplica máscaras de formato idénticas a C/POSIX. |
| `%-12s` | Cadena de 12 caracteres alineada a la **izquierda** (rellena con espacios). |
| `%8.2f€` | Número decimal de 8 caracteres con 2 decimales alineado a la **derecha**. |
| `%n` | Salto de línea portable independiente del sistema operativo. |

#### 📝 Procedimiento Paso a Paso:
1. Crea la clase `Actividad1_3_FacturaPrintWriter`.
2. Instancia `PrintWriter` sobre `datos/factura.txt` especificando `StandardCharsets.UTF_8`.
3. Imprime una cabecera formal con `pw.println()` y una línea divisoria de guiones (`-`).
4. Imprime las cabeceras de columnas: `REF`, `DESCRIPCIÓN`, `PRECIO`, `UDS`, `SUBTOTAL`.
5. Escribe 3 líneas de artículos utilizando `pw.printf` con alineaciones fijas:
   - `PORT-01`, `Portátil 15 Pulgadas`, `750.50`, `2`
   - `RAT-02`, `Ratón Inalámbrico`, `18.90`, `5`
   - `MON-03`, `Monitor 27 IPS`, `199.99`, `1`
6. Imprime el pie de factura calculando la Base Imponible, IVA (21%) y Total.

#### 💻 Código Esqueleto de Trabajo:
```java
package act1_texto;

import java.io.*;
import java.nio.charset.StandardCharsets;

public class Actividad1_3_FacturaPrintWriter {
    public static void main(String[] args) {
        File f = new File("datos/factura.txt");

        // TODO: Crear PrintWriter envolviendo BufferedWriter y FileWriter en UTF-8
        // TODO: Imprimir título del informe
        // TODO: Usar pw.printf con máscaras %-10s, %-25s, %8.2f€, %5d, %10.2f€%n
        // TODO: Imprimir totales calculados
    }
}
```

#### ✅ Comprobación y Resultado Esperado:
- En `datos/factura.txt` las columnas de precios deben quedar milimétricamente alineadas por la coma decimal:
  ```text
  ========================================================================
  REF        DESCRIPCIÓN                   PRECIO    UDS       TOTAL
  ========================================================================
  PORT-01    Portátil 15 Pulgadas         750,50€      2    1501,00€
  RAT-02     Ratón Inalámbrico             18,90€      5      94,50€
  MON-03     Monitor 27 IPS               199,99€      1     199,99€
  ------------------------------------------------------------------------
  TOTAL FACTURA:                                            1795,49€
  ========================================================================
  ```

---

### 📌 Actividad 1.4: Operaciones Instantáneas con Java NIO.2 (Files)

- **Momento didáctico**: Tras explicar la **Diapositiva 06** (API Moderna NIO.2: Paths y Files).
- **Problema profesional**: Escribir o leer configuraciones atómicas completas (archivos `.properties` o `.json` pequeños) en una única línea de código limpio, sin bucles de lectura manuales.

#### 🛠️ Instrucciones Java Obligatorias:
| Método | Retorno | Utilidad |
| :--- | :--- | :--- |
| `Files.writeString(Path, CharSequence, OpenOption...)` | `Path` | Escribe todo el texto de golpe en el archivo en UTF-8 por defecto. |
| `Files.readString(Path)` | `String` | Lee todo el contenido del archivo y lo devuelve en un único `String`. |
| `Files.size(Path)` | `long` | Devuelve el tamaño físico en bytes del archivo en disco. |
| `Files.exists(Path)` | `boolean` | Comprueba si el fichero o directorio existe realmente. |

#### 📝 Procedimiento Paso a Paso:
1. Crea la clase `Actividad1_4_NIO2Files`.
2. Define un `String` con 3 propiedades de base de datos:
   `String config = "db.host=localhost\ndb.port=3306\ndb.user=admin\ndb.pass=secret";`
3. Guárdalo en `datos/database.properties` con `Files.writeString()`.
4. Comprueba con `Files.exists()` y muestra su tamaño en disco con `Files.size()`.
5. Recupéralo en otra variable con `Files.readString(path)` e imprímelo por pantalla.

#### ✅ Comprobación y Resultado Esperado:
- Consola:
  ```text
  ✅ Fichero creado. Tamaño en disco: 66 bytes.
  --- Contenido Recuperado ---
  db.host=localhost
  db.port=3306
  db.user=admin
  db.pass=secret
  ```
- ⚠️ **Alerta de error típico**: Nunca uses `readString()` en archivos de cientos de megabytes o gigabytes, ya que intentará cargar todo el archivo en la memoria RAM y colapsará la JVM con `OutOfMemoryError`.

---

### 📌 Actividad 1.5: Filtrado de Logs Masivos con Files.lines() (Stream Reactivo)

- **Momento didáctico**: Tras explicar la **Diapositiva 07** (Procesamiento masivo sin OutOfMemoryError).
- **Problema profesional**: Analizar un archivo de trazas de servidor (`app.log`) que contiene miles de líneas para filtrar incidencias críticas sin saturar la memoria RAM del servidor.
- **Datos de prueba (`datos/app.log`)**:
  ```text
  2026-09-17 10:00:01 [INFO] Sistema iniciado correctamente
  2026-09-17 10:01:15 [ERROR] Error de conexión con pasarela de pago (Timeout)
  2026-09-17 10:02:22 [DEBUG] Consultando balance de usuario 450
  2026-09-17 10:03:40 [ERROR] NullPointerException en ServicioInventario.actualizarStock()
  2026-09-17 10:05:00 [INFO] Backup programado ejecutado
  ```

#### 🛠️ Instrucciones Java Obligatorias:
| Instrucción | Tipo | Utilidad |
| :--- | :--- | :--- |
| `Files.lines(Path)` | `Stream<String>` | Abre un flujo reactivo perezoso (*lazy*) que lee línea a línea bajo demanda. |
| `.filter(l -> l.contains("[ERROR]"))` | Operación intermedia | Conserva únicamente las líneas que coinciden con el predicado. |
| `.count()` | Operación terminal | Cuenta el total de elementos que pasaron el filtro. |
| `try (Stream<String> lineas = Files.lines(...))` | Cierre de recursos | **Obligatorio** para liberar el descriptor del fichero en el SO. |

#### 📝 Procedimiento Paso a Paso:
1. Crea la clase `Actividad1_5_LogStreaming`.
2. Abre `datos/app.log` con `Files.lines()` dentro de un bloque `try-with-resources`.
3. Aplica un filtro para seleccionar las líneas que contengan `[ERROR]`.
4. Vuelca las líneas detectadas a `datos/alertas.txt` y cuenta cuántos errores hubo.
5. Imprime por consola: `Total de incidencias críticas localizadas: X`.

#### ✅ Comprobación y Resultado Esperado:
- En `datos/alertas.txt` deben figurar exclusivamente las 2 líneas `[ERROR]`.
- La consola debe imprimir: `Total de incidencias críticas localizadas: 2`.
- ⚠️ **Alerta de error típico**: No cerrar el Stream con `try-with-resources`. En Windows, si dejas el Stream abierto, el archivo quedará bloqueado y no podrás borrarlo ni renombrarlo.

---

## 🔢 BLOQUE 2: Ficheros Binarios y Serialización de Objetos

---

### 📌 Actividad 2.1: Telemetría de Sensores con DataOutputStream

- **Momento didáctico**: Tras explicar la **Diapositiva 09** (DataStreams y Tipos Primitivos).
- **Problema profesional**: Enviar y almacenar mediciones de sensores industriales (temperatura, presión, estado) con el mínimo peso posible en disco, guardando los datos numéricos en su representación binaria nativa (4 u 8 bytes) en lugar de cadenas de caracteres.

#### 🛠️ Instrucciones Java Obligatorias:
| Método de `DataOutputStream` | Bytes en Disco | Utilidad |
| :--- | :---: | :--- |
| `writeInt(int v)` | **4** | Escribe un entero de 32 bits en formato big-endian. |
| `writeUTF(String str)` | **2 + N** | Escribe 2 bytes con la longitud del texto seguidos de los bytes UTF-8. |
| `writeDouble(double v)` | **8** | Escribe un número de coma flotante de 64 bits (IEEE 754). |
| `writeBoolean(boolean v)` | **1** | Escribe `0x01` para `true` o `0x00` para `false`. |

#### 📝 Procedimiento Paso a Paso:
1. Crea la clase `Actividad2_1_DataOutputStream`.
2. Instancia `DataOutputStream` envolviendo `BufferedOutputStream` y `FileOutputStream` sobre `datos/telemetria.dat`.
3. Escribe 3 registros de sensores con la siguiente estructura fija:
   - Sensor 1: ID `101`, Nombre `"Caldera Central"`, Temperatura `84.5`, Alarma `false`.
   - Sensor 2: ID `102`, Nombre `"Turbina 01"`, Temperatura `102.3`, Alarma `true`.
   - Sensor 3: ID `103`, Nombre `"Compresor Gas"`, Temperatura `45.0`, Alarma `false`.
4. Cierra el flujo y consulta el explorador de archivos: comprueba que el archivo mide menos de 75 bytes.
5. Intenta abrirlo con el Bloc de notas para verificar que los números son ilegibles (binarios puros).

#### 💻 Código Esqueleto de Trabajo:
```java
package act2_binarios;

import java.io.*;

public class Actividad2_1_DataOutputStream {
    public static void main(String[] args) {
        File f = new File("datos/telemetria.dat");

        try (DataOutputStream dos = new DataOutputStream(
                new BufferedOutputStream(new FileOutputStream(f)))) {
            
            // Sensor 1
            dos.writeInt(101);
            dos.writeUTF("Caldera Central");
            dos.writeDouble(84.5);
            dos.writeBoolean(false);

            // TODO: Escribir Sensor 2 y Sensor 3 con el mismo orden de tipos
            
            System.out.println("✅ Datos binarios guardados. Tamaño: " + f.length() + " bytes.");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
```

---

### 📌 Actividad 2.2: Detección Limpia de Fin de Archivo con EOFException

- **Momento didáctico**: Tras explicar la **Diapositiva 10** (Trampa de Examen: EOFException).
- **Problema profesional**: Leer un fichero binario secuencial completo con `DataInputStream`. Como métodos como `readInt()` o `readDouble()` devuelven valores numéricos válidos (un `-1` puede ser un sensor a -1ºC), no pueden devolver `-1` ni `null` al llegar al final. En su lugar, lanzan obligatoriamente `EOFException`.

#### 🛠️ Instrucciones Java Obligatorias:
| Instrucción | Utilidad |
| :--- | :--- |
| `dis.readInt()`, `dis.readUTF()`, `dis.readDouble()`, `dis.readBoolean()` | Leen los bytes en el orden exacto. |
| `while (true) { ... }` | Bucle infinito canónico de lectura binaria en Java. |
| `catch (EOFException e)` | Captura la señal de fin de fichero para terminar el bucle de forma limpia. |

#### 📝 Procedimiento Paso a Paso:
1. Crea la clase `Actividad2_2_DataInputStreamEOF`.
2. Abre `datos/telemetria.dat` con `DataInputStream` sobre `BufferedInputStream`.
3. Crea un bucle `while (true)`. Dentro, lee secuencialmente: `int id = dis.readInt(); String nom = dis.readUTF(); double temp = dis.readDouble(); boolean alr = dis.readBoolean();`.
4. Muestra cada sensor por consola con formato.
5. Captura `EOFException`: fuera del bucle, imprime `--- Fin de fichero alcanzado con éxito ---`.

#### ✅ Comprobación y Resultado Esperado:
- Consola:
  ```text
  [Sensor 101] Caldera Central - Temp: 84.50ºC - Alarma: NO
  [Sensor 102] Turbina 01 - Temp: 102.30ºC - Alarma: ¡SÍ!
  [Sensor 103] Compresor Gas - Temp: 45.00ºC - Alarma: NO
  --- Fin de fichero alcanzado con éxito (3 sensores procesados) ---
  ```
- ⚠️ **Alerta de error típico**: Cambiar el orden de lectura (ej. intentar leer primero `readDouble` y luego `readInt`). Los bytes quedarán desfasados y obtendrás datos totalmente corruptos o errores `UTFDataFormatException`.

---

### 📌 Actividad 2.3: Modificación Directa con RandomAccessFile (RAF)

- **Momento didáctico**: Tras explicar las **Diapositivas 11 y 12** (RAF y Registros Fijos).
- **Problema profesional**: En un fichero de 100.000 empleados, actualizar el salario de un empleado concreto sin reescribir los gigabytes restantes del archivo, saltando directamente al byte físico en el disco con `seek()`.
- **Estructura del Registro Fijo de Empleado (36 Bytes)**:
  - `id` (`int`): 4 bytes.
  - `apellido` (String de 10 caracteres con `writeChars`): $10 \times 2 = 20\text{ bytes}$.
  - `departamento` (`int`): 4 bytes.
  - `salario` (`double`): 8 bytes.
  - **Fórmula de inicio de registro `i`**: `offset_registro = i * 36`.
  - **Fórmula de acceso al salario del registro `i`**: `offset_salario = (i * 36) + 28`.

#### 🛠️ Instrucciones Java Obligatorias:
| Método de `RandomAccessFile` | Utilidad |
| :--- | :--- |
| `new RandomAccessFile(ruta, "rw")` | Abre el archivo en modo lectura y escritura directa. |
| `raf.seek(long pos)` | Sitúa el cabezal de lectura/escritura en el byte exacto `pos`. |
| `raf.writeDouble(double v)` | Sobrescribe los 8 bytes a partir de la posición actual del cursor. |
| `raf.getFilePointer()` | Devuelve la posición actual del puntero en bytes. |

#### 📝 Procedimiento Paso a Paso:
1. Crea la clase `Actividad2_3_RandomAccessFile`.
2. En un método `crearFichero()`, escribe 3 empleados de ejemplo (36 bytes cada uno). Para el apellido, usa un `StringBuffer` o método auxiliar que rellene con espacios hasta tener exactamente 10 caracteres.
3. En el método `modificarSalario(int numRegistro, double nuevoSalario)`:
   - Calcula `long offset = ((long) numRegistro * 36) + 28;`.
   - Ejecuta `raf.seek(offset);`.
   - Sobrescribe el salario con `raf.writeDouble(nuevoSalario);`.
4. Lee el registro modificado situando el cursor al inicio del registro (`seek(numRegistro * 36)`) y muestra los datos en consola comprobando que el id y apellido no han cambiado, pero el salario sí.

#### 💻 Código Esqueleto de Trabajo:
```java
package act2_binarios;

import java.io.*;

public class Actividad2_3_RandomAccessFile {
    private static final int TAM_REGISTRO = 36; // 4 + 20 + 4 + 8

    public static void main(String[] args) {
        File f = new File("datos/empleados.dat");
        // TODO: Crear fichero con 3 empleados
        // TODO: Modificar el salario del empleado en posición 1 (segundo empleado)
        // TODO: Leerlo y verificar que el cambio se hizo in-situ
    }

    public static void modificarSalario(File f, int indice, double nuevoSalario) throws IOException {
        try (RandomAccessFile raf = new RandomAccessFile(f, "rw")) {
            long offset = ((long) indice * TAM_REGISTRO) + 28;
            raf.seek(offset);
            raf.writeDouble(nuevoSalario);
            System.out.println("✅ Salario modificado directamente en byte: " + offset);
        }
    }
}
```

---

### 📌 Actividad 2.4: Serialización de Objetos con Campos Transient

- **Momento didáctico**: Tras explicar la **Diapositiva 13** (Serializable, serialVersionUID y transient).
- **Problema profesional**: Persistir instancias completas de la clase `Usuario` en disco, garantizando por seguridad y RGPD que credenciales o tokens de sesión en memoria jamás se guarden en el archivo físico.

#### 🛠️ Instrucciones Java Obligatorias:
| Elemento | Utilidad |
| :--- | :--- |
| `implements Serializable` | Interfaz marcadora que autoriza a la JVM a serializar la clase. |
| `private static final long serialVersionUID = 1L;` | Control de versión para evitar `InvalidClassException`. |
| `private transient String tokenSesion;` | Modificador que indica al compilador que **omita** este campo en la serialización. |
| `oos.writeObject(obj)` / `ois.readObject()` | Escribe y reconstruye el grafo del objeto en disco/memoria. |

#### 📝 Procedimiento Paso a Paso:
1. Diseña la clase `Usuario` implementando `Serializable`, con atributos: `id` (int), `nombre` (String) y `transient String tokenSesion`.
2. Crea `Actividad2_4_SerializacionTransient`.
3. Instancia dos usuarios con tokens activos (ej. `"JWT_SECRET_98765"`).
4. Serialízalos en `datos/usuarios.ser` con `ObjectOutputStream`.
5. Abre el fichero con `ObjectInputStream`, deserializa los dos usuarios e imprímelos con `toString()`.
6. Constata que `tokenSesion` recupera su valor por defecto: `null`.

#### ✅ Comprobación y Resultado Esperado:
- Consola:
  ```text
  [Objeto Recuperado] ID: 1 | Nombre: Elena | Token RAM: null
  [Objeto Recuperado] ID: 2 | Nombre: Marcos | Token RAM: null
  ```
- ⚠️ **Alerta de error típico**: Si una clase contiene una referencia a otra clase que no implementa `Serializable`, la JVM lanzará en tiempo de ejecución una excepción `NotSerializableException`.

---

### 📌 Actividad 2.5: Persistencia Incremental sin StreamCorruptedException (MiObjectOutputStream)

- **Momento didáctico**: Tras explicar las **Diapositivas 14 y 15** (El Problema del Append y MiObjectOutputStream).
- **Problema profesional**: Añadir nuevos objetos a un fichero binario existente en distintas ejecuciones del programa (`append = true`). `ObjectOutputStream` escribe automáticamente una cabecera de 4 bytes (`0xACED0005`) en su constructor; al hacer append, escribe una segunda cabecera intermedia que corrompe la lectura lanzando `StreamCorruptedException: invalid type code: AC`.

#### 🛠️ Instrucciones Java Obligatorias:
| Componente | Utilidad |
| :--- | :--- |
| `MiObjectOutputStream extends ObjectOutputStream` | Subclase que anula la escritura de cabecera sobrescribiendo `writeStreamHeader()`. |
| `protected void writeStreamHeader() {}` | Dejar el cuerpo vacío para no inyectar bytes intermedios. |
| `boolean existe = f.exists() && f.length() > 0;` | Evalúa si el fichero ya tiene cabecera inicial válida. |
| `oos = existe ? new MiObjectOutputStream(fos) : new ObjectOutputStream(fos);` | Patrón de apertura docente seguro. |

#### 📝 Procedimiento Paso a Paso:
1. Crea la clase `MiObjectOutputStream` sobrescribiendo `writeStreamHeader()` para no hacer nada.
2. En `Actividad2_5_AppendObjetos`, implementa el método `guardarUsuario(File f, Usuario u)` con el operador ternario.
3. Ejecuta el programa una primera vez insertando 1 usuario (se crea el archivo con cabecera estándar).
4. Ejecuta el programa una segunda y tercera vez añadiendo 1 usuario más en cada una (se usa `MiObjectOutputStream`).
5. En un método `listarTodos(File f)`, lee todos los usuarios con `ObjectInputStream` en un bucle hasta capturar `EOFException`.
6. Comprueba que se leen los 3 usuarios sin ningún error de stream corrupto.

---

## 🌳 BLOQUE 3: Ficheros XML (DOM, SAX, StAX y JAXB)

---

### 📌 Actividad 3.1: Consulta y Modificación de Catálogo con DOM

- **Momento didáctico**: Tras explicar la **Diapositiva 17** (DOM y árbol de nodos en RAM).
- **Problema profesional**: Cargar en memoria un catálogo XML de productos, recorrer sus etiquetas para consultar información y modificar precios aplicando un incremento porcentual por inflación, evitando la trampa de los nodos de texto vacíos (`#text`).
- **Datos de prueba (`datos/catalogo.xml`)**:
  ```xml
  <?xml version="1.0" encoding="UTF-8"?>
  <catalogo>
      <producto id="P101">
          <nombre>Disco SSD 1TB</nombre>
          <precio>79.99</precio>
          <stock>15</stock>
      </producto>
      <producto id="P102">
          <nombre>Memoria RAM 16GB</nombre>
          <precio>45.50</precio>
          <stock>30</stock>
      </producto>
  </catalogo>
  ```

#### 🛠️ Instrucciones Java Obligatorias:
| Instrucción | Utilidad |
| :--- | :--- |
| `DocumentBuilderFactory.newInstance().newDocumentBuilder()` | Factoría y constructor del parser DOM. |
| `builder.parse(File)` | Parsea el fichero XML y construye el árbol completo en memoria RAM. |
| `doc.getDocumentElement().normalize()` | Normaliza el árbol unificando nodos de texto adyacentes. |
| `if (nodo.getNodeType() == Node.ELEMENT_NODE)` | **Obligatorio** para ignorar saltos de línea y tabuladores (`#text`). |
| `elemento.getAttribute("id")` y `elemento.getElementsByTagName("precio")` | Lectura de atributos y etiquetas hijas. |

#### 📝 Procedimiento Paso a Paso:
1. Crea la clase `Actividad3_1_DOMModificacion`.
2. Carga y normaliza `datos/catalogo.xml`.
3. Obtén la lista de productos con `doc.getElementsByTagName("producto")`.
4. Recorre la lista con un bucle `for`:
   - Verifica que el nodo es de tipo `Node.ELEMENT_NODE`.
   - Extrae el atributo `id` y el texto del tag `<nombre>`.
   - Extrae el elemento `<precio>`, parsea su valor numérico a `double`, multiplícalo por `1.10` (+10%) y actualízalo en el árbol con `setTextContent(String.format(Locale.US, "%.2f", nuevoPrecio))`.
5. Muestra por consola los precios antiguos y los nuevos precios actualizados en memoria.

---

### 📌 Actividad 3.2: Generación de XML y Volcado Formateado con Transformer

- **Momento didáctico**: Tras explicar la **Diapositiva 18** (Creación y Transformer con sangría).
- **Problema profesional**: Crear un documento XML estructurado desde código Java y volcarlo a disco con formato legible e indentado (*pretty-print*) para que pueda ser interpretado por otros departamentos o sistemas.

#### 🛠️ Instrucciones Java Obligatorias:
| Instrucción | Utilidad |
| :--- | :--- |
| `builder.newDocument()` | Crea un documento DOM vacío en memoria. |
| `doc.createElement(tag)` / `doc.appendChild(nodo)` | Crea elementos y los añade al árbol jerárquico. |
| `elemento.setAttribute("clave", "valor")` | Añade atributos XML a una etiqueta. |
| `tf.setOutputProperty(OutputKeys.INDENT, "yes")` | Activa la sangría automática en el volcado. |
| `tf.setOutputProperty("{http://xml.apache.org/xslt}indent-amount", "4")` | Define una sangría de 4 espacios. |
| `tf.transform(new DOMSource(doc), new StreamResult(fichero))` | Serializa el árbol DOM de la memoria al archivo físico. |

#### 📝 Procedimiento Paso a Paso:
1. Crea la clase `Actividad3_2_DOMTransformer`.
2. Instancia un nuevo `Document` vacío.
3. Crea el nodo raíz `<alumnos>` y añádelo con `doc.appendChild(raiz)`.
4. Añade dos elementos `<alumno>` con atributo `expediente="EXP-01"` y subelementos `<nombre>` y `<nota>`.
5. Configura `TransformerFactory` y `Transformer` con sangría de 4 espacios y codificación `UTF-8`.
6. Vuelca el resultado a `datos/alumnos.xml`.
7. Abre el archivo generado y comprueba que está perfectamente formateado y legible.

---

### 📌 Actividad 3.3: Analizador Reactivo sin Memoria con SAX

- **Momento didáctico**: Tras explicar la **Diapositiva 19** (SAX y procesamiento por eventos push).
- **Problema profesional**: Procesar un catálogo masivo de miles de productos (o varios gigabytes) para calcular el valor total del inventario y el precio medio sin consumir memoria RAM, disparando eventos a medida que el parser lee el fichero hacia adelante.

#### 🛠️ Instrucciones Java Obligatorias:
| Callback de `DefaultHandler` | Momento de Disparo | Tarea en la Actividad |
| :--- | :--- | :--- |
| `startElement(...)` | Al abrir una etiqueta (`<precio>`). | Limpiar el buffer acumulador: `buffer.setLength(0);`. |
| `characters(char[] ch, int start, int len)` | Al leer caracteres de texto. | Acumular texto con `buffer.append(ch, start, len);`. |
| `endElement(...)` | Al cerrar una etiqueta (`</precio>`). | Si la etiqueta es `"precio"`, parsear el valor acumulado y sumarlo al total. |
| `endDocument()` | Al finalizar todo el fichero. | Calcular la media final y mostrar el informe estadístico. |

#### 📝 Procedimiento Paso a Paso:
1. Crea la clase `Actividad3_3_SAXAnalizador`.
2. Define una clase interna estática `EstadisticasHandler extends DefaultHandler`.
3. Declara variables: `double sumaPrecios = 0; int contador = 0; StringBuilder buffer = new StringBuilder();`.
4. Implementa `characters()` acumulando texto en el buffer.
5. En `endElement()`, si `qName.equalsIgnoreCase("precio")`, convierte el buffer a `Double`, súmalo y aumenta el contador.
6. En `endDocument()`, imprime la media aritmética: `sumaPrecios / contador`.
7. En el `main`, parsea `datos/catalogo.xml` con `SAXParserFactory.newInstance().newSAXParser().parse(...)`.

#### ✅ Comprobación y Resultado Esperado:
- Consola:
  ```text
  --- Estadísticas SAX (Consumo RAM: 0 MB) ---
  Productos analizados: 2
  Suma total de precios: 125.49 €
  Precio medio: 62.75 €
  ```
- ⚠️ **Alerta de error típico**: No usar `StringBuilder` en `characters()`. El parser SAX puede fragmentar el texto de una etiqueta en múltiples llamadas a `characters()`; si solo tomas la última llamada, perderás información.

---

### 📌 Actividad 3.4: Mapeo Declarativo Objeto-XML con JAXB

- **Momento didáctico**: Tras explicar la **Diapositiva 20** (StAX y JAXB).
- **Problema profesional**: En servicios web e intercambio empresarial B2B, no se construyen árboles DOM a mano. Se mapean directamente clases POJO a etiquetas XML mediante anotaciones declarativas estándar (Jakarta XML Binding / JAXB).

#### 🛠️ Instrucciones Java Obligatorias:
| Anotación / Clase | Utilidad |
| :--- | :--- |
| `@XmlRootElement(name = "curso")` | Define el nombre de la etiqueta raíz XML asociada a la clase. |
| `@XmlAccessorType(XmlAccessType.FIELD)` | Indica a JAXB que serialice directamente los atributos privados sin exigir getters. |
| `@XmlAttribute` y `@XmlElement` | Mapea un campo como atributo de etiqueta o como subetiqueta XML. |
| `JAXBContext.newInstance(Curso.class)` | Crea el contexto de serialización para la entidad. |
| `Marshaller` | Serializa el objeto Java a fichero XML (`m.marshal(obj, file)`). |
| `Unmarshaller` | Reconstruye el objeto Java a partir del fichero XML (`um.unmarshal(file)`). |

#### 📝 Procedimiento Paso a Paso:
1. Crea la clase `Curso` con anotaciones `@XmlRootElement` y atributos: `String nombre`, `int horas` y `String codigo` (con `@XmlAttribute`).
2. **Importante**: Añade un constructor vacío `public Curso() {}` (imprescindible para la instanciación por reflexión).
3. En `Actividad3_4_JAXBMapeo`:
   - Instancia un `Curso` (`"Acceso a Datos"`, `140`, `"0486"`).
   - Crea el `JAXBContext` y un `Marshaller`.
   - Configura `m.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true)` para sangría bonita.
   - Guarda en `datos/curso.xml` con `m.marshal(curso, f)`.
4. A continuación, crea un `Unmarshaller`, carga el fichero con `um.unmarshal(f)` y muestra el objeto recuperado por consola.

#### ✅ Comprobación y Resultado Esperado:
- En `datos/curso.xml`:
  ```xml
  <?xml version="1.0" encoding="UTF-8" standalone="yes"?>
  <curso codigo="0486">
      <nombre>Acceso a Datos</nombre>
      <horas>140</horas>
  </curso>
  ```
- Consola: `✅ Objeto recuperado con JAXB: Curso 0486 - Acceso a Datos (140 horas).`
