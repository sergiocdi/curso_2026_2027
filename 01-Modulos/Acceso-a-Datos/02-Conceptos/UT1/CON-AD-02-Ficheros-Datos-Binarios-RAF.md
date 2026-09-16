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

## 👨‍🏫 Introducción del Profesor: ¿Por qué Ficheros Binarios?

Hasta ahora hemos trabajado con texto plano: legible por humanos, pero ineficiente cuando necesitamos almacenar datos numéricos o grandes volúmenes de información.
Veamos una comparativa real de almacenamiento:
- Si queremos guardar el número entero `2147483647` en texto plano (`.txt` o `.csv`), necesitamos **10 caracteres** (10 bytes en UTF-8 o 20 bytes en UTF-16) más los delimitadores. Al leerlo, la CPU debe parsearlo (`Integer.parseInt()`).
- En un fichero binario, ese mismo número se almacena en su representación interna de máquina: **4 bytes puros** (32 bits en complemento a dos). La lectura es inmediata porque no requiere transformación alguna.

En este apartado dominaremos dos herramientas fundamentales:
1. **Flujos secuenciales de tipos primitivos**: `DataOutputStream` y `DataInputStream`.
2. **Acceso directo y aleatorio con puntero**: `RandomAccessFile`.

---

## 🔢 1. Flujos Binarios de Datos Primitivos: `DataOutputStream` y `DataInputStream`

Ambas clases pertenecen a `java.io` y decoran flujos de bytes (`FileOutputStream` y `FileInputStream`). Permiten escribir y leer variables primitivas (`int`, `double`, `boolean`, `char`, etc.) y cadenas de texto en formato portable Big-Endian (orden de bytes de red).

### 🛠️ Ficha Técnica de Instrucciones de `DataOutputStream`

| Instrucción / Método | Bytes que Escribe | Qué hace exactamente en disco |
| :--- | :---: | :--- |
| `writeByte(int v)` | 1 byte | Escribe los 8 bits menos significativos del entero como un byte con signo (-128 a 127). |
| `writeShort(int v)` | 2 bytes | Escribe los 16 bits de un valor short (Big-Endian: byte alto primero). |
| `writeInt(int v)` | 4 bytes | Escribe los 32 bits de un entero Java. Ocupa siempre exactamente 4 casillas físicas. |
| `writeLong(long v)` | 8 bytes | Escribe los 64 bits de un entero largo. |
| `writeFloat(float v)` | 4 bytes | Convierte el float a 4 bytes bajo el estándar IEEE 754 de coma flotante. |
| `writeDouble(double v)` | 8 bytes | Convierte el número decimal de doble precisión a 8 bytes IEEE 754. |
| `writeBoolean(boolean v)` | 1 byte | Escribe el byte `0x01` para `true` o el byte `0x00` para `false`. |
| `writeChar(int v)` | 2 bytes | Escribe los 16 bits del carácter Unicode en formato de 2 bytes. |
| `writeChars(String s)` | $2 \times \text{longitud}$ | Escribe cada carácter de la cadena como 2 bytes seguidos, **sin escribir cabecera de longitud**. |
| `writeUTF(String str)` | $2 + \text{bytes UTF-8}$ | Escribe primero 2 bytes que indican la longitud en bytes del texto, seguidos de los caracteres codificados en UTF-8 modificado. |
| `flush()` | - | Vacía el búfer forzando la escritura física inmediata en el dispositivo. |

### 🛠️ Ficha Técnica de Instrucciones de `DataInputStream`

| Instrucción / Método | Bytes que Lee | Qué hace exactamente | Excepción de Fin |
| :--- | :---: | :--- | :--- |
| `byte readByte()` | 1 byte | Lee un byte y lo interpreta con signo (-128 a 127). | Lanza `EOFException` |
| `int readUnsignedByte()` | 1 byte | Lee un byte y lo interpreta sin signo (0 a 255). | Lanza `EOFException` |
| `int readInt()` | 4 bytes | Lee 4 bytes consecutivos y los une para formar un `int` de 32 bits. | Lanza `EOFException` |
| `double readDouble()` | 8 bytes | Lee 8 bytes y los reconstruye como decimal `double`. | Lanza `EOFException` |
| `boolean readBoolean()` | 1 byte | Lee 1 byte: si es distinto de cero devuelve `true`; si es 0 devuelve `false`. | Lanza `EOFException` |
| `char readChar()` | 2 bytes | Lee 2 bytes y reconstruye el carácter Unicode. | Lanza `EOFException` |
| `String readUTF()` | Variable | Lee los 2 primeros bytes de longitud y a continuación lee exactamente esos bytes decodificándolos a `String`. | Lanza `EOFException` |

