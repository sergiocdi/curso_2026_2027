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

En programación orientada a objetos (POO), las aplicaciones trabajan con grafos de objetos interconectados en memoria RAM. Cuando el programa finaliza, esa memoria se libera y los objetos desaparecen.
¿Cómo guardamos el estado completo de un objeto complejo en un archivo sin tener que descomponerlo manualmente campo a campo con `DataOutputStream`?
La respuesta nativa de Java es la **Serialización de Objetos**:
- **Serializar**: Convertir el estado de un objeto en memoria en un flujo lineal de bytes binarios.
- **Deserializar**: Reconstruir una réplica exacta del objeto original en la memoria RAM a partir de esos bytes, restaurando sus valores y tipos sin llamar a los constructores convencionales.

---

## 🔑 1. Requisitos de una Clase Serializable

Para que un objeto pueda serializarse en Java, su clase debe cumplir dos requisitos fundamentales:

### 1.1 Implementar `java.io.Serializable`
Es una **interfaz marcadora (marker interface)**: no define ningún método obligatorio. Su único propósito es notificar a la Máquina Virtual de Java (JVM) que autorizamos la serialización de sus instancias.

> [!WARNING]
> Si una clase no implementa `Serializable` e intentamos escribirla en un `ObjectOutputStream`, la JVM abortará inmediatamente lanzando `java.io.NotSerializableException`. Además, **todos los atributos que compongan la clase deben ser también serializables** (o primitivos).

### 1.2 Declarar explícitamente `serialVersionUID`
Cada clase serializable posee un identificador de versión universal de 64 bits (`long`).
- **Si no lo defines**: La JVM calcula automáticamente un hash en tiempo de compilación analizando los nombres de los atributos, tipos, modificadores y métodos de la clase.
- **El peligro real**: Si serializas objetos en un archivo, y la semana siguiente añades un simple método o cambias un atributo, el hash generado por el compilador cambiará. Al intentar deserializar el archivo existente, la JVM detectará que las versiones no coinciden y lanzará:
  ```
  java.io.InvalidClassException: local class incompatible: stream classdesc serialVersionUID = X, local class serialVersionUID = Y
  ```
- **Regla de oro de FP**: Declarar **siempre** de forma explícita:
  ```java
  private static final long serialVersionUID = 1L;
  ```

### 1.3 Exclusión de Atributos con `transient`
La palabra reservada `transient` indica al motor de serialización que un atributo concreto **no debe ser almacenado en disco**:
- Por motivos de seguridad (contraseñas en texto plano, tokens JWT, claves privadas).
- Por ser datos efímeros o calculables al vuelo (un total que se obtiene de una suma).
- Por ser referencias no serializables del sistema operativo (hilos `Thread`, sockets de red, conexiones JDBC `Connection`).

Al deserializar, los campos `transient` recuperan el valor por defecto de su tipo (`null` para objetos, `0` para números, `false` para booleanos).

```java
import java.io.Serializable;

public class Usuario implements Serializable {
    private static final long serialVersionUID = 1L;

    private int id;
    private String login;
    private transient String passwordHash; // ¡No se guardará en disco!

    public Usuario(int id, String login, String passwordHash) {
        this.id = id;
        this.login = login;
        this.passwordHash = passwordHash;
    }

    @Override
    public String toString() {
        return "Usuario[id=" + id + ", login=" + login + ", password=" + passwordHash + "]";
    }
}
```

---

## 📦 2. Canales Básicos: `ObjectOutputStream` y `ObjectInputStream`

Las clases encargadas de canalizar los objetos hacia el flujo binario son:
- `ObjectOutputStream` con el método `writeObject(Object obj)`.
- `ObjectInputStream` con el método `readObject()` (requiere *casting* explícito y captura de `ClassNotFoundException`).

