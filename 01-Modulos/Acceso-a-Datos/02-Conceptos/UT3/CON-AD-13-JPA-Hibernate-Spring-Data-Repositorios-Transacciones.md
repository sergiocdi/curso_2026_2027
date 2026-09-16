---
tipo: concepto
modulo: "Acceso a Datos"
ud: "UD03"
ra_asociados: ["RA3"]
tags: [concepto, java, spring-data, jpa, repositorios, jpql, transacciones, orm]
dificultad: media
estado: revisado
---

# 💡 Concepto: La Tríada JPA vs Hibernate vs Spring Data, Repositorios y Transaccionalidad

> **Módulo**: [[MOC-Acceso-a-Datos|Acceso a Datos]] | **UD**: [[UD03-Mapeo-Objeto-Relacional-ORM|UD03 / UT3]] | **RA**: [[RA03-Mapeo-Objeto-Relacional|RA3]]  
> **Conceptos Relacionados**: [[CON-AD-08-Spring-Boot-JPA-Hibernate-Oracle|CON-AD-08: Fundamentos y Maven]], [[CON-AD-09-Entidades-Relaciones-JPQL-Spring-Data|CON-AD-09: Entidades y Relaciones]]

---

## 📌 1. La Tríada Conceptual: JPA vs Hibernate vs Spring Data JPA

Una de las dudas más recurrentes en los exámenes de 2º DAM es confundir qué papel desempeña cada una de estas tres tecnologías:

```text
┌────────────────────────────────────────────────────────────────────────┐
│                          SPRING DATA JPA                               │
│  (Framework de alto nivel: interfaces JpaRepository y Query Methods)   │
├────────────────────────────────────────────────────────────────────────┤
│                     JAKARTA PERSISTENCE API (JPA)                      │
│      (Especificación formal: @Entity, @Id, interfaces estándar)        │
├────────────────────────────────────────────────────────────────────────┤
│                           HIBERNATE ORM                                │
│       (Motor de ejecución: genera el SQL real para Oracle/MySQL)       │
├────────────────────────────────────────────────────────────────────────┤
│                        JDBC (ojdbc11 / Driver)                         │
└────────────────────────────────────────────────────────────────────────┘
```

1. **JPA (Jakarta Persistence API, antes Java Persistence API)**:
   - **Es una ESPECIFICACIÓN (un conjunto de interfaces y anotaciones)**. No contiene código ejecutable para guardar nada en disco. Define el estándar oficial Java para persistencia (`@Entity`, `@Table`, `@ManyToOne`, `EntityManager`).
2. **Hibernate**:
   - **Es una IMPLEMENTACIÓN real (el motor ORM)**. Lee las anotaciones de JPA y se encarga de abrir conexiones, traducir consultas a sentencias SQL según el dialecto del gestor (Oracle, PostgreSQL), gestionar cachés y mapear los `ResultSet` a objetos Java.
3. **Spring Data JPA**:
   - **Es una CAPA DE ABSTRACCIÓN construida sobre JPA e Hibernate**. Elimina por completo la necesidad de instanciar o programar manualmente el `EntityManager` o crear clases DAO repetitivas; basta con declarar una simple interfaz para disponer de operaciones CRUD y paginación automáticas.

---

## 🏛️ 2. De `EntityManager` a `JpaRepository`

En JPA puro tradicional, para buscar o persistir un cliente había que escribir código imperativo con el `EntityManager`:

```java
// Código tradicional con JPA puro (Antiguo y tedioso)
EntityManager em = emf.createEntityManager();
em.getTransaction().begin();
Cliente c = em.find(Cliente.class, 10L);
em.persist(nuevoCliente);
em.getTransaction().commit();
em.close();
```

Con **Spring Data JPA**, simplemente declaramos una **interfaz** extendiendo de `JpaRepository<TipoEntidad, TipoClavePrimaria>`:

