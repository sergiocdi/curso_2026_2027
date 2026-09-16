---
tipo: concepto
modulo: "Acceso a Datos"
ud: "UD06"
ra_asociados: ["RA6"]
tags: [concepto, javabean, jar, reutilizacion, componentes]
dificultad: basica
estado: revisado
---

# 💡 Concepto: Componentes Software Reutilizables (JavaBeans y Empaquetado JAR)

> **Módulo**: [[MOC-Acceso-a-Datos|Acceso a Datos]] | **UD**: [[UD06-Componentes-de-Acceso-a-Datos|UD06 / UT6]] | **RA**: [[RA06-Componentes-Visuales|RA6]]

---

## 📌 1. ¿Qué es un Componente Software y un JavaBean?
Un **componente software** es un módulo de código independiente, autocontenido y reutilizable que puede integrarse en distintas aplicaciones sin necesidad de recompilarlo ni conocer su implementación interna (*caja negra*).

En el ecosistema Java, el estándar más simple y fundamental de componente es el **JavaBean**, que cumple tres reglas esenciales:
1. Posee un **constructor público sin argumentos** (por defecto).
2. Sus atributos son privados y accesibles únicamente mediante métodos **getters** y **setters** estandarizados.
3. Implementa la interfaz `java.io.Serializable` para poder guardar o transmitir su estado.

---

## 💻 2. Ejemplo Sencillo: Componente de Acceso a Configuración

A continuación se muestra un componente sencillo que encapsula la lectura de parámetros de conexión y ofrece un método directo de consulta:

```java
package com.profesergio.componentes;

import java.io.Serializable;

/**
 * Componente JavaBean sencillo para gestión de conexión persistente.
 */
public class ConectorSimpleBean implements Serializable {
    private static final long serialVersionUID = 1L;

    // Propiedades del componente
    private String host;
    private int puerto;
    private String baseDatos;

    // 1. Constructor vacío por defecto
    public ConectorSimpleBean() {
        this.host = "localhost";
        this.puerto = 1521;
        this.baseDatos = "xe";
    }

    // 2. Getters y Setters
    public String getHost() { return host; }
    public void setHost(String host) { this.host = host; }

    public int getPuerto() { return puerto; }
    public void setPuerto(int puerto) { this.puerto = puerto; }

    public String getBaseDatos() { return baseDatos; }
    public void setBaseDatos(String baseDatos) { this.baseDatos = baseDatos; }

    // 3. Método funcional del componente
    public String obtenerUrlConexion() {
        return "jdbc:oracle:thin:@" + host + ":" + puerto + ":" + baseDatos;
    }
}
```

---

## 📦 3. Cómo Empaquetar y Reutilizar el Componente en 2 Pasos

### Paso 1: Generar el archivo `.jar`
Desde el terminal del proyecto donde se programó el componente:
```bash
# Con Maven:
mvn clean package

# O directamente con la herramienta jar del JDK:
jar cvf conector-simple.jar -C bin/ .
```
Esto genera el archivo comprimido `conector-simple.jar`.

### Paso 2: Usar el componente desde otra aplicación cliente
En cualquier otra aplicación Java independiente:
1. Se añade `conector-simple.jar` a las librerías del proyecto (*Classpath* o como dependencia Maven local).
2. Se instancia y se usa como cualquier clase propia:

```java
import com.profesergio.componentes.ConectorSimpleBean;

public class AppCliente {
    public static void main(String[] args) {
        // Instanciación directa del componente externo
        ConectorSimpleBean conector = new ConectorSimpleBean();
        conector.setHost("192.168.1.50");
        
        System.out.println("URL calculada por el componente: " + conector.obtenerUrlConexion());
    }
}
```

---

## ⚠️ Buenas Prácticas Básicas
- **No acoplar a la vista**: Un componente de acceso a datos jamás debe incluir sentencias `System.out.println` directas ni interfaces gráficas; debe limitarse a recibir datos, procesar y retornar resultados o lanzar excepciones controladas.
- **Mantener compatibilidad**: Conservar siempre el constructor vacío y el `serialVersionUID`.