```java
import java.io.*;

public class GestorObjetosBasico {

    public static void serializar(String ruta, Usuario u) {
        try (ObjectOutputStream oos = new ObjectOutputStream(new FileOutputStream(ruta))) {
            oos.writeObject(u);
            System.out.println("✅ Objeto serializado con éxito.");
        } catch (IOException e) {
            System.err.println("Error al serializar: " + e.getMessage());
        }
    }

    public static void deserializar(String ruta) {
        try (ObjectInputStream ois = new ObjectInputStream(new FileInputStream(ruta))) {
            Usuario u = (Usuario) ois.readObject();
            System.out.println("📥 Objeto recuperado de disco: " + u);
            // passwordHash aparecerá como null por haber sido marcado transient
        } catch (IOException | ClassNotFoundException e) {
            System.err.println("Error al deserializar: " + e.getMessage());
        }
    }
}
```

---

## 🔀 3. Diferentes Maneras de Persistir Objetos

En la práctica profesional existen dos estrategias principales para persistir grupos de objetos:

### Manera A: Serialización de una Colección Completa (`List<T>`)
Las colecciones estándar de Java (`ArrayList`, `HashSet`, `HashMap`) implementan `Serializable`.
- **Ventaja**: Escribes toda la lista de objetos de golpe con una sola llamada a `oos.writeObject(miLista)`.
- **Lectura**: Recuperas la lista completa con `(List<T>) ois.readObject()`.
- **Cuándo usarla**: Cuando el volumen de datos es pequeño o mediano y cabe íntegramente en la memoria de la aplicación. Para añadir un nuevo elemento, se carga la lista, se agrega el objeto en memoria y se reescribe el archivo entero.

### Manera B: Serialización Objeto a Objeto (Persistencia Continua)
Se persisten los objetos de manera individual, uno detrás de otro:
```java
oos.writeObject(obj1);
oos.writeObject(obj2);
oos.writeObject(obj3);
```
Al leer, se ejecuta un bucle `while(true)` capturando `EOFException` para detectar el fin de los datos.

---

## 💥 4. El Gran Problema del Append: `StreamCorruptedException`

Este es, sin duda, **el error más clásico y desconcertante** al que se enfrentan los alumnos en las prácticas de 2º DAM.

### 4.1 La Anatomía del Problema
Supongamos que quieres crear un método para añadir un nuevo objeto a un fichero existente sin borrar lo anterior. El alumno suele escribir:
```java
// ¡CUIDADO! Código erróneo típico:
FileOutputStream fos = new FileOutputStream("usuarios.dat", true); // Modo append activado
ObjectOutputStream oos = new ObjectOutputStream(fos);
oos.writeObject(nuevoUsuario);
oos.close();
```
El método de escritura se ejecuta sin errores aparentes. Sin embargo, al intentar leer el fichero más tarde con `ObjectInputStream`:
1. El primer objeto se lee correctamente.
2. Al intentar leer el segundo objeto, el programa revienta con:
   ```
   java.io.StreamCorruptedException: invalid type code: AC
   ```

### 4.2 ¿Por qué ocurre?
Cuando se instancia un `ObjectOutputStream`, su constructor escribe automáticamente en los primeros bytes del archivo una **cabecera de control de flujo (Stream Header)** que ocupa 4 bytes:
- `STREAM_MAGIC`: `0xACED` (2 bytes).
- `STREAM_VERSION`: `0x0005` (2 bytes).

Al abrir el fichero en modo `append = true` con un nuevo `ObjectOutputStream`, este **vuelve a escribir los 4 bytes de cabecera en mitad del archivo**.
Cuando el lector (`ObjectInputStream`) procesa el archivo:
- Lee la cabecera al principio del archivo (todo correcto).
- Lee el primer objeto (código de tipo `0x73` - `TC_OBJECT`).
- Llega al segundo bloque... ¡y en vez de un identificador de objeto se encuentra con los bytes `0xACED` de la segunda cabecera! Como no espera una cabecera en mitad de los datos, lanza `StreamCorruptedException: invalid type code: AC`.

```
[ Cabecera 1: AC ED 00 05 ] [ Objeto 1 ] [ Cabecera 2: AC ED 00 05 ] [ Objeto 2 ]
                                         ^
                                         |--- ¡CRASH! ObjectInputStream esperaba un objeto aquí
```

---