```java
package es.educastur.dam2.repository;

import es.educastur.dam2.model.Cliente;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ClienteRepository extends JpaRepository<Cliente, Long> {
    // ¡YA DISPONE DE MÁS DE 20 MÉTODOS CRUD AUTOMÁTICOS SIN ESCRIBIR UNA SOLA LÍNEA DE CÓDIGO!
}
```

### Métodos CRUD Heredados Disponibles Inmediatamente
- `clienteRepository.save(cliente)`: Inserta si el ID es `null` o actualiza si ya existe (*persist / merge*).
- `clienteRepository.findById(id)`: Retorna un `Optional<Cliente>`.
- `clienteRepository.findAll()`: Retorna `List<Cliente>`.
- `clienteRepository.deleteById(id)`: Elimina por clave primaria.
- `clienteRepository.count()`: Cuenta registros con `COUNT(*)`.
- `clienteRepository.existsById(id)`: Comprueba existencia con `SELECT 1`.
- `clienteRepository.findAll(Pageable pageable)`: Paginación y ordenación automática.

---

## 🔍 3. Métodos Derivados (Query Methods por Convención de Nombres)

Spring Data analiza el nombre del método en la interfaz Java y **genera automáticamente la sentencia SQL correspondiente en tiempo de ejecución**:

```java
public interface ClienteRepository extends JpaRepository<Cliente, Long> {

    // Genera: WHERE email = ?
    Optional<Cliente> findByEmail(String email);

    // Genera: WHERE UPPER(nombre) LIKE UPPER(?)
    List<Cliente> findByNombreContainingIgnoreCase(String cadena);

    // Genera: WHERE saldo >= ? AND tipo_cliente = ?
    List<Cliente> findBySaldoGreaterThanEqualAndTipoCliente(Double saldoMin, TipoCliente tipo);

    // Genera: WHERE fecha_alta BETWEEN ? AND ? ORDER BY fecha_alta DESC
    List<Cliente> findByFechaAltaBetweenOrderByFechaAltaDesc(LocalDateTime inicio, LocalDateTime fin);

    // Búsqueda a través de relaciones: WHERE p.cliente.dni = ?
    // (Buscando pedidos por el DNI del cliente)
}
```

---

## ✍️ 4. Consultas Personalizadas con `@Query` (JPQL y SQL Nativo)

Cuando las consultas son complejas o requieren agregaciones, utilizamos la anotación `@Query`.

### A. Consultas con JPQL (Java Persistence Query Language)
JPQL consulta sobre las **clases y atributos de Java**, ¡NUNCA sobre nombres de tablas ni columnas SQL!:

```java
public interface PedidoRepository extends JpaRepository<Pedido, Long> {

    // Parámetros nombrados con ':nombreParametro' y anotación @Param
    @Query("SELECT p FROM Pedido p WHERE p.cliente.id = :clienteId AND p.importeTotal >= :minimo")
    List<Pedido> buscarPedidosImportantes(@Param("clienteId") Long clienteId, @Param("minimo") Double minimo);

    // JOIN FETCH: Solución al problema N+1 de rendimiento
    @Query("SELECT p FROM Pedido p JOIN FETCH p.cliente JOIN FETCH p.productos WHERE p.id = :id")
    Optional<Pedido> findByIdConDetallesCompletos(@Param("id") Long id);
}
```

### B. Consultas Nativas (SQL de Oracle)
Si necesitamos funciones analíticas específicas de Oracle (`ROWNUM`, `NVL`, `CONNECT BY` jerárquico):
```java
    @Query(value = "SELECT * FROM PEDIDOS WHERE ROWNUM <= 10 ORDER BY IMPORTE_TOTAL DESC", nativeQuery = true)
    List<Pedido> findTop10PedidosMasCaros();
```