---

### 💻 Ejemplo Completo de Escritura y Lectura con Explicación

```java
package es.cifpaviles.ad.ut1.binarios;

import java.io.*;

public class EjemploDataStreamsCompleto {

    private static final String RUTA = "datos/sensores.dat";

    public static void main(String[] args) {
        escribirDatos();
        leerDatos();
    }

    public static void escribirDatos() {
        File f = new File(RUTA);
        if (f.getParentFile() != null) f.getParentFile().mkdirs();

        // Decoramos FileOutputStream con DataOutputStream
        try (DataOutputStream dos = new DataOutputStream(
                new BufferedOutputStream(new FileOutputStream(f)))) {

            // Registro 1: Sensor Interior
            dos.writeInt(101);                 // 4 bytes
            dos.writeUTF("Caldera Principal"); // 2 bytes longitud + 17 bytes texto = 19 bytes
            dos.writeDouble(68.75);            // 8 bytes
            dos.writeBoolean(false);           // 1 byte (sin alarma)

            // Registro 2: Sensor Exterior
            dos.writeInt(102);                 // 4 bytes
            dos.writeUTF("Deposito Exterior"); // 2 bytes longitud + 17 bytes texto = 19 bytes
            dos.writeDouble(12.30);            // 8 bytes
            dos.writeBoolean(true);            // 1 byte (alarma activa)

            dos.flush(); // Garantiza el volcado físico a disco
            System.out.println("✅ Datos binarios escritos. Tamaño del archivo: " + f.length() + " bytes");

        } catch (IOException e) {
            System.err.println("Error al escribir: " + e.getMessage());
        }
    }

    public static void leerDatos() {
        File f = new File(RUTA);

        // Bucle infinito controlado canónicamente con EOFException
        try (DataInputStream dis = new DataInputStream(
                new BufferedInputStream(new FileInputStream(f)))) {

            System.out.println("\n📡 Leyendo flujo binario tipado:");
            while (true) {
                // ATENCIÓN: El orden de lectura DEBE coincidir exactamente con el de escritura
                int id = dis.readInt();
                String nombre = dis.readUTF();
                double temp = dis.readDouble();
                boolean alarma = dis.readBoolean();

                System.out.printf("  Sensor [%d] %-20s -> Temp: %.2f ºC | Alarma: %s%n",
                                  id, nombre, temp, (alarma ? "⚠️ SÍ" : "OK"));
            }

        } catch (EOFException e) {
            // Fin natural del archivo binario
            System.out.println("🏁 Fin de fichero alcanzado correctamente (EOFException capturada).");
        } catch (IOException e) {
            System.err.println("Error inesperado de lectura: " + e.getMessage());
        }
    }
}
```

> [!CAUTION]
> **Peligro de Desincronización de Tipos**: Si escribes `writeInt()` y `writeDouble()`, pero en la lectura ejecutas primero `readDouble()`, Java consumirá los 4 bytes del entero más los primeros 4 bytes del double para construir un número decimal basura, corrompiendo la posición del puntero para todas las lecturas posteriores.

---

## 🧭 2. Ficheros de Acceso Aleatorio: `RandomAccessFile`

A diferencia de los flujos secuenciales (donde para leer el registro 500 debes pasar obligatoriamente por los 499 anteriores), `RandomAccessFile` trata el fichero como un **gran array continuo de bytes en disco**. Permite mover un puntero (*File Pointer*) hacia adelante y hacia atrás libremente.

### 🛠️ Ficha Técnica de Instrucciones de `RandomAccessFile`

| Instrucción / Método | Parámetros | Retorno | Qué hace exactamente en el archivo |
| :--- | :--- | :--- | :--- |
| `new RandomAccessFile(file, modo)` | `File f, String modo` | Objeto RAF | Abre el archivo en modo `"r"` (solo lectura) o `"rw"` (lectura y escritura, creándolo si no existe). |
| `seek(long pos)` | `long pos` (offset) | `void` | **Mueve el puntero físico** a la posición en bytes indicada. La posición inicial es 0. |
| `getFilePointer()` | Ninguno | `long` | Devuelve el **índice exacto del byte** donde se encuentra el cabezal de lectura/escritura en ese instante. |
| `length()` | Ninguno | `long` | Devuelve el tamaño físico actual del archivo en bytes. |
| `setLength(long newLength)` | `long newLength` | `void` | **Trunca o agranda** el archivo forzando el tamaño especificado. |
| `skipBytes(int n)` | `int n` | `int` | Avanza el puntero $n$ bytes hacia adelante sin leer su contenido. Devuelve los bytes saltados. |
| `writeInt(int v)` | `int v` | `void` | Escribe 4 bytes y **avanza el puntero 4 bytes hacia adelante**. |
| `readInt()` | Ninguno | `int` | Lee 4 bytes desde la posición del puntero y **avanza el puntero 4 bytes**. |
| `writeDouble(double v)` | `double v` | `void` | Escribe 8 bytes y avanza el puntero 8 bytes. |
| `readDouble()` | Ninguno | `double` | Lee 8 bytes y avanza el puntero 8 bytes. |
| `writeChars(String s)` | `String s` | `void` | Escribe cada carácter en 2 bytes sin cabecera de tamaño. |
| `readChar()` | Ninguno | `char` | Lee 2 bytes como carácter Unicode y avanza el puntero 2 bytes. |

