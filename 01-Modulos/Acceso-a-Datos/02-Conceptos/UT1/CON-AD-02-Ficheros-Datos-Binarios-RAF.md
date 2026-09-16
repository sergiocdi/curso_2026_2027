---
tipo: concepto
modulo: "Acceso a Datos"
ud: "UD01"
ra_asociados: ["RA1"]
tags: [concepto, java, binario, datastream, randomaccessfile, eofexception]
dificultad: media
estado: revisado
---

# 💡 Concepto: Ficheros Binarios de Datos Simples y Acceso Aleatorio (RAF)

> **Módulo**: [[MOC-Acceso-a-Datos|Acceso a Datos]] | **UD**: [[UD01-Manejo-de-Ficheros|UD01 / UT1]] | **RA**: [[RA01-Manejo-Ficheros|RA1]]

---

## 👨‍🏫 Introducción del Profesor: ¿Texto o Binario?

Hasta ahora hemos trabajado con texto plano: legible por humanos, pero ineficiente cuando necesitamos almacenar estructuras numéricas complejas o grandes volúmenes de datos.
Veamos una comparativa real:
- Si queremos guardar el número entero `2147483647` en texto plano (`.txt` o `.csv`), necesitamos **10 caracteres** (10 bytes en UTF-8 o 20 bytes en UTF-16) más los separadores. Además, al leerlo, la CPU debe gastar ciclos parseando (`Integer.parseInt`).
- En un fichero binario, ese mismo número se almacena exactamente en su representación interna de máquina: **4 bytes puros** (32 bits). La lectura es instantánea porque no requiere transformación.

En este apartado dominaremos dos mecanismos esenciales:
1. **Flujos secuenciales de datos tipados**: `DataInputStream` y `DataOutputStream`.
2. **Acceso directo y aleatorio a cualquier byte del disco**: `RandomAccessFile`.

---

## 🔢 1. Flujos Binarios Tipados: `DataOutputStream` y `DataInputStream`

Las clases `DataOutputStream` y `DataInputStream` decoran a `FileOutputStream` y `FileInputStream` para permitir la lectura y escritura de **tipos primitivos de Java** (`int`, `double`, `boolean`, `char`, `long`) y cadenas en formato UTF-8 modificado (`writeUTF()` / `readUTF()`).

### 1.1 El Contrato de Lectura Estricto
Los datos binarios no tienen delimitadores visuales (como espacios o comas). Por tanto:
> [!IMPORTANT]
> **Regla de oro de los flujos de datos**: Los datos **deben leerse exactamente en el mismo orden y con el mismo tipo primitivo** con el que fueron escritos. Si escribes `writeInt()` y luego `writeDouble()`, pero al leer ejecutas primero `readDouble()`, los bytes se interpretarán incorrectamente y obtendrás datos corruptos sin que salte necesariamente un error de compilación.

### 1.2 La Detección del Fin de Fichero (`EOFException`)
En flujos de texto, `readLine()` devuelve `null` al llegar al final. En flujos binarios, `read()` devuelve `-1`. 
Sin embargo, en `DataInputStream`, los métodos como `readInt()`, `readDouble()` o `readUTF()` **no pueden devolver `-1`** (porque `-1` es un valor numérico perfectamente válido que podría ser el dato almacenado).
Por tanto, cuando se alcanza el fin del fichero, Java lanza una **`java.io.EOFException`** (End Of File Exception).

```java
import java.io.*;

public class GestorTelemetriaBinaria {

    public static void guardarRegistros(String ruta) {
        try (DataOutputStream dos = new DataOutputStream(
                new BufferedOutputStream(new FileOutputStream(ruta)))) {
            
            // Registramos 3 sensores: ID (int), Nombre (UTF), Temperatura (double), Activo (boolean)
            dos.writeInt(101);
            dos.writeUTF("Sensor Caldera Norte");
            dos.writeDouble(78.45);
            dos.writeBoolean(true);

            dos.writeInt(102);
            dos.writeUTF("Sensor Sala Servidores");
            dos.writeDouble(21.10);
            dos.writeBoolean(true);

            dos.writeInt(103);
            dos.writeUTF("Sensor Depósito Exterior");
            dos.writeDouble(14.80);
            dos.writeBoolean(false);

            System.out.println("✅ Datos de telemetría guardados en binario correctamente.");
        } catch (IOException e) {
            System.err.println("Error al escribir binario: " + e.getMessage());
        }
    }

    public static void leerRegistros(String ruta) {
        try (DataInputStream dis = new DataInputStream(
                new BufferedInputStream(new FileInputStream(ruta)))) {
            
            System.out.println("📊 LECTURA DE TELEMETRÍA BINARIA:");
            // Bucle infinito que finaliza deliberadamente al capturar EOFException
            while (true) {
                int id = dis.readInt();
                String nombre = dis.readUTF();
                double temp = dis.readDouble();
                boolean activo = dis.readBoolean();

                System.out.printf("  [ID: %03d] %-25s | Temp: %6.2f ºC | Estado: %s%n",
                        id, nombre, temp, (activo ? "ACTIVO" : "INACTIVO"));
            }
        } catch (EOFException e) {
            // Fin natural y esperado del fichero
            System.out.println("🏁 Fin de fichero alcanzado correctamente.");
        } catch (IOException e) {
            System.err.println("Error de lectura: " + e.getMessage());
        }
    }
}
```

---

