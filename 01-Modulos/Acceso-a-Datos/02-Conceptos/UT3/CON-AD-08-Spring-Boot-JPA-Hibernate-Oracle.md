---
tipo: concepto
modulo: "Acceso a Datos"
ud: "UD03"
ra_asociados: ["RA3"]
tags: [concepto, java, spring-boot, maven, dependencias, starters, jpa, hibernate, oracle]
dificultad: media
estado: revisado
---

# 💡 Concepto: Fundamentos de Spring Boot, Creación de Proyectos, Gestión de Dependencias (Maven) y Conexión con Oracle

> **Módulo**: [[MOC-Acceso-a-Datos|Acceso a Datos]] | **UD**: [[UD03-Mapeo-Objeto-Relacional-ORM|UD03 / UT3]] | **RA**: [[RA03-Mapeo-Objeto-Relacional|RA3]]

---

## 📌 1. ¿Qué es Spring Framework y por qué surgió Spring Boot?

### La Evolución: Del "Infierno XML" a la Agilidad Total
- **Spring Framework tradicional (2002)**: Nació como una alternativa ligera a los complejos Enterprise JavaBeans (EJB) de Java EE. Introdujo la **Inversión de Control (IoC)** y la **Inyección de Dependencias (DI)**. Sin embargo, configurar un proyecto Spring tradicional requería cientos de líneas de configuración en ficheros XML, configurar manualmente servidores de aplicaciones externos (Tomcat, WildFly) y resolver a mano incompatibilidades de versiones entre librerías.
- **Spring Boot (2014 en adelante)**: Es una evolución opinionada y moderna de Spring construida bajo el principio de **"Convención sobre Configuración" (Convention over Configuration)**:
  1. **Servidor Web Embebido**: El proyecto genera un archivo ejecutable autónomo (`.jar`) que lleva un servidor web (Tomcat) incrustado dentro. Ya no se instalan servidores en el sistema operativo; basta con ejecutar `java -jar mi-app.jar`.
  2. **Starters de Dependencias**: Paquetes preparados que agrupan todas las dependencias necesarias para una tarea concreta sin preocuparse por las versiones individuales.
  3. **Autoconfiguración Inteligente**: Si Spring Boot detecta que en el proyecto está el driver de Oracle y JPA, configura automáticamente la conexión a la base de datos sin necesidad de escribir código repetitivo.

---

## 🚀 2. Creación e Instalación de un Proyecto Paso a Paso

