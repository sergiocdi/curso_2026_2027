---
tipo: concepto
modulo: "Acceso a Datos"
ud: "UD05"
ra_asociados: ["RA5"]
tags: [concepto, java, mongodb, driver, consultas, filtros]
dificultad: media
estado: revisado
---

# 💡 Concepto: Conexión y Consultas a MongoDB desde Java con el Driver Oficial

> **Módulo**: [[MOC-Acceso-a-Datos|Acceso a Datos]] | **UD**: [[UD05-Bases-de-Datos-NoSQL-MongoDB|UD05 / UT5]] | **RA**: [[RA05-Bases-Datos-NoSQL|RA5]]

---

## 📌 1. Conexión con el Driver Síncrono (`MongoClients`)

Para interactuar con MongoDB desde una aplicación Java estándar se utiliza el driver oficial síncrono (`org.mongodb:mongodb-driver-sync`):

```java
import com.mongodb.client.MongoClient;
import com.mongodb.client.MongoClients;
import com.mongodb.client.MongoDatabase;
import com.mongodb.client.MongoCollection;
import org.bson.Document;

public class ConexionMongo {
    public static void main(String[] args) {
        String uri = "mongodb://localhost:27017";
        
        // Uso con try-with-resources para cerrar el pool de conexiones
        try (MongoClient mongoClient = MongoClients.create(uri)) {
            MongoDatabase database = mongoClient.getDatabase("gestion_alumnos");
            MongoCollection<Document> collection = database.getCollection("estudiantes");
            
            System.out.println("Conexión establecida con éxito. Documentos en colección: " + collection.countDocuments());
        }
    }
}
```

---

## 🔍 2. Consultas y Filtros Declarativos (`Filters` y `Sorts`)

El paquete `com.mongodb.client.model.Filters` ofrece una API tipada para construir consultas legibles:

```java
import static com.mongodb.client.model.Filters.*;
import static com.mongodb.client.model.Sorts.*;
import static com.mongodb.client.model.Updates.*;
import com.mongodb.client.FindIterable;
import org.bson.Document;

public class OperacionesMongo {
    public static void consultarEstudiantes(MongoCollection<Document> col) {
        // Buscar estudiantes con calificacion >= 5.0 ordenados por nombre ascendente
        FindIterable<Document> resultados = col.find(gte("calificacion", 5.0))
                                               .sort(ascending("nombre"))
                                               .limit(10);

        for (Document doc : resultados) {
            String nombre = doc.getString("nombre");
            Double nota = doc.getDouble("calificacion");
            System.out.println("Alumno: " + nombre + " | Nota: " + nota);
        }
    }

    public static void actualizarNota(MongoCollection<Document> col, String dni, double nuevaNota) {
        // Modificación atómica
        col.updateOne(eq("dni", dni), set("calificacion", nuevaNota));
    }
}
```

---

## ⚠️ Buenas Prácticas
- Mantener una única instancia de `MongoClient` para toda la aplicación (es thread-safe y administra internamente su propio pool de conexiones socket).
- No instanciar un nuevo `MongoClient` por cada consulta.
