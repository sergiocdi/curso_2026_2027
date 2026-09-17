---
tipo: concepto
modulo: "Acceso a Datos"
ud: "UD02"
ra_asociados: ["RA2"]
tags: [concepto, java, jdbc, oracle, pools, hikaricp, datasource]
dificultad: avanzada
estado: revisado
---

# 💡 Concepto: Conexiones JDBC y Connection Pooling de Alto Rendimiento con HikariCP

> **Módulo**: [[MOC-Acceso-a-Datos|Acceso a Datos]] | **UD**: [[UD02-Conectores-BBDD-Relacionales|UD02 / UT2]] | **RA**: [[RA02-Conectores-BBDD|RA2]]

---

## 📌 1. El Coste Crítico de las Conexiones Físicas

En aplicaciones empresariales que se conectan contra **Oracle Database**, la invocación de `DriverManager.getConnection(...)` es una de las operaciones más pesadas y lentas del sistema:
1. **Negociación TCP/IP y Handshake**: Establecimiento del socket entre la máquina cliente y el listener de Oracle (puerto 1521).
2. **Autenticación y Cifrado**: Intercambio de credenciales, permisos de esquema y negociación de algoritmos de cifrado de red (Oracle Net Services).
3. **Reserva de Memoria en el Servidor (PGA/SGA)**: Creación de un proceso servidor en Oracle dedicado a esa sesión, asignando memoria privada (*Program Global Area - PGA*).

> En aplicaciones concurrentes o servicios web con miles de peticiones simultáneas, abrir y cerrar conexiones físicas por cada transacción colapsa la memoria de Oracle y satura la CPU del servidor.

---

## 🚀 2. Solución: Connection Pooling (Pool de Conexiones)

Un **Pool de conexiones** es un almacén en memoria que mantiene un conjunto predeterminado de conexiones físicas previamente establecidas y autenticadas con la base de datos:
1. Cuando un hilo de ejecución necesita persistir datos, solicita un canal al pool mediante `dataSource.getConnection()`.
2. El pool entrega instantáneamente una conexión disponible sin coste de negociación de red.
3. Al finalizar, la aplicación ejecuta `connection.close()`. **El método `close()` está interceptado por un proxy del pool**: no destruye la sesión física con Oracle, sino que la devuelve limpia y reciclada al pool para el siguiente hilo.

---

## ⚡ 3. Implementación Estándar de la Industria: HikariCP

**HikariCP** es el connection pool de referencia en el ecosistema Java por su latencia cercana a cero, tamaño compacto y algoritmos de micro-optimización de bytecode.

### Dependencia Maven (`pom.xml`):
```xml
<!-- HikariCP: Pool de conexiones de alto rendimiento -->
<dependency>
    <groupId>com.zaxxer</groupId>
    <artifactId>HikariCP</artifactId>
    <version>5.1.0</version>
</dependency>

<!-- Driver JDBC oficial de Oracle -->
<dependency>
    <groupId>com.oracle.database.jdbc</groupId>
    <artifactId>ojdbc11</artifactId>
    <version>23.3.0.23.09</version>
</dependency>
```

### Clase Proveedora Thread-Safe con HikariCP y Oracle:
```java
package conexion;

import com.zaxxer.hikari.HikariConfig;
import com.zaxxer.hikari.HikariDataSource;
import java.sql.Connection;
import java.sql.SQLException;

public class OracleConnectionPool {

    private static final HikariDataSource dataSource;

    static {
        HikariConfig config = new HikariConfig();

        // 1. Cadena de conexión JDBC Oracle y credenciales
        config.setJdbcUrl("jdbc:oracle:thin:@localhost:1521:xe");
        config.setUsername("c##dam2_user");
        config.setPassword("oraclePass123");
        config.setDriverClassName("oracle.jdbc.OracleDriver");

        // 2. Parámetros de dimensionamiento del pool
        config.setMaximumPoolSize(10);       // Máximo de conexiones concurrentes
        config.setMinimumIdle(2);           // Conexiones mínimas inactivas listas
        config.setIdleTimeout(30000);       // 30 s: tiempo antes de retirar conex inactiva
        config.setConnectionTimeout(15000); // 15 s: espera máxima antes de lanzar excepción
        config.setMaxLifetime(1800000);     // 30 min: renovación periódica de conexión física

        // 3. Optimización de rendimiento para Oracle
        config.addDataSourceProperty("cachePrepStmts", "true");
        config.addDataSourceProperty("prepStmtCacheSize", "250");
        config.addDataSourceProperty("prepStmtCacheSqlLimit", "2048");

        dataSource = new HikariDataSource(config);
    }

    private OracleConnectionPool() {}

    /**
     * Obtiene una conexión prestada del pool HikariCP en microsegundos.
     */
    public static Connection getConnection() throws SQLException {
        return dataSource.getConnection();
    }

    /**
     * Cierra el pool al detener la aplicación.
     */
    public static void shutdown() {
        if (dataSource != null && !dataSource.isClosed()) {
            dataSource.close();
        }
    }
}
```

---

## ⚠️ 4. Errores Críticos y Reglas de Aula

1. **Fuga de Conexiones (*Connection Leak*)**:
   Si un programador olvida invocar `connection.close()` (o no utiliza `try-with-resources`), la conexión nunca regresa al pool. Tras agotar las 10 conexiones (`maximumPoolSize`), la aplicación quedará congelada en `getConnection()` hasta que venza el `connectionTimeout` y lance `SQLTransientConnectionException`.
2. **Uso Exclusivo de `try-with-resources`**:
   ```java
   try (Connection con = OracleConnectionPool.getConnection();
        PreparedStatement ps = con.prepareStatement(sql)) {
       // La conexión se devuelve automáticamente al pool al salir del bloque
       ps.executeUpdate();
   }
   ```
