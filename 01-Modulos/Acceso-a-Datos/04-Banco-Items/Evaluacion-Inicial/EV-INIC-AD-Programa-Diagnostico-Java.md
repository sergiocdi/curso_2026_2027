---
tipo: evaluacion_inicial
modulo: "Acceso a Datos"
ciclo: "DAM"
curso: 2
curso_academico: "2026-2027"
tiempo_estimado_min: 90
calificacion: "diagnostica_no_calificable"
profesor: "Profesor Sergio"
actualizado: 2026-09-09
---

# 💾 Evaluación Inicial Diagnóstica: Acceso a Datos (2º DAM)

> **Módulo**: [[MOC-Acceso-a-Datos|Acceso a Datos]] | **Ciclo**: 2º Desarrollo de Aplicaciones Multiplataforma | **Duración**: `90 minutos`
> **Finalidad**: Diagnosticar las competencias adquiridas en 1º de DAM en **Programación en Java** (POO, encapsulamiento, colecciones del framework de Java, control de excepciones y lógica de filtrado/búsqueda). Esta prueba sirve como punto de partida para abordar con éxito el manejo de ficheros, JDBC, JPA/Hibernate y Spring Boot.

---

## 🎯 Reto Técnico: "Gestor de Inventario de Componentes Hardware"

Una tienda especializada en componentes informáticos necesita un módulo básico en memoria para gestionar su catálogo de productos y controlar el stock antes de implementar la persistencia definitiva en bases de datos relacionales.

Debes construir una pequeña aplicación de consola en **Java SE (versión 17 o 21)** estructurada en paquetes limpios y orientada a objetos.

---

## 🧱 Especificaciones Técnicas y Clases Requeridas

### 1. Clase Modelo: `Producto`
Crea la clase `Producto` dentro del paquete `com.tienda.modelo` con los siguientes atributos privados:
* `id` (`int`): Identificador único del producto.
* `nombre` (`String`): Denominación del componente (ej: *"Memoria RAM DDR5 32GB"*).
* `categoria` (`String`): Tipo de componente (ej: *"MEMORIA"*, *"PROCESADOR"*, *"ALMACENAMIENTO"*).
* `precio` (`double`): Precio unitario en euros (debe ser mayor que 0.0).
* `stock` (`int`): Cantidad disponible en almacén (no puede ser negativo).

**Requisitos de la clase `Producto`:**
* Constructor completo con todos los atributos validando que el precio sea $> 0$ y el stock $\ge 0$ (si no se cumple, lanzar `IllegalArgumentException`).
* Métodos *getters* y *setters* con la misma validación.
* Sobrescritura de `toString()` con un formato legible y profesional.
* Sobrescritura de `equals()` y `hashCode()` basados exclusivamente en el atributo `id`.

---

### 2. Excepción Personalizada: `StockInsuficienteException`
Crea una clase de excepción verificada (*checked exception*) o no verificada (*unchecked*) en `com.tienda.excepciones`:
* Nombre: `StockInsuficienteException`.
* Debe heredar de `Exception` (o `RuntimeException`) y permitir pasar un mensaje explicativo y la cantidad faltante.

---

### 3. Clase Gestora / Servicio: `InventarioService`
Crea la clase `InventarioService` en el paquete `com.tienda.servicio` que mantenga internamente una lista de productos en memoria (`List<Producto> productoList = new ArrayList<>();`).

Debe implementar los siguientes métodos:
1. `void registrarProducto(Producto p)`:
   - Añade el producto a la lista.
   - **Regla**: Si ya existe un producto con el mismo `id` en la lista, no debe duplicarse; debe lanzar una excepción o mostrar advertencia.
2. `Producto buscarPorId(int id)`:
   - Recorre la colección y retorna el producto si lo encuentra.
   - Si no existe, retorna `null` o un `Optional<Producto>` (se valora positivamente el uso de `Optional`).
3. `List<Producto> filtrarPorCategoria(String categoria)`:
   - Retorna una nueva lista conteniendo únicamente los productos cuya categoría coincida (ignorando mayúsculas/minúsculas).
4. `void venderProducto(int id, int cantidadAVender) throws StockInsuficienteException`:
   - Busca el producto por `id`. Si no existe, lanza `NoSuchElementException`.
   - Si la `cantidadAVender` es mayor que el stock disponible, lanza `StockInsuficienteException`.
   - Si hay stock suficiente, descuenta la cantidad del stock del producto.
5. `double calcularValorTotalInventario()`:
   - Calcula y retorna la suma de $(precio 	imes stock)$ de todos los productos almacenados.

---

