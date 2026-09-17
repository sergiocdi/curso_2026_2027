---
tipo: hoja_ejercicios
modulo: "Acceso a Datos"
ud: "UD01"
bloque: "Bloque 2 - Ficheros Binarios, RAF y Serialización"
ra_asociados: ["RA1"]
ce_asociados: ["CE1.c", "CE1.d"]
dificultad: progresiva
destinatario: alumnado
---

# 📑 Hoja de Ejercicios Complementarios: Ficheros Binarios, RAF y Serialización

> **Módulo**: [[MOC-Acceso-a-Datos|Acceso a Datos]] | **Ciclo**: DAM2 | **Unidad**: [[UD01-Manejo-de-Ficheros|UT1]]  
> **Bloque 2**: Flujos de Bytes, DataStreams, RandomAccessFile y Serialización de Objetos  
> **Solucionario**: [[AD-UT1-B2-Soluciones-Binarios-RAF|Ver Solucionario y Guía Docente (Profesor)]]

---

## 🎯 Objetivos de Aprendizaje
1. Dominio de la persistencia tipada en binario con `DataOutputStream` y `DataInputStream`.
2. Comprensión y control riguroso de la condición de fin de fichero binario mediante `EOFException`.
3. Manipulación posicional directa del disco con `RandomAccessFile`: cálculo de offsets, registros de longitud fija, `seek()`, `getFilePointer()`, `length()` y `setLength()`.
4. Serialización de grafos de objetos con `Serializable`, `serialVersionUID` y `transient`.
5. Resolución del problema de corrupción en modo append (`StreamCorruptedException`) mediante `MiObjectOutputStream`.

---

## 📝 Ejercicio 1 (Nivel Básico): Caja Negra de Flota de Vehículos (`CajaNegraFlota.java`)

### Contexto Empresarial:
Una empresa de transporte urgente equipa sus furgonetas con un módulo IoT que registra cada 5 minutos el estado del vehículo en un archivo binario compacto `flota_gps.dat`. El espacio de almacenamiento flash del dispositivo es sumamente limitado, por lo que está prohibido utilizar texto plano.

### Enunciado:
Implementa una clase de servicio en Java que proporcione dos métodos:
1. `registrarPosicion(int idVehiculo, String matricula, double latitud, double longitud, double velocidad, boolean enRuta)`: Añade un registro al final del fichero binario mediante `DataOutputStream`.
2. `generarInformeFlota()`: Lee secuencialmente todas las tramas con `DataInputStream` hasta el final del archivo y muestra por consola los vehículos que superen el límite de velocidad (120.0 km/h).

### Requerimientos Técnicos:
- Escribir con `writeInt`, `writeUTF`, `writeDouble`, `writeDouble`, `writeDouble` y `writeBoolean`.
- Leer en un bucle infinito `while (true)` hasta capturar de forma limpia `EOFException`.
- Demostrar que el archivo binario ocupa significativamente menos espacio que un CSV equivalente.

---

## 📝 Ejercicio 2 (Nivel Intermedio): Gestor de Almacén Directo en Disco (`AlmacenRAF.java`)

### Contexto Empresarial:
Un supermercado dispone de un archivo binario `articulos.dat` donde almacena 50.000 referencias de productos. Cuando entra mercancía en el muelle de carga, el sistema debe actualizar el stock del artículo en milisegundos. Sería inaceptable reescribir todo el archivo de 50.000 artículos solo para modificar 4 bytes de stock.

### Estructura de Registro Fijo (44 Bytes):
- `id` (`int`): 4 bytes.
- `codigoBarras` (String fijo a 8 caracteres): $8 \times 2 = 16\text{ bytes}$ (con `writeChars`).
- `nombre` (String fijo a 10 caracteres): $10 \times 2 = 20\text{ bytes}$ (con `writeChars`).
- `stock` (`int`): 4 bytes.
- **Total por registro**: $4 + 16 + 20 + 4 = \mathbf{44\text{ bytes}}$.

### Enunciado:
Implementa la clase `AlmacenRAF` con los siguientes métodos de gestión:
1. `insertarArticulo(int posicion, int id, String codigo, String nombre, int stock)`: Sitúa el puntero con `raf.seek(posicion * 44)` y escribe los datos rellenando los textos con espacios hasta su tamaño fijo.
2. `actualizarStock(int posicion, int nuevoStock)`: Calcula el desplazamiento exacto del campo stock dentro del registro ($+40$ bytes desde el inicio del registro) y sobrescribe **únicamente** esos 4 bytes.
3. `consultarArticulo(int posicion)`: Lee y muestra los datos del registro indicado.
4. `obtenerTotalArticulos()`: Retorna el número de registros dividiendo `raf.length() / 44`.
5. `truncarAlmacen(int maxRegistros)`: Reduce el archivo en disco eliminando los sobrantes con `raf.setLength(maxRegistros * 44)`.

---

## 📝 Ejercicio 3 (Nivel Avanzado): Sistema de Auditoría Bancaria con Append Seguro (`AuditoriaBancaria.java`)

### Contexto Empresarial:
Una entidad financiera registra cada transacción monetaria en un archivo de auditoría `transacciones.ser`. Cada operación genera un objeto `Transaccion` que debe anexarse al fichero existente de forma inmediata.

### Enunciado:
1. Diseña la clase `Transaccion` implementando `Serializable`:
   - `private static final long serialVersionUID = 1L;`
   - Atributos: `long id`, `String cuentaOrigen`, `String cuentaDestino`, `double importe`, `LocalDateTime fecha`.
   - Atributo de seguridad: `private transient String pinAutorizacion;` (información confidencial que jamás debe persistirse en el archivo físico).
2. Implementa la clase utilitaria `MiObjectOutputStream extends ObjectOutputStream` sobrescribiendo `writeStreamHeader()` para anular la cabecera intermedia.
3. Desarrolla el método `registrarOperacion(File archivo, Transaccion t)`:
   - Si el archivo no existe o mide 0 bytes, utiliza `new ObjectOutputStream(fos)`.
   - Si el archivo ya existe y mide más de 0 bytes, utiliza `new MiObjectOutputStream(fos)`.
   - Asegura la llamada a `oos.flush()`.
4. Desarrolla el método `listarHistorial(File archivo)`:
   - Lee todos los objetos secuencialmente con `ObjectInputStream` en un bucle `while(true)` hasta `EOFException`.
   - Comprueba que se recuperan todas las transacciones sin que salte la excepción `StreamCorruptedException: invalid type code: AC`.
   - Verifica que el campo `pinAutorizacion` se recupera como `null`.
