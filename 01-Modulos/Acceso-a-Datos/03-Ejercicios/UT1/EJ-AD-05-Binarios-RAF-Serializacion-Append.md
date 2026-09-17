---
tipo: ejercicio
modulo: "Acceso a Datos"
ud: "UD01"
ra_asociados: ["RA1"]
ce_asociados: ["CE1.b", "CE1.c"]
tipo_actividad: practica_guiada
dificultad: media
tiempo_estimado_min: 90
entregable: proyecto_java
estado: listo
---

# 💻 Ejercicio: Almacén Binario con RAF y Persistencia de Objetos Incremental (Append)

> **Módulo**: [[MOC-Acceso-a-Datos|Acceso a Datos]] | **UD**: [[UD01-Manejo-de-Ficheros|UD01 / UT1]] | **Conceptos**: [[CON-AD-02-Ficheros-Datos-Binarios-RAF|Datos Binarios y RAF]] · [[CON-AD-03-Serializacion-Objetos|Serialización de Objetos]]

---

## 🎯 Objetivo Pedagógico
Este ejercicio aborda dos retos de persistencia binaria fundamentales en aplicaciones profesionales:
1. **Acceso Aleatorio**: Actualizar el stock o el precio de un artículo directamente en el disco físico sin tener que reescribir el fichero completo mediante `RandomAccessFile`.
2. **Serialización Segura e Incremental**: Implementar un sistema de registro de auditoría de usuarios (`UsuarioLog`), resolviendo el famoso problema de la cabecera repetida en modo append (`StreamCorruptedException`) mediante la creación y uso de `MiObjectOutputStream`.

---

## 📝 Enunciado de la Actividad

### Reto 1: Gestor de Inventario con `RandomAccessFile` (`InventarioRAF.java`)
Se gestionará un fichero binario `inventario.dat` compuesto por registros de productos de longitud fija:
- `id` (`int`): 4 bytes.
- `codigo` (5 caracteres fijos con `writeChars`): $5 \times 2 = 10\text{ bytes}$.
- `stock` (`int`): 4 bytes.
- `precio` (`double`): 8 bytes.
- **Tamaño total por registro**: $\mathbf{26\text{ bytes}}$.

**Requisitos**:
1. Desarrollar el método `insertarProducto(int posicion, int id, String codigo, int stock, double precio)` que sitúe el puntero en la posición correspondiente (`posicion * 26`) con `raf.seek()` y escriba los datos.
2. Desarrollar el método `actualizarStock(int posicion, int nuevoStock)` que salte con `seek()` directamente al byte del stock ($+14$ desde el inicio del registro) y sobrescriba únicamente esos 4 bytes.
3. Desarrollar el método `mostrarInventario()` que lea secuencialmente todos los registros comprobando que `raf.getFilePointer() < raf.length()`.
4. Desarrollar el método `truncarInventario(int maxRegistros)` que ajuste el tamaño exacto del fichero en disco mediante `raf.setLength((long) maxRegistros * 26)` y use `raf.skipBytes(n)` para desplazamientos relativos hacia adelante.

---

### Reto 2: Persistencia Incremental de Objetos (`AuditoriaUsuarios.java`)
Diseñar la clase `UsuarioLog` que implemente `Serializable` con:
- `serialVersionUID = 1L`.
- Atributos: `id` (`int`), `username` (`String`), `fechaAcceso` (`LocalDateTime`), `transient String sessionToken` (no debe serializarse).

**Requisitos**:
1. Crear la clase `MiObjectOutputStream` heredando de `ObjectOutputStream` y sobrescribiendo `writeStreamHeader()` para no escribir la cabecera si el fichero ya existe y contiene datos.
2. Implementar `registrarAcceso(File archivo, UsuarioLog log)`:
   - Si el archivo no existe o mide 0 bytes, instanciar `ObjectOutputStream`.
   - Si el archivo ya existe y mide más de 0 bytes, instanciar `MiObjectOutputStream`.
3. Implementar `listarTodos(File archivo)` que lea secuencialmente todos los objetos con `ObjectInputStream` en un bucle `while(true)` finalizando limpiamente al capturar `EOFException`.

---

## 💡 Código Esencial de Demostración

```java
import java.io.*;
import java.time.LocalDateTime;

public class SolucionInventarioYAuditoria {

    // Clase para resolver el reto de cabecera repetida
    public static class MiObjectOutputStream extends ObjectOutputStream {
        public MiObjectOutputStream(OutputStream out) throws IOException {
            super(out);
        }
        @Override
        protected void writeStreamHeader() throws IOException {
            // No escribe cabecera adicional en mitad del fichero
        }
    }

    public static class UsuarioLog implements Serializable {
        private static final long serialVersionUID = 1L;
        private int id;
        private String username;
        private LocalDateTime fechaAcceso;
        private transient String sessionToken;

        public UsuarioLog(int id, String username, String token) {
            this.id = id;
            this.username = username;
            this.fechaAcceso = LocalDateTime.now();
            this.sessionToken = token;
        }

        @Override
        public String toString() {
            return String.format("[%s] Usuario %s (ID: %d) - Token RAM: %s",
                    fechaAcceso, username, id, sessionToken);
        }
    }

    public static void registrarLog(File archivo, UsuarioLog log) {
        boolean existe = archivo.exists() && archivo.length() > 0;
        try (FileOutputStream fos = new FileOutputStream(archivo, true);
             ObjectOutputStream oos = existe ? new MiObjectOutputStream(fos) : new ObjectOutputStream(fos)) {
            oos.writeObject(log);
            System.out.println("✅ Log registrado correctamente: " + log.username);
        } catch (IOException e) {
            System.err.println("Error al escribir objeto: " + e.getMessage());
        }
    }
}
```

---

## 🔍 Criterios de Evaluación
- **Cálculo riguroso de offsets en `RandomAccessFile`**: 30%.
- **Correcta implementación de `MiObjectOutputStream`**: 30%.
- **Control de `EOFException` y deserialización limpia**: 20%.
- **Uso adecuado de `transient` y `serialVersionUID`**: 20%.
