---
tipo: concepto
modulo: "Acceso a Datos"
ud: "UD02"
ra_asociados: ["RA2"]
tags: [concepto, java, jdbc, pools, hikaricp]
dificultad: avanzada
estado: revisado
---

# 💡 Concepto: Conexiones JDBC y Connection Pooling con HikariCP

> **Módulo**: [[MOC-Acceso-a-Datos|Acceso a Datos]] | **UD**: [[UD02-Conectores-BBDD-Relacionales|UD02]] | **RA**: [[RA02-Conectores-BBDD|RA2]]

---

## 📌 1. El Coste de las Conexiones Físicas
Abrir y cerrar una conexión TCP/IP contra un motor de base de datos (PostgreSQL, MySQL, Oracle) implica:
1. Negociación de tres vías TCP (*handshake*).
2. Autenticación, permisos y encriptación TLS/SSL.
3. Creación de estructuras en memoria en el servidor para esa sesión.

En aplicaciones web o concurrentes con cientos de usuarios, crear conexiones por petición colapsa el servidor.

---

## 🚀 2. Solución: Connection Pool (HikariCP)
Un **Pool de conexiones** mantiene un conjunto de conexiones abiertas y listas en segundo plano. Cuando la aplicación necesita hacer una consulta:
1. Pide una conexión al pool (`getConnection()`).
2. Realiza la operación.
3. Al llamar a `close()`, la conexión no se destruye: se devuelve al pool para el siguiente hilo.

```java
import com.zaxxer.hikari.HikariConfig;
import com.zaxxer.hikari.HikariDataSource;
import java.sql.Connection;
import java.sql.SQLException;

public class DataSourceProvider {
    private static HikariDataSource dataSource;

    static {
        HikariConfig config = new HikariConfig();
        config.setJdbcUrl("jdbc:postgresql://localhost:5432/dam2_db");
        config.setUsername("profesor");
        config.setPassword("secreta123");
        config.setMaximumPoolSize(10);
        config.setMinimumIdle(2);
        config.setIdleTimeout(30000);
        config.setConnectionTimeout(20000);
        dataSource = new HikariDataSource(config);
    }

    public static Connection getConnection() throws SQLException {
        return dataSource.getConnection();
    }
}
```