### C. Actualizaciones y Borrados en Bloque
```java
    @Modifying // Obligatorio para operaciones UPDATE o DELETE
    @Transactional
    @Query("UPDATE Cliente c SET c.saldo = c.saldo + :bono WHERE c.tipoCliente = 'VIP'")
    int bonificarClientesVIP(@Param("bono") Double bono);
```

---

## 🛡️ 5. Gestión de Transacciones con `@Transactional`

En una aplicación empresarial (por ejemplo, una transferencia bancaria o la creación de un pedido con descuento de stock), varias operaciones de base de datos deben ejecutarse bajo las garantías **ACID** (*Atomicidad, Consistencia, Aislamiento y Durabilidad*).

En Spring Boot, las transacciones se gestionan de forma **declarativa** en la **Capa de Servicio (`@Service`)**:

```java
package es.educastur.dam2.service;

import es.educastur.dam2.model.Pedido;
import es.educastur.dam2.repository.PedidoRepository;
import es.educastur.dam2.repository.ProductoRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class PedidoServiceImpl implements PedidoService {

    private final PedidoRepository pedidoRepo;
    private final ProductoRepository productoRepo;

    // Inyección de dependencias por constructor (Buena práctica recomendada)
    public PedidoServiceImpl(PedidoRepository pedidoRepo, ProductoRepository productoRepo) {
        this.pedidoRepo = pedidoRepo;
        this.productoRepo = productoRepo;
    }

    // @Transactional garantiza que si ocurre cualquier error, se ejecuta un ROLLBACK completo
    @Override
    @Transactional(rollbackFor = Exception.class)
    public Pedido crearPedidoConStock(Pedido pedido) {
        // 1. Descontar stock de cada producto
        for (var item : pedido.getProductos()) {
            if (item.getStock() < 1) {
                throw new IllegalStateException("Stock agotado para: " + item.getNombre());
            }
            item.setStock(item.getStock() - 1);
            // Al estar en estado MANAGED, el UPDATE se lanzará solo al hacer commit
        }

        // 2. Guardar pedido en Oracle
        return pedidoRepo.save(pedido);
    }

    // Transacción de SOLO LECTURA: Gran optimización de rendimiento
    // Hibernate desactiva el Dirty Checking y no almacena copias de instantáneas en memoria
    @Override
    @Transactional(readOnly = true)
    public Pedido obtenerPorId(Long id) {
        return pedidoRepo.findById(id)
            .orElseThrow(() -> new RuntimeException("Pedido no encontrado"));
    }
}
```

---

## 🏗️ 6. Arquitectura del Proyecto de Curso

Para el proyecto final de curso, los alumnos deben seguir este flujo de capas estricto:

```text
[ Cliente Web / Postman / Frontend ]
                │  (JSON / HTTP)
                ▼
      [ @RestController ]               ──► Valida entrada y llama al servicio
                │  (DTO)
                ▼
      [ @Service (@Transactional) ]     ──► Contiene la lógica de negocio y ACID
                │  (Entity)
                ▼
      [ JpaRepository ]                 ──► Spring Data JPA (Interfaz)
                │  (Hibernate ORM)
                ▼
      [ Oracle Database 21c / XE ]      ──► Almacenamiento relacional
```

---

## ⚠️ Errores Comunes y Puntos Clave en Taller
- **Poner `@Transactional` en el Controlador**: Grave error arquitectónico. Las transacciones deben vivir en la capa de `@Service` donde reside la lógica de negocio.
- **Checked Exceptions y Rollback**: Por defecto, `@Transactional` solo hace rollback automático ante excepciones no comprobadas (`RuntimeException` o `Error`). Si lanzas una `Exception` normal o `SQLException`, la transacción hace commit a menos que especifiques explícitamente `@Transactional(rollbackFor = Exception.class)`.
- **Inyección por `@Autowired` en atributo vs por Constructor**: La inyección directa en el campo privado con `@Autowired` dificulta los tests unitarios y oculta dependencias circulares. La industria y el equipo oficial de Spring recomiendan siempre la **inyección por constructor**.
