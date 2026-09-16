---
tipo: unidad_didactica
modulo: "Acceso a Datos"
numero_ud: "UD03"
titulo: "UT3: Mapeo Objeto-Relacional (Spring Boot, JPA, Hibernate y Oracle)"
horas_estimadas: 45
ra_asociados: ["RA3"]
ce_asociados: ["CE3.a", "CE3.b", "CE3.c", "CE3.d", "CE3.e"]
trimestre: 2
estado: en_desarrollo
---

# UT3 / UD03: Mapeo Objeto-Relacional con Spring, JPA y Hibernate (Oracle)

> **Módulo**: [[MOC-Acceso-a-Datos|Acceso a Datos]] | **Horas**: `45 h` | **Trimestre**: `2º` | **RA**: `RA3`

---

## 💡 Justificación y Reto Inicial
El desajuste de impedancia (*impedance mismatch*) entre la programación orientada a objetos en Java y el modelo relacional se resuelve en la industria actual mediante **frameworks ORM**. En esta unidad, los alumnos utilizarán el ecosistema empresarial líder (**Spring Boot**, **Spring Data JPA** e **Hibernate**) conectado a una base de datos **Oracle**, desarrollando una capa de persistencia completa, tipada y declarativa sin escribir sentencias SQL manuales complejas.

---

## 🧱 Bloques de Contenidos Principales

### 1. Ecosistema Spring, JPA e Hibernate con Oracle Database
- Introducción al Mapeo Objeto-Relacional (ORM) y arquitectura JPA (Jakarta Persistence API).
- Configuración de un proyecto **Spring Boot** con las dependencias necesarias:
  - `spring-boot-starter-data-jpa`
  - Driver oficial `com.oracle.database.jdbc:ojdbc8` / `ojdbc11`.
- Configuración centralizada de persistencia en `application.properties` / `application.yml`:
  - Cadena de conexión JDBC para Oracle: `spring.datasource.url=jdbc:oracle:thin:@localhost:1521:xe`.
  - Credenciales y dialecto de Hibernate: `spring.jpa.database-platform=org.hibernate.dialect.OracleDialect`.
  - Estrategias de generación del esquema (`spring.jpa.hibernate.ddl-auto`: `validate`, `update`, `none`).
  - Activación de logging y formateo de consultas generadas (`spring.jpa.show-sql=true`).

### 2. Mapeos con la Base de Datos Oracle
- **Mapeo de Entidades Básicas**:
  - Anotaciones estructurales: `@Entity`, `@Table(name = "...")`.
  - Mapeo de clave primaria: `@Id` y generación con secuencias de Oracle:
    - `@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "...")` y `@SequenceGenerator`.
  - Mapeo de atributos y columnas: `@Column(name = "...", nullable = false, length = ...)`.
  - Tipos especiales: Fechas y horas con la API `java.time` (`LocalDate`, `LocalDateTime`), tipos enumerados con `@Enumerated(EnumType.STRING)` y atributos no persistibles con `@Transient`.
- **Mapeo de Relaciones entre Entidades**:
  - Relaciones uno a muchos y muchos a uno: `@ManyToOne` y `@OneToMany(mappedBy = "...")` con clave foránea `@JoinColumn`.
  - Relaciones uno a uno: `@OneToOne`.
  - Relaciones muchos a muchos: `@ManyToMany` y especificación de la tabla intermedia con `@JoinTable`.
  - Estrategias de carga: `FetchType.LAZY` frente a `FetchType.EAGER` (buenas prácticas para evitar el problema de rendimiento N+1).
  - Operaciones en cascada y ciclo de vida de persistencia: `CascadeType` (`PERSIST`, `MERGE`, `REMOVE`, `ALL`) y `orphanRemoval = true`.

### 3. Consultas con la Base de Datos en Spring Data JPA
- **Spring Data Repositories**:
  - Creación de interfaces extendiendo de `JpaRepository<Entidad, ID>` o `CrudRepository`.
  - Métodos de persistencia estándar automáticos: `save()`, `findById()`, `findAll()`, `deleteById()`, `existsById()`.
- **Métodos de Consulta Derivados (Query Methods)**:
  - Creación de consultas basadas en la convención de nombres: `findByNombre()`, `findByPrecioGreaterThan()`, `findByFechaBetween()`, `countByEstado()`.
- **Consultas Declarativas con `@Query` (JPQL y SQL Nativo)**:
  - Definición de consultas orientadas a objetos con **JPQL**:
    `@Query("SELECT c FROM Cliente c WHERE c.activo = true AND c.email LIKE %:dominio%")`.
  - Consultas nativas con dialecto SQL de Oracle:
    `@Query(value = "SELECT * FROM clientes WHERE ROWNUM <= :limite", nativeQuery = true)`.
  - Modificación de datos mediante `@Modifying` y `@Transactional`.
- **Paginación y Ordenación**:
  - Uso de interfaces `Pageable`, `PageRequest` y `Sort` para recuperación eficiente de datos masivos sin saturar la memoria RAM (`Page<Entidad>`).

---

## 🧠 Conceptos Clave
```dataview
TABLE dificultad, estado
FROM "01-Modulos/Acceso-a-Datos/02-Conceptos"
WHERE tipo = "concepto" AND ud = "UD03"
SORT file.name ASC
```

---

## 💻 Actividades y Prácticas
```dataview
TABLE tipo_actividad, dificultad, tiempo_estimado_min + " min" as "Tiempo"
FROM "01-Modulos/Acceso-a-Datos/03-Ejercicios"
WHERE tipo = "ejercicio" AND ud = "UD03"
SORT file.name ASC
```
