---
tipo: ejercicio
modulo: "Acceso a Datos"
ud: "UD01"
ra_asociados: ["RA1"]
ce_asociados: ["CE1.b", "CE1.c"]
tipo_actividad: reto
dificultad: media
tiempo_estimado_min: 60
rubrica: "[[Rubrica-Practicas-Programacion]]"
---

# 💻 Ejercicio Guiado: Persistencia Binaria y Serialización de Alumnos

> **Módulo**: [[MOC-Acceso-a-Datos|Acceso a Datos]] | **UD**: [[UD01-Manejo-de-Ficheros|UD01 / UT1]] | **RAs**: `RA1 (CE1.b, CE1.c)` | **Tiempo**: `60 min`

---

## 📋 Enunciado

En este ejercicio se implementará un doble mecanismo de persistencia para una entidad `Estudiante`:
1. **Parte A (Flujo de Datos Tipados con `DataOutputStream` / `DataInputStream`)**:
   - Guardar en un fichero `estudiantes.dat` una secuencia de alumnos con los campos: DNI (`String`), nombre (`String`), edad (`int`) y nota media (`double`).
   - Leer el fichero binario secuencialmente hasta el final (`EOFException`) e imprimir los registros formateados.
2. **Parte B (Serialización de Objetos con `ObjectOutputStream` / `ObjectInputStream`)**:
   - Modelar la clase `Estudiante` implementando `Serializable` con `serialVersionUID`.
   - Incluir un campo `transient String passwordAcceso` para verificar que la información sensible no se serializa.
   - Serializar una lista `List<Estudiante>` en `alumnos_serializados.bin` y recuperarla en memoria mostrando la omisión del campo `passwordAcceso`.

---

## 🛠️ Requisitos Técnicos
- Gestión adecuada de recursos mediante bloques `try-with-resources`.
- Tratamiento de la condición de fin de fichero binario capturando `EOFException`.
- Definición explícita de `serialVersionUID = 1L`.

---

## 🔑 Solución Modelo (Profesor)

> [!NOTE]- Ver Solución Parte A: DataStream (Haz clic para desplegar)
> ```java
> import java.io.*;
> 
> public class EjercicioDataStream {
>     public static void escribirEstudiantes(String ruta) throws IOException {
>         try (DataOutputStream dos = new DataOutputStream(
>                 new BufferedOutputStream(new FileOutputStream(ruta)))) {
>             // Registro 1
>             dos.writeUTF("71889922X");
>             dos.writeUTF("Laura Gomez");
>             dos.writeInt(22);
>             dos.writeDouble(8.75);
>             
>             // Registro 2
>             dos.writeUTF("53998811K");
>             dos.writeUTF("Carlos Menendez");
>             dos.writeInt(25);
>             dos.writeDouble(9.10);
>         }
>     }
> 
>     public static void leerEstudiantes(String ruta) {
>         try (DataInputStream dis = new DataInputStream(
>                 new BufferedInputStream(new FileInputStream(ruta)))) {
>             while (true) {
>                 String dni = dis.readUTF();
>                 String nombre = dis.readUTF();
>                 int edad = dis.readInt();
>                 double nota = dis.readDouble();
>                 System.out.printf("DNI: %s | Nombre: %s | Edad: %d | Nota: %.2f%n", dni, nombre, edad, nota);
>             }
>         } catch (EOFException e) {
>             // Fin natural del archivo binario
>             System.out.println("-> Fin de lectura del fichero binario tipado.");
>         } catch (IOException e) {
>             System.err.println("Error de E/S: " + e.getMessage());
>         }
>     }
> }
> ```

> [!NOTE]- Ver Solución Parte B: Serialización (Haz clic para desplegar)
> ```java
> import java.io.*;
> import java.util.ArrayList;
> import java.util.List;
> 
> class Estudiante implements Serializable {
>     private static final long serialVersionUID = 1L;
>     
>     private String dni;
>     private String nombre;
>     private transient String passwordAcceso; // Se omite en disco
> 
>     public Estudiante(String dni, String nombre, String passwordAcceso) {
>         this.dni = dni;
>         this.nombre = nombre;
>         this.passwordAcceso = passwordAcceso;
>     }
> 
>     @Override
>     public String toString() {
>         return "Estudiante{dni='" + dni + "', nombre='" + nombre + "', password='" + passwordAcceso + "'}";
>     }
> }
> 
> public class EjercicioSerializacion {
>     public static void serializarLista(String ruta, List<Estudiante> lista) throws IOException {
>         try (ObjectOutputStream oos = new ObjectOutputStream(new FileOutputStream(ruta))) {
>             oos.writeObject(lista);
>         }
>     }
> 
>     @SuppressWarnings("unchecked")
>     public static List<Estudiante> deserializarLista(String ruta) throws IOException, ClassNotFoundException {
>         try (ObjectInputStream ois = new ObjectInputStream(new FileInputStream(ruta))) {
>             return (List<Estudiante>) ois.readObject();
>         }
>     }
> 
>     public static void main(String[] args) throws Exception {
>         String archivo = "estudiantes.bin";
>         List<Estudiante> lista = new ArrayList<>();
>         lista.add(new Estudiante("71889922X", "Laura", "secreto123"));
>         lista.add(new Estudiante("53998811K", "Carlos", "adminPass!"));
> 
>         serializarLista(archivo, lista);
>         List<Estudiante> recuperados = deserializarLista(archivo);
>         
>         recuperados.forEach(System.out::println);
>         // Se observará que password es null debido al modificador transient
>     }
> }
> ```
