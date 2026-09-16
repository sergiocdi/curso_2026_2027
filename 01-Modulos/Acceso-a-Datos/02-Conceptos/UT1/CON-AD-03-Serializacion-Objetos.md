---
tipo: concepto
modulo: "Acceso a Datos"
ud: "UD01"
ra_asociados: ["RA1"]
tags: [concepto, java, serializacion, objetos, objectstream, serialversionuid, transient, append]
dificultad: media
estado: revisado
---

# 💡 Concepto: Serialización de Objetos en Java y el Problema del Append

> **Módulo**: [[MOC-Acceso-a-Datos|Acceso a Datos]] | **UD**: [[UD01-Manejo-de-Ficheros|UD01 / UT1]] | **RA**: [[RA01-Manejo-Ficheros|RA1]]

---

## 👨‍🏫 Introducción del Profesor: De la RAM al Disco

En programación orientada a objetos (POO), las aplicaciones crean y gestionan grafos de objetos interconectados en memoria RAM. Cuando el programa finaliza, esa memoria se libera y los objetos desaparecen.
¿Cómo guardamos el estado de un objeto complejo (con sus atributos, fechas, listas anidadas y referencias cruzadas) en un archivo sin tener que descomponerlo manualmente campo a campo?
La respuesta nativa de Java es la **Serialización de Objetos**:
- **Serializar**: Tomar un objeto vivo en memoria RAM y transformar todo su estado interno y dependencias en una secuencia lineal de bytes binarios.
- **Deserializar**: Leer esa secuencia de bytes desde el disco o la red y reconstruir en la memoria RAM una réplica exacta del objeto original, restaurando sus valores y tipos **sin necesidad de invocar sus constructores habituales**.

---

## 🔑 1. Requisitos Fundamentales de una Clase Serializable

Para que una clase pueda ser serializada por la Máquina Virtual de Java (JVM), debe cumplir tres directrices:

### 1.1 Implementar la interfaz `java.io.Serializable`
Es una **interfaz marcadora (marker interface)** que no contiene métodos. Su función es autorizar a la JVM a inspeccionar reflectivamente los campos privados del objeto.

> [!WARNING]
> Si intentas serializar una clase que no implemente `Serializable`, la JVM lanzará de inmediato:
> `java.io.NotSerializableException: nombre.de.la.Clase`
> Además, **todos los atributos contenidos dentro de la clase deben ser también serializables** o tipos primitivos.

### 1.2 Declarar de forma explícita `serialVersionUID`
Cada clase serializable posee un número de versión de 64 bits (`long`).
- **Qué ocurre si lo omites**: La JVM calcula automáticamente un hash en tiempo de compilación analizando los atributos y métodos de la clase. Si semanas después añades un método o compilas con otra versión del JDK, el hash cambiará y será imposible leer los ficheros antiguos, arrojando:
  `java.io.InvalidClassException: local class incompatible: stream classdesc serialVersionUID = X, local class serialVersionUID = Y`
- **Regla estándar de FP**: Declarar siempre explícitamente:
  ```java
  private static final long serialVersionUID = 1L;
  ```

### 1.3 Exclusión de Campos con la Palabra Clave `transient`
Indica al motor de serialización que un atributo concreto **no debe ser guardado en disco**:
- **Seguridad**: Contraseñas en texto plano, tokens de sesión o datos bancarios.
- **Recursos volátiles de SO**: Hilos (`Thread`), sockets de red (`Socket`), descriptores de fichero o conexiones de base de datos (`Connection`).
- **Campos recalculables**: Totales o subtotales que pueden computarse a partir de otros atributos.

Al deserializar, un atributo `transient` recupera su valor por defecto (`null` para objetos, `0` para números, `false` para booleanos).

---

## 🛠️ 2. Ficha Técnica Exhaustiva: `ObjectOutputStream`

Clase encargada de convertir los objetos de la memoria RAM en tramas binarias sobre un `OutputStream` subyacente.