La forma oficial y recomendada por la industria para inicializar un proyecto Spring Boot es mediante **Spring Initializr** (vía web en [start.spring.io](https://start.spring.io) o directamente desde el asistente de IntelliJ IDEA, Eclipse STS o VS Code):

```text
┌────────────────────────────────────────────────────────────────────────┐
│                        SPRING INITIALIZR CONFIG                        │
├────────────────────────────────────────────────────────────────────────┤
│ • Project:          Maven Project                                      │
│ • Language:         Java                                               │
│ • Spring Boot:      3.2.x / 3.3.x (versión estable actual)            │
│ • Group:            es.educastur.dam2                                  │
│ • Artifact:         gestion-pedidos                                    │
│ • Packaging:        Jar                                                │
│ • Java:             17 o 21 (versiones LTS obligatorias)               │
├────────────────────────────────────────────────────────────────────────┤
│ DEPENDENCIAS SELECCIONADAS:                                            │
│  [x] Spring Data JPA                                                   │
│  [x] Oracle Driver                                                     │
│  [x] Spring Web (para controladores REST o MVC)                        │
│  [x] Lombok (para generar getters/setters automáticamente)             │
│  [x] Spring Boot DevTools (reinicio automático en desarrollo)          │
└────────────────────────────────────────────────────────────────────────┘
```

Al pulsar **GENERATE**, se descarga un fichero `.zip` que, al descomprimirse y abrirse en el IDE, presenta la estructura canónica:

```text
mi-proyecto-spring/
├── pom.xml                           ──► Fichero maestro de dependencias Maven
├── src/
│   ├── main/
│   │   ├── java/es/educastur/dam2/   ──► Código fuente Java (Paquetes)
│   │   │   └── GestionPedidosApp.java ──► Clase principal con @SpringBootApplication
│   │   └── resources/
│   │       ├── application.properties ──► Parámetros de BD y entorno
│   │       ├── static/                ──► Archivos web públicos (CSS, JS)
│   │       └── templates/             ──► Plantillas HTML (Thymeleaf)
│   └── test/                         ──► Pruebas unitarias y de integración
```

### La Clase Principal de Arranque
```java
package es.educastur.dam2;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class GestionPedidosApp {
    public static void main(String[] args) {
        // Inicializa el contenedor IoC, escanea componentes y levanta el servidor
        SpringApplication.run(GestionPedidosApp.class, args);
    }
}
```

---

## 📦 3. Cómo Añadir Dependencias en Maven (`pom.xml`) Paso a Paso

El archivo **`pom.xml` (Project Object Model)** es el corazón de Maven. Spring Boot define un proyecto padre (**`spring-boot-starter-parent`**) que gestiona y fija las versiones exactas y compatibles de más de 200 librerías comunes:

```xml
<?xml version="1.0" encoding="UTF-8"?>
<project xmlns="http://maven.apache.org/POM/4.0.0" 
         xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
         xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 https://maven.apache.org/xsd/maven-4.0.0.xsd">
    <modelVersion>4.0.0</modelVersion>
    
    <!-- 1. Padre de Spring Boot: fija versiones para evitar conflictos -->
    <parent>
        <groupId>org.springframework.boot</groupId>
        <artifactId>spring-boot-starter-parent</artifactId>
        <version>3.3.4</version>
        <relativePath/>
    </parent>
    
    <groupId>es.educastur.dam2</groupId>
    <artifactId>gestion-pedidos</artifactId>
    <version>0.0.1-SNAPSHOT</version>
    <name>gestion-pedidos</name>
    <description>Proyecto de persistencia con Spring Boot y Oracle</description>

    <properties>
        <java.version>21</java.version>
    </properties>

    <dependencies>
        <!-- 2. STARTER PARA ACCESO A DATOS (JPA + HIBERNATE + POOL HIKARICP) -->
        <dependency>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-starter-data-jpa</artifactId>
        </dependency>

        <!-- 3. DRIVER OFICIAL JDBC DE ORACLE DATABASE -->
        <!-- No indicamos <version> porque el parent ya conoce la versión segura -->
        <dependency>
            <groupId>com.oracle.database.jdbc</groupId>
            <artifactId>ojdbc11</artifactId>
            <scope>runtime</scope>
        </dependency>

        <!-- 4. STARTER WEB (Controladores REST, Jackson JSON, Servidor Tomcat) -->
        <dependency>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-starter-web</artifactId>
        </dependency>

        <!-- 5. HERRAMIENTAS DE DESARROLLO (Reinicio en caliente al guardar código) -->
        <dependency>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-devtools</artifactId>
            <scope>runtime</scope>
            <optional>true</optional>
        </dependency>

        <!-- 6. LOMBOK (Genera getters, setters, constructores y toString mediante anotaciones) -->
        <dependency>
            <groupId>org.projectlombok</groupId>
            <artifactId>lombok</artifactId>
            <optional>true</optional>
        </dependency>

        <!-- 7. STARTER DE TESTING (JUnit 5, Mockito, AssertJ) -->
        <dependency>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-starter-test</artifactId>
            <scope>test</scope>
        </dependency>
    </dependencies>

    <build>
        <plugins>
            <plugin>
                <groupId>org.springframework.boot</groupId>
                <artifactId>spring-boot-maven-plugin</artifactId>
            </plugin>
        </plugins>
    </build>
</project>
```

> [!TIP]
> **Regla de oro de Maven en Spring Boot**:  
> Al añadir cualquier dependencia gestionada por Spring (como `spring-boot-starter-data-jpa` o el driver `ojdbc11`), **NUNCA escribas la etiqueta `<version>`**. Spring Boot resolverá automáticamente la versión probada y certificada para trabajar sin incompatibilidades.

---

## 🔧 4. Configuración del Entorno en `application.properties`

En `src/main/resources/application.properties` se configuran las credenciales del motor de base de datos Oracle y el comportamiento de Hibernate:

```properties
# ===================================================================
# 1. PARÁMETROS DE CONEXIÓN A ORACLE DATABASE (HIKARICP POOL)
# ===================================================================
# URL JDBC oficial de Oracle (XE = Express Edition, 1521 = puerto por defecto)
spring.datasource.url=jdbc:oracle:thin:@localhost:1521:xe
spring.datasource.username=c##dam2_user
spring.datasource.password=oraclePass123
spring.datasource.driver-class-name=oracle.jdbc.OracleDriver

# Configuración del Pool de Conexiones HikariCP (gestionado por Spring Boot)
spring.datasource.hikari.maximum-pool-size=10
spring.datasource.hikari.minimum-idle=5
spring.datasource.hikari.idle-timeout=300000
spring.datasource.hikari.connection-timeout=20000

# ===================================================================
# 2. CONFIGURACIÓN DEL MOTOR HIBERNATE Y DIALECTO
# ===================================================================
# Indica a Hibernate las funciones y sintaxis específicas de Oracle Database
spring.jpa.database-platform=org.hibernate.dialect.OracleDialect

# ESTRATEGIA DE GESTIÓN DEL ESQUEMA DDL (Tablas en Oracle):
# - 'none': No toca la BD (ideal para producción; las tablas ya existen).
# - 'validate': Comprueba que las clases @Entity coinciden con las tablas reales de Oracle.
# - 'update': Crea tablas nuevas o añade columnas si no existen (ideal en desarrollo).
# - 'create-drop': Borra y recrea todo el esquema en cada reinicio (¡PELIGRO de pérdida de datos!).
spring.jpa.hibernate.ddl-auto=update

# ===================================================================
# 3. LOGGING Y FORMATO DE CONSULTAS SQL EN LA CONSOLA
# ===================================================================
# Muestra por la consola del IDE todas las sentencias SQL reales que Hibernate genera
spring.jpa.show-sql=true
spring.jpa.properties.hibernate.format_sql=true
spring.jpa.properties.hibernate.highlight_sql=true

# Muestra el valor de los parámetros '?' en las sentencias preparadas de Hibernate
logging.level.org.hibernate.orm.jdbc.bind=trace
```

---

## ⚠️ Errores Comunes y Puntos Clave en Taller
- **Error `Driver oracle.jdbc.OracleDriver not found`**: Se produce al olvidar declarar la dependencia `ojdbc11` en el `pom.xml` o no recargar el proyecto Maven en el IDE (clic derecho sobre el proyecto \(\implies\) *Maven \(\implies\) Reload project / Update project*).
- **Error de conexión `ORA-12505` o `ORA-12514`**: La cadena JDBC tiene mal el SID o el Service Name. Comprobar si tu instalación de Oracle se conecta a `:xe` o a `:orcl`.
- **Olvidar que el servidor Tomcat se levanta solo en el puerto 8080**: Si el puerto 8080 está ocupado por Oracle XDB o Tomcat del sistema, cambiarlo en `application.properties` con `server.port=8081`.
