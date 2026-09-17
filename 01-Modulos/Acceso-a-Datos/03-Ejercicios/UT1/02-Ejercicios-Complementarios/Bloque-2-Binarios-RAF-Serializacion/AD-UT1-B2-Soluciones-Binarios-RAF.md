---
tipo: solucionario_docente
modulo: "Acceso a Datos"
ud: "UD01"
bloque: "Bloque 2 - Ficheros Binarios, RAF y Serialización"
destinatario: profesor
---

# 🔑 Solucionario Docente: Bloque 2 - Ficheros Binarios, RAF y Serialización

> **Módulo**: [[MOC-Acceso-a-Datos|Acceso a Datos]] | **Ciclo**: DAM2 | **Unidad**: [[UD01-Manejo-de-Ficheros|UT1]]  
> **Hoja de Enunciados**: [[AD-UT1-B2-Ejercicios-Binarios-RAF|Ver Enunciados para Alumnos]]  
> **Docente**: Sergio Capdevila Díez · CIFP Avilés

---

## 💡 Solución Ejercicio 1: Caja Negra de Flota de Vehículos (`CajaNegraFlota.java`)

```java
package soluciones_b2;

import java.io.*;

public class CajaNegraFlota {
    private static final String RUTA_FICHERO = "datos/flota_gps.dat";

    public static void registrarPosicion(int idVehiculo, String matricula, double lat, double lon, double vel, boolean enRuta) {
        File f = new File(RUTA_FICHERO);
        f.getParentFile().mkdirs();

        try (DataOutputStream dos = new DataOutputStream(
                new BufferedOutputStream(new FileOutputStream(f, true)))) {

            dos.writeInt(idVehiculo);
            dos.writeUTF(matricula);
            dos.writeDouble(lat);
            dos.writeDouble(lon);
            dos.writeDouble(vel);
            dos.writeBoolean(enRuta);

            System.out.printf("✅ Telemetría registrada: Vehículo %d (%s) - %.1f km/h%n", idVehiculo, matricula, vel);

        } catch (IOException e) {
            System.err.println("Error al escribir telemetría binaria: " + e.getMessage());
        }
    }

    public static void generarInformeFlota() {
        File f = new File(RUTA_FICHERO);
        if (!f.exists()) {
            System.out.println("No hay datos de telemetría registrados.");
            return;
        }

        int totalRegistros = 0;
        int excesosVelocidad = 0;

        System.out.println("===================================================================");
        System.out.println("             AUDITORÍA DE FLOTA: EXCESOS DE VELOCIDAD (>120 km/h) ");
        System.out.println("===================================================================");

        try (DataInputStream dis = new DataInputStream(
                new BufferedInputStream(new FileInputStream(f)))) {

            while (true) {
                int id = dis.readInt();
                String mat = dis.readUTF();
                double lat = dis.readDouble();
                double lon = dis.readDouble();
                double vel = dis.readDouble();
                boolean enRuta = dis.readBoolean();
                totalRegistros++;

                if (vel > 120.0) {
                    excesosVelocidad++;
                    System.out.printf("⚠️ ALERTA: Vehículo %d [%s] a %.2f km/h en pos (%.4f, %.4f) - En ruta: %b%n",
                            id, mat, vel, lat, lon, enRuta);
                }
            }

        } catch (EOFException e) {
            System.out.println("-------------------------------------------------------------------");
            System.out.printf("Fin de informe: %d tramas procesadas (%d infracciones detectadas).%n",
                    totalRegistros, excesosVelocidad);
        } catch (IOException e) {
            System.err.println("Error leyendo fichero binario: " + e.getMessage());
        }
    }

    public static void main(String[] args) {
        registrarPosicion(1, "1234-BBB", 43.556, -5.924, 115.0, true);
        registrarPosicion(2, "5678-CCC", 43.535, -5.661, 132.5, true); // Exceso
        registrarPosicion(3, "9012-DDD", 43.361, -5.849, 90.0, false);
        registrarPosicion(2, "5678-CCC", 43.540, -5.670, 128.0, true); // Exceso

        generarInformeFlota();
    }
}
```

---

## 💡 Solución Ejercicio 2: Gestor de Almacén Directo en Disco (`AlmacenRAF.java`)

