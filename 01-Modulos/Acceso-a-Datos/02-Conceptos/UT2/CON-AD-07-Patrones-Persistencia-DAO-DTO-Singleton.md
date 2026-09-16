---
tipo: concepto
modulo: "Acceso a Datos"
ud: "UD02"
ra_asociados: ["RA2"]
tags: [concepto, java, jdbc, oracle, patrones, singleton, dao, dto, mapper]
dificultad: media
estado: revisado
---

# 💡 Concepto: Patrones de Diseño en Persistencia Relacional: Singleton, DAO y DTO

> **Módulo**: [[MOC-Acceso-a-Datos|Acceso a Datos]] | **UD**: [[UD02-Conectores-BBDD-Relacionales|UD02 / UT2]] | **RA**: [[RA02-Conectores-BBDD|RA2]]

---

## 📌 1. ¿Por qué utilizar patrones en el acceso a datos?
En aplicaciones profesionales nunca se dispersan sentencias SQL por los controladores web, interfaces gráficas o clases de negocio. La persistencia de datos debe estructurarse bajo una arquitectura desacoplada y modular:

```text
┌──────────────┐         DTO          ┌───────────────────┐        Entity         ┌─────────────┐       SQL       ┌──────────────┐
│  Vista / UI  │ ◄──────────────────► │ Capa de Servicio  │ ◄───────────────────► │  Capa DAO   │ ◄─────────────► │ Base Datos   │
│  (Frontend)  │   (Datos limpios)    │ (Lógica Negocio)  │  (Modelo de datos)    │ (JDBC/SQL)  │  (Oracle/Postg) │ (Tablas BBDD)│
└──────────────┘                      └─────────┬─────────┘                       └──────┬──────┘                 └──────────────┘
                                                │                                        │
                                                │                              Usa       ▼
                                                │                          ┌───────────────────────────┐
                                                └────────────────────────► │ Patrón Singleton (Conex.) │
                                                                           └───────────────────────────┘
```

- **Separación de responsabilidades**: Si el motor de base de datos cambia de Oracle a PostgreSQL, la lógica de negocio y las vistas no deben sufrir ninguna alteración.
- **Seguridad**: Evitar que campos confidenciales de las tablas (hashes de contraseñas, tokens, claves internas) viajen hacia las pantallas de usuario.
- **Testeabilidad**: Permite crear fácilmente implementaciones simuladas (*mocks*) de los DAOs para pruebas unitarias sin depender de una base de datos física encendida.

---

## 🧱 2. Los Tres Patrones Fundamentales

### A. Patrón Singleton (Gestor Centralizado de Conexiones)
Garantiza que solo exista una única instancia de la clase gestora de conexiones en toda la máquina virtual Java (JVM), ofreciendo un punto de acceso global y evitando agotar los recursos de conexiones del servidor de base de datos.

```java
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class OracleDatabaseManager {
    private static final String URL = "jdbc:oracle:thin:@localhost:1521:xe";
    private static final String USER = "c##dam2_user";
    private static final String PASS = "oraclePass123";

    // Instancia única estática privada
    private static OracleDatabaseManager instance;

    // Constructor privado para impedir instanciación externa con 'new'
    private OracleDatabaseManager() {}

    // Método de acceso global thread-safe
    public static synchronized OracleDatabaseManager getInstance() {
        if (instance == null) {
            instance = new OracleDatabaseManager();
        }
        return instance;
    }

    public Connection getConnection() throws SQLException {
        return DriverManager.getConnection(URL, USER, PASS);
    }
}
```

---

### B. Patrón DTO (Data Transfer Object)
Un **DTO** es un objeto plano simple (POJO o Java Record) diseñado específicamente para **empaquetar y transportar datos entre diferentes subsistemas o capas** de una aplicación en una única llamada, sin contener lógica de negocio.

#### 1. ¿Qué problema resuelve el DTO?
- **Evita exponer las Entidades de la base de datos**: Una entidad (`Entity`) representa fielmente una tabla de la base de datos (con columnas como `password_hash`, `intentos_fallidos`, `fecha_creacion`). Si la aplicación devuelve la entidad directamente al frontend o API, está cometiendo una grave **brecha de seguridad** y generando **tráfico de red innecesario (over-fetching)**.
- **Agregación de múltiples tablas**: Muchas veces la interfaz de usuario necesita mostrar en una sola tabla de pantalla datos del cliente y de su dirección física (`Customer` y `Address`). En lugar de obligar al cliente a hacer múltiples llamadas lentas por la red (*under-fetching / chatty calls*) o ensuciar las entidades con campos ajenos, el DTO agrupa los campos exactos requeridos.

#### 2. Implementación Moderna en Java con `record` (Inmutable)
```java
// DTO que transporta los datos públicos de un empleado hacia la vista o API
public record EmpleadoDTO(
    int id,
    String dni,
    String nombreCompleto,
    String departamento,
    double salario
) {}
```