| Instrucción / Método | Parámetros | Retorno | Qué hace exactamente a bajo nivel |
| :--- | :--- | :--- | :--- |
| `new ObjectOutputStream(out)` | `OutputStream out` | Instancia | **1.** Conecta con el flujo de salida.<br>**2.** Escribe en el archivo la **cabecera mágica de 4 bytes** (`0xAC 0xED 0x00 0x05`).<br>**3.** Inicializa el búfer y la tabla de referencias internas. |
| `writeObject(Object obj)` | `Object obj` | `void` | **1.** Inspecciona el objeto por reflexión.<br>**2.** Si es la primera vez que lo ve, escribe el descriptor de la clase (`ObjectStreamClass`: nombre, `serialVersionUID`).<br>**3.** Vuelca recursivamente todos los atributos no transitorios del objeto y de los objetos referenciados dentro de él.<br>**4.** Guarda un identificador interno (puntero de referencia) para no duplicar objetos repetidos en el grafo. |
| `writeUnshared(Object obj)` | `Object obj` | `void` | Escribe el objeto como una entidad totalmente nueva e independiente, **sin registrarlo en la tabla de referencias compartidas**. |
| `reset()` | Ninguno | `void` | **Limpia la caché de referencias de objetos ya serializados**. Si modificas un objeto en memoria y vuelves a invocar `writeObject()` sin hacer `reset()`, Java solo escribirá una referencia al estado antiguo ignorando tus cambios. |
| `flush()` | Ninguno | `void` | Fuerza el vaciado de los bytes en memoria intermedia hacia el archivo físico en disco. |
| `close()` | Ninguno | `void` | Vacía los búferes y cierra el flujo liberando el descriptor en el sistema operativo. |
| `writeStreamHeader()` *(protected)* | Ninguno | `void` | Método interno que emite los 4 bytes de cabecera mágica `0xACED0005`. Al sobrescribirlo en una subclase propia, podemos anular la cabecera en modo append. |

---

## 🛠️ 3. Ficha Técnica Exhaustiva: `ObjectInputStream`

Clase encargada de leer el flujo binario y recrear los objetos en la memoria RAM.

| Instrucción / Método | Parámetros | Retorno | Qué hace exactamente a bajo nivel |
| :--- | :--- | :--- | :--- |
| `new ObjectInputStream(in)` | `InputStream in` | Instancia | **1.** Lee los primeros 4 bytes del archivo.<br>**2.** Verifica que coincidan con la firma mágica `0xACED0005`. Si no coinciden, lanza inmediatamente `StreamCorruptedException`. |
| `readObject()` | Ninguno | `Object` | **1.** Lee la descripción de la clase en el flujo.<br>**2.** Comprueba que el `serialVersionUID` coincida con la clase local cargada en la JVM.<br>**3.** Reserva memoria para el objeto **sin invocar sus constructores ordinarios**.<br>**4.** Restaura el valor de cada atributo a partir de los bytes.<br>**5.** Retorna la referencia genérica (requiere *casting* explícito a la clase real).<br>**6.** Lanza `EOFException` al llegar al final del archivo. |
| `readUnshared()` | Ninguno | `Object` | Deserializa un objeto asegurando que no comparta referencias previas en memoria. |
| `close()` | Ninguno | `void` | Cierra el canal y libera el fichero. |

---

## 💻 4. Ejemplo Práctico Completo: Serialización y Deserialización

### Paso 1: Definición de la Entidad `Empleado`
```java
package es.cifpaviles.ad.ut1.serializacion;

import java.io.Serializable;

public class Empleado implements Serializable {

    // Identificador de versión explícito
    private static final long serialVersionUID = 1L;

    private int id;
    private String nombre;
    private String departamento;
    private double salario;

    // Atributo protegido con transient: ¡NO se guardará en disco!
    private transient String passwordAcceso;

    public Empleado(int id, String nombre, String departamento, double salario, String passwordAcceso) {
        this.id = id;
        this.nombre = nombre;
        this.departamento = departamento;
        this.salario = salario;
        this.passwordAcceso = passwordAcceso;
    }

    @Override
    public String toString() {
        return String.format("Empleado [ID=%d, Nombre=%-12s, Dept=%-10s, Salario=%.2f €, Password=%s]",
                             id, nombre, departamento, salario, 
                             (passwordAcceso == null ? "NULL (Protegido)" : passwordAcceso));
    }
}
```