---

### 📐 La Matemática del Puntero y los Registros de Longitud Fija

Para que el método `seek()` pueda saltar directamente al registro número $N$ sin equivocarse, **todos los registros deben medir exactamente la misma cantidad de bytes**.

$$\mathbf{Offset \ en \ Bytes} = \text{Índice del Registro} \times \text{Tamaño Fijo del Registro}$$

#### Estructura de Registro Fijo de Ejemplo (32 Bytes):
- `int id`: 4 bytes.
- `String nombre`: 10 caracteres $\times$ 2 bytes (formato `char`) = 20 bytes fijos.
- `double precio`: 8 bytes.
- **Total por registro**: $4 + 20 + 8 = 32 \text{ bytes}$.

---

### 💻 Ejemplo Completo de RandomAccessFile con Edición In-Situ

```java
package es.cifpaviles.ad.ut1.binarios;

import java.io.*;

public class EjemploRAFCompleto {

    public static final int TAM_REGISTRO = 32;
    public static final int MAX_CHARS_NOMBRE = 10;
    private static final String RUTA = "datos/articulos_raf.dat";

    public static void main(String[] args) {
        File f = new File(RUTA);

        try (RandomAccessFile raf = new RandomAccessFile(f, "rw")) {

            // 1. INSERCIÓN DE 3 REGISTROS FIJOS
            escribirArticulo(raf, 0, 1, "Teclado", 45.00);  // Offset: 0 * 32 = 0
            escribirArticulo(raf, 1, 2, "Raton", 18.50);    // Offset: 1 * 32 = 32
            escribirArticulo(raf, 2, 3, "Monitor", 220.00); // Offset: 2 * 32 = 64

            System.out.println("✅ 3 registros creados. Longitud total: " + raf.length() + " bytes");

            // 2. CONSULTA DIRECTA DEL REGISTRO 2 (SIN LEER EL 1 NI EL 3)
            System.out.println("\n🎯 Saltando directamente al registro en posición 1 (Raton):");
            leerArticulo(raf, 1);

            // 3. ACTUALIZACIÓN IN-SITU DEL PRECIO DEL RATÓN (A 22.95 €)
            // Calculamos el offset del campo precio: offset_registro + 4 (id) + 20 (nombre) = + 24
            long offsetPrecio = (1L * TAM_REGISTRO) + 24;
            raf.seek(offsetPrecio);
            raf.writeDouble(22.95); // Sobreescribimos únicamente los 8 bytes del precio
            System.out.println("✅ Precio modificado in-situ sin reescribir el resto del archivo.");

            // Comprobamos volviendo a leer
            leerArticulo(raf, 1);

        } catch (IOException e) {
            System.err.println("Error en RandomAccessFile: " + e.getMessage());
        }
    }

    public static void escribirArticulo(RandomAccessFile raf, int posicion, int id, String nombre, double precio) throws IOException {
        raf.seek((long) posicion * TAM_REGISTRO);
        raf.writeInt(id);

        // Fijamos exactamente 10 caracteres rellenando con espacios o truncando
        StringBuffer sb = new StringBuffer(nombre);
        sb.setLength(MAX_CHARS_NOMBRE);
        raf.writeChars(sb.toString());

        raf.writeDouble(precio);
    }

    public static void leerArticulo(RandomAccessFile raf, int posicion) throws IOException {
        long offset = (long) posicion * TAM_REGISTRO;
        raf.seek(offset);

        int id = raf.readInt();

        // Leemos los 10 caracteres uno a uno
        char[] chars = new char[MAX_CHARS_NOMBRE];
        for (int i = 0; i < MAX_CHARS_NOMBRE; i++) {
            chars[i] = raf.readChar();
        }
        String nombre = new String(chars).trim();

        double precio = raf.readDouble();

        System.out.printf("  [Offset %2d] ID: %d | Nombre: %-10s | Precio: %.2f €%n",
                          offset, id, nombre, precio);
    }
}
```