#### 3. El Rol del Mapper / Converter
Para transformar la entidad interna en el DTO que viaja a la vista (y viceversa), se utiliza una clase convertidora (**Mapper / Assembler**):

```java
public class EmpleadoMapper {
    // Convierte del modelo de base de datos (Entity) al DTO de transporte
    public static EmpleadoDTO toDTO(Empleado entity) {
        return new EmpleadoDTO(
            entity.getId(),
            entity.getDni(),
            entity.getNombre() + " " + entity.getApellidos(),
            entity.getDepartamento(),
            entity.getSalario()
            // Nótese que NO copiamos el campo sensible passwordHash
        );
    }
}
```
*(Para profundizar en casos complejos de agregación de tablas y converters avanzados, consulta [[CON-AD-12-Arquitectura-DTO-Entity-Mapper|CON-AD-12: El Patrón Arquitectónico DTO, Entidades y Converters]])*.

---

### C. Patrón DAO (Data Access Object)
Encapsula y aísla por completo todo el acceso físico a la base de datos. La capa de negocio interactúa exclusivamente con una **interfaz Java (`EmpleadoDAO`)**, desconociendo por completo las sentencias SQL, las tablas o el conector JDBC subyacente.

#### 1. Interfaz DAO (Contrato público)
```java
import java.util.List;
import java.util.Optional;

public interface EmpleadoDAO {
    Optional<EmpleadoDTO> findById(int id);
    List<EmpleadoDTO> findAll();
    boolean insert(EmpleadoDTO empleado);
    boolean update(EmpleadoDTO empleado);
    boolean delete(int id);
}
```

#### 2. Implementación Concreta con JDBC y Oracle (`EmpleadoDAOOracleImpl`)
```java
import java.sql.*;
import java.util.*;

public class EmpleadoDAOOracleImpl implements EmpleadoDAO {
    private final OracleDatabaseManager dbManager = OracleDatabaseManager.getInstance();

    @Override
    public Optional<EmpleadoDTO> findById(int id) {
        String sql = "SELECT id, dni, nombre, departamento, salario FROM EMPLEADOS WHERE id = ?";
        
        try (Connection con = dbManager.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            
            ps.setInt(1, id);
            
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return Optional.of(new EmpleadoDTO(
                        rs.getInt("id"),
                        rs.getString("dni"),
                        rs.getString("nombre"),
                        rs.getString("departamento"),
                        rs.getDouble("salario")
                    ));
                }
            }
        } catch (SQLException e) {
            System.err.println("Error SQL al consultar empleado (código Oracle " + e.getErrorCode() + "): " + e.getMessage());
        }
        return Optional.empty();
    }

    @Override
    public List<EmpleadoDTO> findAll() {
        List<EmpleadoDTO> lista = new ArrayList<>();
        String sql = "SELECT id, dni, nombre, departamento, salario FROM EMPLEADOS ORDER BY id";
        
        try (Connection con = dbManager.getConnection();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            
            while (rs.next()) {
                lista.add(new EmpleadoDTO(
                    rs.getInt("id"),
                    rs.getString("dni"),
                    rs.getString("nombre"),
                    rs.getString("departamento"),
                    rs.getDouble("salario")
                ));
            }
        } catch (SQLException e) {
            System.err.println("Error SQL al listar empleados: " + e.getMessage());
        }
        return lista;
    }

    @Override
    public boolean insert(EmpleadoDTO emp) {
        String sql = "INSERT INTO EMPLEADOS (id, dni, nombre, departamento, salario) VALUES (?, ?, ?, ?, ?)";
        try (Connection con = dbManager.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, emp.id());
            ps.setString(2, emp.dni());
            ps.setString(3, emp.nombreCompleto());
            ps.setString(4, emp.departamento());
            ps.setDouble(5, emp.salario());
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            System.err.println("Error SQL al insertar empleado: " + e.getMessage());
            return false;
        }
    }

    @Override
    public boolean update(EmpleadoDTO emp) { return false; }

    @Override
    public boolean delete(int id) { return false; }
}
```

---

## ⚠️ Buenas Prácticas y Errores Habituales para el Alumnado
- **Concatenación de Strings en SQL**: **NUNCA** hacer `"WHERE id = " + id`. Usar siempre `PreparedStatement` con parámetros `?` para evitar ataques de Inyección SQL y permitir que el motor Oracle reutilice los planes de ejecución en su memoria compartida (*Library Cache*).
- **Fugas de Recursos JDBC**: Cerrar siempre las conexiones, `PreparedStatement` y `ResultSet` usando la sentencia `try-with-resources`. De lo contrario, Oracle agotará su parámetro `OPEN_CURSORS` (error `ORA-01000: maximum open cursors exceeded`).
- **No meter sentencias SQL en la capa de interfaz ni en el DTO**: La interfaz gráfica (Swing/JavaFX) o la API web nunca deben saber qué es un `ResultSet` ni qué tabla existe; sólo manejan DTOs entregados por la capa DAO.