### 4. Clase Principal: `Main`
Crea la clase ejecutable `com.tienda.Main` que realice las siguientes operaciones de prueba guiadas:
1. Instanciar `InventarioService`.
2. Registrar al menos **4 productos** de prueba de distintas categorías.
3. Mostrar por consola todo el catálogo inicial.
4. Realizar una búsqueda por ID existente y otra por un ID inexistente.
5. Filtrar y mostrar los productos de una categoría específica (ej: *"ALMACENAMIENTO"*).
6. Ejecutar una **venta exitosa** de un producto reduciendo su stock y verificar el nuevo stock.
7. Provocar intencionadamente una venta que supere el stock existente, encerrándola en un bloque `try-catch` para capturar la excepción `StockInsuficienteException` y mostrar el mensaje de error amigable por consola sin que el programa caiga.
8. Imprimir el **valor total económico del inventario** restante.

---

## 📊 Criterios de Evaluación y Rúbrica de Diagnóstico (Docente)

| Criterio | Nivel Insuficiente (0-4) | Nivel Aceptable (5-6) | Nivel Avanzado / Óptimo (7-10) |
| :--- | :--- | :--- | :--- |
| **POO y Encapsulamiento (25%)** | Atributos públicos, sin constructores adecuados o sin encapsular. | Encapsulamiento correcto; getters/setters estándar sin validaciones. | Encapsulamiento riguroso, validaciones en constructor/setters, `equals/hashCode` implementados correctamente. |
| **Manejo de Colecciones (25%)** | Usa arrays fijos simples con dificultad para redimensionar o añadir. | Usa `ArrayList` con bucles `for` tradicionales para búsquedas. | Manejo impecable de `List<T>`, uso eficiente de `contains()`, `Optional` o Streams de Java 8+. |
| **Control de Errores y Excepciones (25%)** | El programa crashea ante datos inválidos; ignora el manejo de excepciones. | Captura excepciones genéricas (`catch (Exception e)`); no crea clase custom. | Crea y propaga `StockInsuficienteException`, uso de `try-catch-finally` con mensajes limpios al usuario. |
| **Calidad de Código y Estructura (25%)** | Todo el código en un único fichero `Main.java`, variables con nombres de una letra (`x, a, b`). | Paquetes separados y nombres claros, comentarios básicos. | Arquitectura modular limpia, código autodocumentado, nomenclatura CamelCase estricta y código robusto. |

---

## 🔑 Solución Modelo de Referencia (Profesor Sergio)