## 🛠️ 5. La Solución Docente Estándar: `MiObjectOutputStream`

Para solucionar este fallo de diseño sin reescribir todo el fichero, creamos una subclase de `ObjectOutputStream` que **sobrescribe el método protegido `writeStreamHeader()`**.
Si el archivo ya contiene datos (longitud > 0), anulamos la escritura de la cabecera repetida:

```java
import java.io.IOException;
import java.io.ObjectOutputStream;
import java.io.OutputStream;

public class MiObjectOutputStream extends ObjectOutputStream {

    // Constructor que enlaza con el flujo de salida
    public MiObjectOutputStream(OutputStream out) throws IOException {
        super(out);
    }

    // Constructor por defecto
    protected MiObjectOutputStream() throws IOException, SecurityException {
        super();
    }

    /**
     * Sobrescribimos este método para evitar que Java escriba
     * los 4 bytes de cabecera (AC ED 00 05) en los bloques añadidos.
     */
    @Override
    protected void writeStreamHeader() throws IOException {
        // Al dejar este método vacío, NO se escribe la cabecera intermedia en el archivo
    }
}
```

### 5.1 Factoría de Flujos para Persistencia Append Segura
A la hora de escribir en disco, comprobamos si el archivo físico ya existe y no está vacío:
- Si el archivo **no existe o mide 0 bytes**: Usamos el `ObjectOutputStream` estándar (para que escriba la cabecera inicial obligatoria).
- Si el archivo **ya existe y contiene datos**: Usamos nuestro `MiObjectOutputStream` (para no corromper el archivo con una segunda cabecera).

```java
import java.io.*;

public class GestorPersistenciaAppend {

    public static void anadirObjeto(String rutaFichero, Usuario usuario) {
        File fichero = new File(rutaFichero);
        boolean existeConDatos = fichero.exists() && fichero.length() > 0;

        try {
            // Si ya existe con datos, usamos MiObjectOutputStream; si no, ObjectOutputStream estándar
            try (FileOutputStream fos = new FileOutputStream(fichero, true);
                 ObjectOutputStream oos = existeConDatos 
                         ? new MiObjectOutputStream(fos) 
                         : new ObjectOutputStream(fos)) {
                
                oos.writeObject(usuario);
                System.out.println("✅ Usuario persistido en modo append sin corrupción.");
            }
        } catch (IOException e) {
            System.err.println("Error de persistencia: " + e.getMessage());
        }
    }

    public static void leerTodos(String rutaFichero) {
        File fichero = new File(rutaFichero);
        if (!fichero.exists()) return;

        try (ObjectInputStream ois = new ObjectInputStream(new FileInputStream(fichero))) {
            System.out.println("📖 REGISTROS RECUPERADOS:");
            while (true) {
                Usuario u = (Usuario) ois.readObject();
                System.out.println("  -> " + u);
            }
        } catch (EOFException e) {
            System.out.println("🏁 Fin de lectura del archivo de objetos.");
        } catch (IOException | ClassNotFoundException e) {
            System.err.println("Error durante la deserialización: " + e.getMessage());
        }
    }
}
```

---

## 📊 Resumen Comparativo de Estrategias

| Enfoque | Ventajas | Inconvenientes | Cuándo Usarlo |
| :--- | :--- | :--- | :--- |
| **Serializar `List<T>` completa** | Código elemental. No requiere clases auxiliares como `MiObjectOutputStream`. | Para añadir un elemento hay que leer toda la lista y reescribir el archivo entero. | Datasets pequeños o medianos (< 10.000 registros). |
| **Persistencia secuencial con `MiObjectOutputStream`** | Añadidos (*appends*) ultrarrápidos sin cargar los registros previos en memoria. | Requiere mantener la clase `MiObjectOutputStream` y verificar `file.length() > 0`. | Sistemas de registro (*logs* binarios, eventos continuos). |
| **Acceso aleatorio con `RandomAccessFile`** | Modificación directa *in-situ* de cualquier byte sin tocar el resto. | No maneja objetos automáticos; requiere calcular offsets manuales fijos. | Motores de bases de datos, índices B-Tree. |