```java
package soluciones_b2;

import java.io.File;
import java.io.IOException;
import java.io.RandomAccessFile;

public class AlmacenRAF {
    // 4B (id) + 16B (8 chars codigo) + 20B (10 chars nombre) + 4B (stock) = 44 Bytes
    public static final int TAM_REGISTRO = 44;
    private final File archivo;

    public AlmacenRAF(String ruta) {
        this.archivo = new File(ruta);
        this.archivo.getParentFile().mkdirs();
    }

    private String ajustarTexto(String texto, int longitudFija) {
        if (texto == null) texto = "";
        if (texto.length() > longitudFija) {
            return texto.substring(0, longitudFija);
        }
        StringBuilder sb = new StringBuilder(texto);
        while (sb.length() < longitudFija) {
            sb.append(' ');
        }
        return sb.toString();
    }

    public void insertarArticulo(int posicion, int id, String codigo, String nombre, int stock) throws IOException {
        try (RandomAccessFile raf = new RandomAccessFile(archivo, "rw")) {
            long offset = (long) posicion * TAM_REGISTRO;
            raf.seek(offset);

            raf.writeInt(id);
            raf.writeChars(ajustarTexto(codigo, 8));   // 8 * 2 = 16 bytes
            raf.writeChars(ajustarTexto(nombre, 10));  // 10 * 2 = 20 bytes
            raf.writeInt(stock);                      // 4 bytes

            System.out.printf("✅ Artículo insertado en posición %d (offset: %d bytes)%n", posicion, offset);
        }
    }

    public void actualizarStock(int posicion, int nuevoStock) throws IOException {
        try (RandomAccessFile raf = new RandomAccessFile(archivo, "rw")) {
            // Offset exacto del stock = base + 4 (id) + 16 (codigo) + 20 (nombre) = base + 40
            long offsetStock = ((long) posicion * TAM_REGISTRO) + 40;
            if (offsetStock + 4 > raf.length()) {
                throw new IndexOutOfBoundsException("La posición " + posicion + " no existe en el fichero.");
            }

            raf.seek(offsetStock);
            raf.writeInt(nuevoStock);

            System.out.printf("🔄 Stock actualizado en disco para posición %d -> Nuevo stock: %d%n", posicion, nuevoStock);
        }
    }

    public void consultarArticulo(int posicion) throws IOException {
        try (RandomAccessFile raf = new RandomAccessFile(archivo, "r")) {
            long offset = (long) posicion * TAM_REGISTRO;
            if (offset + TAM_REGISTRO > raf.length()) {
                System.out.println("❌ No existe registro en la posición " + posicion);
                return;
            }

            raf.seek(offset);
            int id = raf.readInt();

            char[] cCod = new char[8];
            for (int i = 0; i < 8; i++) cCod[i] = raf.readChar();
            String codigo = new String(cCod).trim();

            char[] cNom = new char[10];
            for (int i = 0; i < 10; i++) cNom[i] = raf.readChar();
            String nombre = new String(cNom).trim();

            int stock = raf.readInt();

            System.out.printf("📦 [Pos %d] ID: %d | Código: %s | Nombre: %s | Stock: %d uds.%n",
                    posicion, id, codigo, nombre, stock);
        }
    }

    public long obtenerTotalArticulos() throws IOException {
        try (RandomAccessFile raf = new RandomAccessFile(archivo, "r")) {
            return raf.length() / TAM_REGISTRO;
        }
    }

    public void truncarAlmacen(int maxRegistros) throws IOException {
        try (RandomAccessFile raf = new RandomAccessFile(archivo, "rw")) {
            long nuevaLongitud = (long) maxRegistros * TAM_REGISTRO;
            raf.setLength(nuevaLongitud);
            System.out.printf("✂️ Archivo truncado a %d registros (%d bytes).%n", maxRegistros, nuevaLongitud);
        }
    }

    public static void main(String[] args) throws IOException {
        AlmacenRAF almacen = new AlmacenRAF("datos/articulos.dat");

        almacen.insertarArticulo(0, 101, "COD-0001", "Monitor 4K", 15);
        almacen.insertarArticulo(1, 102, "COD-0002", "Teclado Mec", 50);
        almacen.insertarArticulo(2, 103, "COD-0003", "Mouse Pad", 100);

        System.out.println("Antes de modificar:");
        almacen.consultarArticulo(1);

        // Modificamos directamente en disco el stock del registro 1
        almacen.actualizarStock(1, 42);

        System.out.println("Después de modificar:");
        almacen.consultarArticulo(1);
    }
}
```