## 🎯 2. Ficheros de Acceso Aleatorio (`RandomAccessFile`)

Los flujos tradicionales (`InputStream`, `OutputStream`, `Reader`, `Writer`) son **estrictamente secuenciales**: si un fichero pesa 10 GB y quieres leer el último dato, estás obligado a recorrer los gigabytes previos.
La clase `RandomAccessFile` (RAF) rompe esta limitación y modela el fichero como un gigantesco array de bytes ubicado directamente en el disco secundario.

### 2.1 El Puntero de Archivo (*File Pointer*)
Dentro del archivo existe un cursor invisible llamado **File Pointer**.
- Al abrir el archivo, el puntero se sitúa en la posición `0` (byte inicial).
- Cada vez que leemos o escribimos datos, el puntero avanza automáticamente tantos bytes como ocupe el tipo de dato.
- `raf.getFilePointer()`: Devuelve la posición actual (en bytes, de tipo `long`).
- `raf.seek(long posicionBytes)`: Desplaza el cursor de lectura/escritura a cualquier byte arbitrario del archivo de forma casi instantánea.
- `raf.length()`: Devuelve el tamaño total del archivo en bytes.

### 2.2 Modos de Apertura
- `"r"`: Modo de solo lectura (*read-only*). Lanza excepción si el archivo no existe.
- `"rw"`: Modo de lectura y escritura (*read-write*). Si el archivo no existe, lo crea automáticamente.

### 2.3 Diseño de Registros de Longitud Fija (Estructuras de Base de Datos)
Para que el acceso aleatorio sea predecible y matemático, debemos estructurar los registros con un **tamaño fijo en bytes**.
Supongamos una entidad `Empleado`:
- `id` (`int`): **4 bytes**.
- `apellido` (longitud fija de 10 caracteres; cada `char` ocupa 2 bytes con `writeChars`): **20 bytes**.
- `departamento` (`int`): **4 bytes**.
- `salario` (`double`): **8 bytes**.
- **Tamaño total por registro**: $4 + 20 + 4 + 8 = \mathbf{36\text{ bytes}}$.

```
Posición en Bytes:
[0 ................. 35] -> Registro 0 (Empleado 1)
[36 ................ 71] -> Registro 1 (Empleado 2)
[72 ............... 107] -> Registro 2 (Empleado 3)
```

Fórmula de salto directo para el registro $N$ (empezando en 0):
$$\text{Offset} = N \times \text{TAMANO\_REGISTRO}$$

```java
import java.io.IOException;
import java.io.RandomAccessFile;

public class GestorEmpleadosRAF {

    private static final int LONGITUD_APELLIDO = 10; // 10 caracteres
    // int(4) + chars(10*2=20) + int(4) + double(8) = 36 bytes
    public static final int TAMANO_REGISTRO = 36; 

    // Escritura de un registro en una posición determinada
    public static void escribirEmpleado(String ruta, int indice, int id, String apellido, int dep, double salario) {
        try (RandomAccessFile raf = new RandomAccessFile(ruta, "rw")) {
            long posicion = (long) indice * TAMANO_REGISTRO;
            raf.seek(posicion);

            raf.writeInt(id);

            // Ajustamos el apellido para que ocupe exactamente 10 caracteres
            StringBuilder sb = new StringBuilder(apellido);
            sb.setLength(LONGITUD_APELLIDO); // Rellena con espacios nulos o trunca
            raf.writeChars(sb.toString());

            raf.writeInt(dep);
            raf.writeDouble(salario);

            System.out.printf("Empleado %d escrito en el byte %d.%n", id, posicion);
        } catch (IOException e) {
            System.err.println("Error RAF: " + e.getMessage());
        }
    }

    // Modificación directa del salario sin tocar el resto de registros
    public static void modificarSalarioDirecto(String ruta, int indice, double nuevoSalario) {
        try (RandomAccessFile raf = new RandomAccessFile(ruta, "rw")) {
            // El salario empieza en: base del registro + id(4) + apellido(20) + dep(4) = byte +28
            long offsetSalario = ((long) indice * TAMANO_REGISTRO) + 28;

            if (offsetSalario + 8 > raf.length()) {
                System.out.println("❌ El registro indicado no existe en el fichero.");
                return;
            }

            raf.seek(offsetSalario);
            raf.writeDouble(nuevoSalario); // Sobrescribe exclusivamente los 8 bytes del salario

            System.out.printf("💰 Salario del registro %d actualizado a %.2f€ directamente en disco.%n",
                    indice, nuevoSalario);
        } catch (IOException e) {
            System.err.println("Error al actualizar salario: " + e.getMessage());
        }
    }
}
```

---

## ⚠️ Errores Habituales en Exámenes y Prácticas de Aula

1. **Olvidar que `readChar()` / `writeChars()` maneja 2 bytes por carácter**: Si una cadena tiene 10 caracteres, en disco ocupará 20 bytes, no 10.
2. **Confundir el índice de registro con el offset en bytes**: Si el alumno hace `raf.seek(2)`, no se posiciona en el tercer registro, sino en el **byte número 2** del archivo (en medio del ID del primer registro), corrompiendo la lectura.
3. **No controlar el desbordamiento de `seek()`**: `raf.seek()` permite posicionarse más allá del final del archivo (`raf.length()`). Si se escribe en esa posición remota, el sistema operativo rellenará el hueco intermedio con ceros binarios (*sparse file*), creando registros corruptos.