### Paso 2: Programa de Guardado y Recuperación
```java
package es.cifpaviles.ad.ut1.serializacion;

import java.io.*;

public class GestorSerializacionBasico {

    private static final String RUTA_ARCHIVO = "datos/empleados.dat";

    public static void main(String[] args) {
        Empleado emp1 = new Empleado(1, "Ana López", "Sistemas", 2450.00, "SecretPass123");
        Empleado emp2 = new Empleado(2, "Carlos Gil", "Desarrollo", 2650.00, "DevPass456");

        // 1. SERIALIZACIÓN (Memoria RAM -> Archivo Físico)
        guardarEmpleado(emp1, emp2);

        // 2. DESERIALIZACIÓN (Archivo Físico -> Memoria RAM)
        recuperarEmpleados();
    }

    public static void guardarEmpleado(Empleado... empleados) {
        File f = new File(RUTA_ARCHIVO);
        if (f.getParentFile() != null) f.getParentFile().mkdirs();

        // ObjectOutputStream escribe la cabecera 0xACED0005 al instanciarse
        try (ObjectOutputStream oos = new ObjectOutputStream(
                new BufferedOutputStream(new FileOutputStream(f)))) {

            for (Empleado emp : empleados) {
                // writeObject serializa la clase, sus tipos y atributos en disco
                oos.writeObject(emp);
                System.out.println("💾 Objeto escrito en disco: " + emp);
            }

            oos.flush(); // Asegura el vaciado del búfer
            System.out.println("✅ Serialización completada. Tamaño: " + f.length() + " bytes");

        } catch (IOException e) {
            System.err.println("❌ Error al serializar: " + e.getMessage());
        }
    }

    public static void recuperarEmpleados() {
        File f = new File(RUTA_ARCHIVO);

        System.out.println("\n📥 Deserializando objetos desde disco:");
        // ObjectInputStream valida la cabecera 0xACED0005 al arrancar
        try (ObjectInputStream ois = new ObjectInputStream(
                new BufferedInputStream(new FileInputStream(f)))) {

            while (true) {
                // readObject devuelve Object genérico: requiere cast explícito a Empleado
                Empleado emp = (Empleado) ois.readObject();
                System.out.println("  -> Recuperado: " + emp);
            }

        } catch (EOFException e) {
            System.out.println("🏁 Fin natural del archivo alcanzado (todos los objetos deserializados).");
        } catch (ClassNotFoundException e) {
            System.err.println("❌ Error: La clase del objeto serializado no está en el classpath: " + e.getMessage());
        } catch (IOException e) {
            System.err.println("❌ Error de lectura de objetos: " + e.getMessage());
        }
    }
}
```

---

## ⚡ 5. El Gran Problema del Modo Append y `StreamCorruptedException`

### ¿Por qué falla `new FileOutputStream(archivo, true)`?
Cuando intentamos añadir nuevos objetos al final de un fichero ya existente usando el modo append clásico:
```java
// ¡PELIGRO! Esto corrompe el fichero binario:
ObjectOutputStream oos = new ObjectOutputStream(new FileOutputStream("empleados.dat", true));
oos.writeObject(nuevoEmpleado);
```
Ocurre lo siguiente en el disco:
1. El archivo inicial ya tenía su cabecera mágica de 4 bytes (`0xACED0005`) al principio del todo, seguida del primer objeto.
2. Al ejecutar `new ObjectOutputStream(...)`, el constructor **vuelve a escribir obligatoriamente otros 4 bytes de cabecera (`0xACED0005`)** en la posición donde se quedó el puntero (en medio del archivo).
3. A continuación escribe el nuevo objeto.
4. Cuando más adelante abres el fichero con `ObjectInputStream`:
   - Lee el primer objeto sin problemas.
   - Al intentar leer el segundo, **encuentra la segunda cabecera intermedia**. La JVM espera un identificador de objeto (`TC_OBJECT = 0x73`), pero se topa con el código de cabecera `0xAC`, provocando el colapso inmediato:
   ```
   java.io.StreamCorruptedException: invalid type code: AC
   ```

---

### 🛡️ Solución de la Industria: Subclase `MiObjectOutputStream`

Para solucionar este defecto arquitectónico, creamos una subclase propia de `ObjectOutputStream` que **sobrescribe el método `writeStreamHeader()` dejándolo en blanco**:

```java
package es.cifpaviles.ad.ut1.serializacion;

import java.io.IOException;
import java.io.ObjectOutputStream;
import java.io.OutputStream;

/**
 * Subclase especializada para añadir objetos a ficheros que ya contienen datos.
 * Anula la emisión de la cabecera 0xACED0005 para no corromper el stream.
 */
public class MiObjectOutputStream extends ObjectOutputStream {

    public MiObjectOutputStream(OutputStream out) throws IOException {
        super(out);
    }

    @Override
    protected void writeStreamHeader() throws IOException {
        // Al NO invocar super.writeStreamHeader(), este método no escribe nada en disco.
        // Se mantiene limpia la continuidad de objetos en el fichero.
    }
}
```

#### Cómo implementar la lógica condicional en la aplicación:
```java
public static void anadirEmpleado(File f, Empleado nuevo) {
    // Si el archivo existe Y ya mide más de 0 bytes, significa que ya tiene su cabecera inicial
    boolean yaTieneDatos = f.exists() && f.length() > 0;

    try {
        FileOutputStream fos = new FileOutputStream(f, true); // Modo append activado

        // Decisión crítica:
        // - Si es nuevo: ObjectOutputStream normal (escribe la cabecera inicial)
        // - Si ya tiene datos: MiObjectOutputStream (no escribe cabecera repetida)
        ObjectOutputStream oos = yaTieneDatos 
                ? new MiObjectOutputStream(fos) 
                : new ObjectOutputStream(fos);

        oos.writeObject(nuevo);
        oos.close();

        System.out.println("✅ Empleado añadido con éxito sin corromper el fichero.");

    } catch (IOException e) {
        System.err.println("Error al persistir incrementalmente: " + e.getMessage());
    }
}
```