---

## 💡 Solución Ejercicio 3: Auditoría Bancaria con Append Seguro (`AuditoriaBancaria.java`)

```java
package soluciones_b2;

import java.io.*;
import java.time.LocalDateTime;

public class AuditoriaBancaria {

    // 1. Subclase que anula la escritura de cabecera en modo append
    public static class MiObjectOutputStream extends ObjectOutputStream {
        public MiObjectOutputStream(OutputStream out) throws IOException {
            super(out);
        }

        @Override
        protected void writeStreamHeader() throws IOException {
            // No escribe cabecera secundaria intermedia (0xACED0005)
        }
    }

    // 2. Entidad Serializable con transient
    public static class Transaccion implements Serializable {
        private static final long serialVersionUID = 1L;

        private long id;
        private String cuentaOrigen;
        private String cuentaDestino;
        private double importe;
        private LocalDateTime fecha;
        private transient String pinAutorizacion; // ¡NO se persiste!

        public Transaccion(long id, String origen, String destino, double importe, String pin) {
            this.id = id;
            this.cuentaOrigen = origen;
            this.cuentaDestino = destino;
            this.importe = importe;
            this.fecha = LocalDateTime.now();
            this.pinAutorizacion = pin;
        }

        @Override
        public String toString() {
            return String.format("[%s] ID: %d | %s -> %s | %.2f € | PIN RAM: %s",
                    fecha.toLocalTime(), id, cuentaOrigen, cuentaDestino, importe, pinAutorizacion);
        }
    }

    // 3. Método de registro con operador ternario docente
    public static void registrarOperacion(File archivo, Transaccion t) {
        archivo.getParentFile().mkdirs();
        boolean yaExisteConDatos = archivo.exists() && archivo.length() > 0;

        try (FileOutputStream fos = new FileOutputStream(archivo, true);
             ObjectOutputStream oos = yaExisteConDatos 
                     ? new MiObjectOutputStream(fos) 
                     : new ObjectOutputStream(fos)) {

            oos.writeObject(t);
            oos.flush();
            System.out.println("✅ Transacción registrada: ID " + t.id);

        } catch (IOException e) {
            System.err.println("Error al serializar transacción: " + e.getMessage());
        }
    }

    // 4. Lectura secuencial completa hasta EOFException
    public static void listarHistorial(File archivo) {
        if (!archivo.exists()) {
            System.out.println("No existe archivo de auditoría.");
            return;
        }

        System.out.println("===================================================================");
        System.out.println("             HISTORIAL DE AUDITORÍA BANCARIA (DESERIALIZACIÓN)     ");
        System.out.println("===================================================================");

        int contador = 0;
        try (ObjectInputStream ois = new ObjectInputStream(new FileInputStream(archivo))) {
            while (true) {
                Transaccion t = (Transaccion) ois.readObject();
                contador++;
                System.out.println("  " + t);
            }
        } catch (EOFException e) {
            System.out.println("-------------------------------------------------------------------");
            System.out.printf("Auditoría finalizada con éxito: %d transacciones recuperadas.%n", contador);
        } catch (ClassNotFoundException e) {
            System.err.println("Error: Clase Transaccion no encontrada.");
        } catch (StreamCorruptedException e) {
            System.err.println("💥 ERROR GRAVE: Stream corrupto por doble cabecera (¿se usó MiObjectOutputStream?): " + e.getMessage());
        } catch (IOException e) {
            System.err.println("Error de lectura: " + e.getMessage());
        }
    }

    public static void main(String[] args) {
        File f = new File("datos/transacciones.ser");
        f.delete(); // Limpiar de pruebas previas

        // Simulamos 3 llamadas independientes en distintos momentos
        registrarOperacion(f, new Transaccion(1001, "ES10-0001", "ES10-0002", 350.00, "1234"));
        registrarOperacion(f, new Transaccion(1002, "ES10-0003", "ES10-0001", 1200.50, "9999"));
        registrarOperacion(f, new Transaccion(1003, "ES10-0002", "ES10-0005", 75.25, "0000"));

        listarHistorial(f);
    }
}
```
