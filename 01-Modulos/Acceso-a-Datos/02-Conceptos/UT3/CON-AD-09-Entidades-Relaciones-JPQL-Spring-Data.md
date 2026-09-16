---
tipo: concepto
modulo: "Acceso a Datos"
ud: "UD03"
ra_asociados: ["RA3"]
tags: [concepto, java, jpa, hibernate, entidades, relaciones, manytoone, onetomany, lazy, ciclo-vida]
dificultad: avanzada
estado: revisado
---

# 💡 Concepto: Mapeo de Entidades JPA, Ciclo de Vida y Relaciones Avanzadas con Hibernate

> **Módulo**: [[MOC-Acceso-a-Datos|Acceso a Datos]] | **UD**: [[UD03-Mapeo-Objeto-Relacional-ORM|UD03 / UT3]] | **RA**: [[RA03-Mapeo-Objeto-Relacional|RA3]]

---

## 📌 1. El Ciclo de Vida de una Entidad JPA

En JPA/Hibernate, los objetos de entidad no son simples POJOs en memoria; pasan por **cuatro estados bien definidos** gestionados por el **Contexto de Persistencia (Persistence Context / Caché de 1er Nivel)**:

```text
               new Cliente()
                     │
                     ▼
             ┌───────────────┐
             │   TRANSIENT   │ (Objeto nuevo en memoria, sin ID y sin existir en BD)
             └───────┬───────┘
                     │ persist() / save()
                     ▼
┌───────────►┌───────────────┐◄───────────┐
│            │    MANAGED    │            │ merge()
│            └───────┬───────┘            │
│                    │                    │
│ detach() / clear() │ remove()           │
│                    ▼                    │
│            ┌───────────────┐            │
│            │    REMOVED    │            │
│            └───────────────┘            │
│                                         │
└───────────────────────────►┌────────────┴──┐
                             │   DETACHED    │ (Tiene ID pero ya no está sincronizado con el contexto)
                             └───────────────┘
```

1. **Transient (Nuevo)**: El objeto se acaba de instanciar con `new`. No tiene clave primaria asignada y la base de datos no sabe que existe.
2. **Managed (Gestionado / Persistente)**: El objeto está asociado al contexto de persistencia. Cualquier modificación que hagamos sobre sus atributos con `setX(...)` **se sincronizará automáticamente en la base de datos con un `UPDATE` al cerrarse la transacción (mecanismo de Dirty Checking)**, ¡sin necesidad de llamar a ningún método de guardado!
3. **Detached (Desconectado)**: El objeto tiene ID y existe en la base de datos, pero la sesión de Hibernate o la transacción ya se ha cerrado. Los cambios en memoria no se guardan solos (requiere llamar a `merge()`).
4. **Removed (Eliminado)**: Marcado para ser borrado con un `DELETE` al finalizar la transacción.

---

## 🧱 2. Mapeo de Entidades y Columnas Básicas

```java
package es.educastur.dam2.model;

import jakarta.persistence.*;
import lombok.*;
import java.time.LocalDate;
import java.time.LocalDateTime;

@Entity
@Table(name = "CLIENTES")
@Getter @Setter
@NoArgsConstructor @AllArgsConstructor
@Builder
public class Cliente {

    // Clave primaria generada mediante una secuencia nativa de Oracle
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "cli_seq")
    @SequenceGenerator(name = "cli_seq", sequenceName = "SEC_CLIENTES", allocationSize = 1)
    private Long id;

    @Column(name = "DNI", nullable = false, unique = true, length = 9)
    private String dni;

    @Column(name = "NOMBRE", nullable = false, length = 50)
    private String nombre;

    @Column(name = "APELLIDOS", nullable = false, length = 100)
    private String apellidos;

    @Column(name = "EMAIL", unique = true, length = 120)
    private String email;

    // Persistir un enum por su nombre en texto (NUNCA por su posición ordinal)
    @Enumerated(EnumType.STRING)
    @Column(name = "TIPO_CLIENTE", nullable = false, length = 20)
    private TipoCliente tipoCliente;

    // Manejo de fechas moderno con la API java.time
    @Column(name = "FECHA_NACIMIENTO")
    private LocalDate fechaNacimiento;

    @Column(name = "FECHA_ALTA", updatable = false)
    private LocalDateTime fechaAlta;

    // Atributo calculado o temporal que NO se guarda en la base de datos
    @Transient
    private int edadCalculada;

    @PrePersist
    protected void onPrePersist() {
        this.fechaAlta = LocalDateTime.now();
    }
}
```

---

## 🔗 3. Mapeo de Relaciones: Uno a Muchos (@OneToMany y @ManyToOne)

El modelo relacional conecta tablas mediante **claves foráneas (FK)** en el lado de "muchos". En JPA, una relación bidireccional debe modelar con total precisión qué lado es el dueño de la clave física:

```text
TABLA: PEDIDOS (Lado Propietario)                  TABLA: CLIENTES (Lado Inverso)
┌───────────────────────────────┐                  ┌───────────────────────────────┐
│ ID (PK)                       │                  │ ID (PK)                       │
│ FECHA                         │                  │ NOMBRE                        │
│ CLIENTE_ID (FK -> CLIENTES)   │ ───────────────► │ EMAIL                         │
└───────────────────────────────┘                  └───────────────────────────────┘
```