> [!NOTE]- Ver Código Java Completo (Haz clic para desplegar)
> ### 1. Excepción Personalizada
> ```java
> package com.tienda.excepciones;
> 
> public class StockInsuficienteException extends Exception {
>     private final int stockDisponible;
>     private final int cantidadSolicitada;
> 
>     public StockInsuficienteException(String mensaje, int stockDisponible, int cantidadSolicitada) {
>         super(mensaje);
>         this.stockDisponible = stockDisponible;
>         this.cantidadSolicitada = cantidadSolicitada;
>     }
> 
>     public int getStockDisponible() { return stockDisponible; }
>     public int getCantidadSolicitada() { return cantidadSolicitada; }
> }
> ```
> 
> ### 2. Clase Modelo `Producto`
> ```java
> package com.tienda.modelo;
> 
> import java.util.Objects;
> 
> public class Producto {
>     private int id;
>     private String nombre;
>     private String categoria;
>     private double precio;
>     private int stock;
> 
>     public Producto(int id, String nombre, String categoria, double precio, int stock) {
>         if (precio <= 0) throw new IllegalArgumentException("El precio debe ser superior a 0");
>         if (stock < 0) throw new IllegalArgumentException("El stock no puede ser negativo");
>         this.id = id;
>         this.nombre = nombre;
>         this.categoria = categoria;
>         this.precio = precio;
>         this.stock = stock;
>     }
> 
>     public int getId() { return id; }
>     public String getNombre() { return nombre; }
>     public void setNombre(String nombre) { this.nombre = nombre; }
>     public String getCategoria() { return categoria; }
>     public void setCategoria(String categoria) { this.categoria = categoria; }
>     public double getPrecio() { return precio; }
>     public void setPrecio(double precio) {
>         if (precio <= 0) throw new IllegalArgumentException("Precio inválido");
>         this.precio = precio;
>     }
>     public int getStock() { return stock; }
>     public void setStock(int stock) {
>         if (stock < 0) throw new IllegalArgumentException("Stock inválido");
>         this.stock = stock;
>     }
> 
>     @Override
>     public boolean equals(Object o) {
>         if (this == o) return true;
>         if (o == null || getClass() != o.getClass()) return false;
>         Producto producto = (Producto) o;
>         return id == producto.id;
>     }
> 
>     @Override
>     public int hashCode() {
>         return Objects.hash(id);
>     }
> 
>     @Override
>     public String toString() {
>         return String.format("[%d] %-30s | Cat: %-15s | %8.2f € | Stock: %3d uds",
>                 id, nombre, categoria, precio, stock);
>     }
> }
> ```
> 
> ### 3. Clase `InventarioService`
> ```java
> package com.tienda.servicio;
> 
> import com.tienda.excepciones.StockInsuficienteException;
> import com.tienda.modelo.Producto;
> import java.util.*;
> 
> public class InventarioService {
>     private final List<Producto> productos = new ArrayList<>();
> 
>     public void registrarProducto(Producto p) {
>         if (productos.contains(p)) {
>             System.err.println("AVISO: Ya existe un producto con el ID " + p.getId());
>             return;
>         }
>         productos.add(p);
>     }
> 
>     public Optional<Producto> buscarPorId(int id) {
>         return productos.stream()
>                 .filter(p -> p.getId() == id)
>                 .findFirst();
>     }
> 
>     public List<Producto> filtrarPorCategoria(String categoria) {
>         return productos.stream()
>                 .filter(p -> p.getCategoria().equalsIgnoreCase(categoria))
>                 .toList();
>     }
> 
>     public void venderProducto(int id, int cantidad) throws StockInsuficienteException {
>         Producto p = buscarPorId(id).orElseThrow(
>                 () -> new NoSuchElementException("Producto no encontrado con ID: " + id));
> 
>         if (p.getStock() < cantidad) {
>             throw new StockInsuficienteException(
>                     "Stock insuficiente para '" + p.getNombre() + "'. Solicitado: " + cantidad + ", Disponible: " + p.getStock(),
>                     p.getStock(), cantidad);
>         }
>         p.setStock(p.getStock() - cantidad);
>     }
> 
>     public double calcularValorTotalInventario() {
>         return productos.stream()
>                 .mapToDouble(p -> p.getPrecio() * p.getStock())
>                 .sum();
>     }
> 
>     public List<Producto> getTodos() {
>         return Collections.unmodifiableList(productos);
>     }
> }
> ```
> 
> ### 4. Clase `Main`
> ```java
> package com.tienda;
> 
> import com.tienda.excepciones.StockInsuficienteException;
> import com.tienda.modelo.Producto;
> import com.tienda.servicio.InventarioService;
> 
> public class Main {
>     public static void main(String[] args) {
>         System.out.println("=== PRUEBA DIAGNÓSTICA: GESTOR DE INVENTARIO (DAM2) ===");
>         InventarioService service = new InventarioService();
> 
>         // 1. Alta de productos
>         service.registrarProducto(new Producto(1, "SSD NVMe 1TB PCIe 4.0", "ALMACENAMIENTO", 85.50, 20));
>         service.registrarProducto(new Producto(2, "Memoria RAM DDR5 32GB 6000MHz", "MEMORIA", 115.00, 15));
>         service.registrarProducto(new Producto(3, "Intel Core i7-14700K", "PROCESADOR", 410.00, 8));
>         service.registrarProducto(new Producto(4, "SSD SATA 2TB Kingston", "ALMACENAMIENTO", 120.00, 10));
> 
>         // 2. Mostrar inventario completo
>         System.out.println("\n--- CATÁLOGO INICIAL ---");
>         service.getTodos().forEach(System.out::println);
> 
>         // 3. Filtrar por categoría
>         System.out.println("\n--- PRODUCTOS DE ALMACENAMIENTO ---");
>         service.filtrarPorCategoria("ALMACENAMIENTO").forEach(System.out::println);
> 
>         // 4. Venta exitosa
>         System.out.println("\n--- REALIZANDO VENTA CORRECTA ---");
>         try {
>             service.venderProducto(1, 5);
>             System.out.println("Venta de 5 uds del Producto 1 realizada con éxito.");
>             System.out.println("Nuevo estado: " + service.buscarPorId(1).get());
>         } catch (Exception e) {
>             System.err.println("Error en venta: " + e.getMessage());
>         }
> 
>         // 5. Venta errónea por stock insuficiente
>         System.out.println("\n--- INTENTO DE VENTA QUE SUPERA STOCK ---");
>         try {
>             service.venderProducto(3, 50); // Solo hay 8
>         } catch (StockInsuficienteException e) {
>             System.out.println("CONTROL DE EXCEPCIÓN CORRECTO: " + e.getMessage());
>         }
> 
>         // 6. Valor total
>         System.out.printf("\nVALOR TOTAL EN ALMACÉN: %.2f €\n", service.calcularValorTotalInventario());
>         System.out.println("==========================================================");
>     }
> }
> ```