### Regla de Oro: El Atributo `mappedBy`
- **Lado Propietario (Owning Side)**: Siempre es el lado `@ManyToOne` (donde reside físicamente la columna FK). Lleva la anotación `@JoinColumn(name = "CLIENTE_ID")`.
- **Lado Inverso (Inverse Side)**: Es el lado `@OneToMany`. **DEBE llevar obligatoriamente `mappedBy = "cliente"`** (haciendo referencia al nombre del atributo Java en la otra clase).
> [!CAUTION]
> Si olvidas poner `mappedBy` en `@OneToMany`, Hibernate asumirá erróneamente que se trata de una relación con tabla intermedia y creará automáticamente una tabla no deseada llamada `CLIENTES_PEDIDOS`.

### Código Completo y Métodos de Sincronización (Helper Methods)

```java
@Entity
@Table(name = "CLIENTES")
public class Cliente {
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "cli_seq")
    private Long id;

    private String nombre;

    // mappedBy apunta al atributo 'cliente' dentro de la clase Pedido
    // cascade = CascadeType.ALL: Al guardar/borrar un cliente, se guardan/borran sus pedidos
    // orphanRemoval = true: Si eliminas un pedido de la lista, Hibernate lanza un DELETE en la BD
    @OneToMany(mappedBy = "cliente", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<Pedido> pedidos = new ArrayList<>();

    // MÉTODO HELPER CRÍTICO: Mantiene sincronizados ambos lados de la relación en memoria
    public void addPedido(Pedido pedido) {
        pedidos.add(pedido);
        pedido.setCliente(this);
    }

    public void removePedido(Pedido pedido) {
        pedidos.remove(pedido);
        pedido.setCliente(null);
    }
}
```

```java
@Entity
@Table(name = "PEDIDOS")
public class Pedido {
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "ped_seq")
    private Long id;

    private LocalDateTime fecha;
    private Double importeTotal;

    // LAZY: La información del cliente solo se carga de la base de datos si se solicita explícitamente
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "CLIENTE_ID", nullable = false)
    private Cliente cliente;
}
```

---

## ⚡ 4. Rendimiento: FetchType.LAZY frente a EAGER y el Problema N+1

1. **`FetchType.EAGER` (Carga Ansiosa)**:
   - Al consultar una entidad, Hibernate hace un `JOIN` automático para traerse también todas sus entidades relacionadas inmediatamente.
   - **Peligro**: Si una consulta carga 50 clientes y cada cliente tiene pedidos, productos y facturas marcados como EAGER, Hibernate ejecutará cientos de consultas innecesarias, colapsando el rendimiento.
2. **`FetchType.LAZY` (Carga Perezosa)**:
   - Hibernate solo carga la entidad principal y coloca un objeto sustituto (**Proxy**) en la relación. La consulta SQL a la tabla secundaria solo se dispara cuando se ejecuta `pedido.getCliente().getNombre()`.
   - **Buenas Prácticas Profesionales**:
     - Configurar **SIEMPRE `fetch = FetchType.LAZY`** tanto en `@ManyToOne` como en `@OneToMany` y `@ManyToMany`.

### El Temido "Problema de las N+1 Consultas"
Si ejecutas `pedidoRepository.findAll()` para obtener 100 pedidos y luego recorres un bucle para mostrar el nombre del cliente de cada pedido:
- Consulta 1: Trae los 100 pedidos (`SELECT * FROM PEDIDOS`).
- Consultas 2 a 101: Por cada pedido en el bucle, Hibernate dispara una consulta SQL individual para buscar al cliente (`SELECT * FROM CLIENTES WHERE ID = ?`).
- **Total**: \(1 + N = 101\) consultas lanzadas a Oracle por una simple lista.

#### La Solución Definitiva: `JOIN FETCH`
Se declara una consulta JPQL personalizada en el repositorio que fuerza la carga en una sola sentencia `JOIN` de base de datos:
```java
@Query("SELECT p FROM Pedido p JOIN FETCH p.cliente")
List<Pedido> findAllWithCliente();
```
¡Esto reduce las 101 consultas a **1 única consulta SQL ultraeficiente**!

---

## ⚠️ Errores Comunes y Puntos Clave en Taller
- **`LazyInitializationException`**: Ocurre cuando intentas acceder a un atributo `LAZY` (por ejemplo, `pedido.getCliente().getNombre()`) fuera de la transacción `@Transactional` (típicamente en la vista o controlador). Al haberse cerrado la sesión de Hibernate, el Proxy ya no puede conectarse a la BD. **Solución**: Cargar los datos necesarios con `JOIN FETCH` o mapear a DTO dentro de la capa `@Service`.
- **Relaciones Muchos a Muchos (@ManyToMany)**: Deben llevar siempre una tabla intermedia definida con `@JoinTable`:
  ```java
  @ManyToMany
  @JoinTable(
      name = "PRODUCTOS_PEDIDOS",
      joinColumns = @JoinColumn(name = "PEDIDO_ID"),
      inverseJoinColumns = @JoinColumn(name = "PRODUCTO_ID")
  )
  private List<Producto> productos = new ArrayList<>();
  ```
