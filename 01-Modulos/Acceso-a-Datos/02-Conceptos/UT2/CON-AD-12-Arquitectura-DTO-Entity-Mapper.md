---
tipo: concepto
modulo: "Acceso a Datos"
ud: "UD02"
ra_asociados: ["RA2"]
tags: [concepto, java, patrones, arquitectura, dto, entity, mapper, converter, desacoplamiento]
dificultad: media
estado: revisado
---

# 💡 Concepto: El Patrón Arquitectónico DTO (Data Transfer Object), Entidades y Converters

> **Módulo**: [[MOC-Acceso-a-Datos|Acceso a Datos]] | **UD**: [[UD02-Conectores-BBDD-Relacionales|UD02 / UT2]] | **RA**: [[RA02-Conectores-BBDD|RA2]]  
> **Patrones Relacionados**: [[CON-AD-07-Patrones-Persistencia-DAO-DTO-Singleton|CON-AD-07: Singleton, DAO y DTO]]

---

## 📌 1. Concepto Fundamental y la Dualidad: Entidad vs DTO

En el desarrollo de software profesional con persistencia de datos (JDBC, Hibernate, Spring Data, APIs REST), uno de los errores más comunes cometidos por desarrolladores noveles es **utilizar las mismas clases de la base de datos para responder a las peticiones de los clientes o pantallas**.

Para estructurar aplicaciones robustas, debemos distinguir con total claridad dos conceptos completamente diferentes:

```text
┌────────────────────────────────────────────────────────┐       ┌────────────────────────────────────────────────────────┐
│                   ENTIDAD (ENTITY)                     │       │              DTO (DATA TRANSFER OBJECT)                │
├────────────────────────────────────────────────────────┤       ├────────────────────────────────────────────────────────┤
│ • Espejo de la Base de Datos (Tabla/Colección).        │       │ • Objeto plano diseñado para viajar por la red.        │
│ • Tiene un atributo por cada columna de la tabla.      │  ──►  │ • Modela la respuesta o petición exacta que la UI pide.│
│ • Contiene anotaciones de persistencia (@Id, @Column). │       │ • Agrega campos de múltiples tablas si hace falta.     │
│ • Gestiona relaciones relacionales complejas (FKs).    │       │ • Desacoplado al 100% de la base de datos física.      │
│ • Vive dentro de la Capa de Datos / Persistencia.      │       │ • Vive en las fronteras entre capas (Servicio - Vista).│
└────────────────────────────────────────────────────────┘       └────────────────────────────────────────────────────────┘
```

> **Definición Formal**:  
> El patrón **Data Transfer Object (DTO)** es un patrón arquitectónico cuyo propósito es crear objetos simples (POJOs o *Java Records*) sin lógica de negocio, diseñados para agrupar y transferir datos entre subsistemas o a través de la red en **una única invocación**, desacoplando la representación pública de la estructura interna del almacenamiento.

---

## 💥 2. La Problemática Real: ¿Por qué NO devolver Entidades?

Imaginemos un sistema con dos tablas en base de datos: `CUSTOMERS` (Clientes) y `ADDRESSES` (Direcciones de entrega), con una relación de uno a uno (\(1:1\)):

```text
    TABLA: CUSTOMERS                              TABLA: ADDRESSES
┌─────────────────────────┐               ┌───────────────────────────────┐
│ ID (PK)                 │               │ ID (PK)                       │
│ DNI                     │               │ CUSTOMER_ID (FK -> CUSTOMERS) │
│ NOMBRE                  │               │ CALLE                         │
│ EMAIL                   │               │ CIUDAD                        │
│ PASSWORD_HASH           │               │ CODIGO_POSTAL                 │
│ SALDO_CUENTA            │               └───────────────────────────────┘
│ INTENTOS_FALLIDOS       │
└─────────────────────────┘
```

Fíjate en el diseño de la base de datos: la tabla `ADDRESSES` contiene la clave foránea (`CUSTOMER_ID`) que apunta al cliente. Sin embargo, en la tabla `CUSTOMERS` **no existe ninguna columna que apunte a la dirección**.

Si intentamos devolver datos al cliente utilizando directamente las Entidades, nos encontramos con tres problemas graves:

### Problema 1: Conversaciones Excesivas en Red (*Chatty Calls / Under-fetching*)
Para que la pantalla del usuario pinte el Cliente junto con su Dirección, el cliente se ve obligado a realizar **dos llamadas sucesivas por la red**:
1. Petición 1: Obtener el Cliente `GET /api/customers/10` \(\implies\) Recibe los datos personales.
2. Petición 2: Obtener la Dirección `GET /api/addresses/customer/10` \(\implies\) Recibe la calle y ciudad.

En entornos móviles o web, duplicar las peticiones HTTP multiplica la latencia de red, el consumo de batería y el retardo percibido por el usuario.

### Problema 2: Contaminación del Modelo de Dominio
Para evitar las dos peticiones, muchos programadores caen en la tentación de modificar la clase `CustomerEntity` añadiéndole un atributo:
```java
// ¡MALA PRÁCTICA!: Contaminación de la Entidad
public class CustomerEntity {
    private Long id;
    private String nombre;
    private String email;
    // ...
    private AddressEntity address; // <- Este campo NO existe en la tabla CUSTOMERS de la BD
}
```
Esto "ensucia" la entidad de persistencia, genera conflictos con los mapeadores automáticos y acopla la base de datos a las necesidades temporales de una pantalla concreta.

### Problema 3: Brecha de Seguridad y Tráfico Innecesario (*Over-fetching*)
La tabla `CUSTOMERS` almacena campos como `PASSWORD_HASH`, `INTENTOS_FALLIDOS` o `SALDO_CUENTA`.  
Si serializamos la entidad `Customer` completa a formato JSON para enviarla al navegador, **el hash de la contraseña y los datos confidenciales viajarán por la red**. Aunque no se muestren en la interfaz HTML, cualquier usuario que abra las herramientas de desarrollador (*F12 -> Red / Network*) podrá ver el JSON con el hash y los datos bancarios.

---

## 🛡️ 3. La Solución Arquitectónica: Implementando el Patrón DTO

El patrón DTO propone crear una clase diseñada a medida para la respuesta que necesita la vista o el cliente externo:

```text
                                  ┌─────────────────────────────────────────┐
                                  │               CustomerDTO               │
                                  ├─────────────────────────────────────────┤
Tablas en Base de Datos:          │ • id                                    │
  CUSTOMERS (Campos públicos) ──► │ • nombreCompleto (nombre + apellidos)   │
                                  │ • email                                 │
  ADDRESSES (Datos de envío)  ──► │ • direccionCompleta (calle, ciudad, CP) │
                                  └─────────────────────────────────────────┘
                                                       │
                                              Viaja en 1 sola llamada
                                              Seguro (Sin contraseñas)
                                                       ▼
                                                [ CLIENTE / UI ]
```

### Implementación con Java Records (Recomendado en Java 17 / 21+)
Los `record` de Java son la estructura perfecta para los DTOs: son **inmutables por diseño**, generan automáticamente constructor, *getters* de acceso, `equals()`, `hashCode()` y `toString()`, y garantizan que nadie modifique los datos en tránsito:

```java
package es.educastur.dam2.dto;

public record CustomerDTO(
    Long id,
    String nombreCompleto,
    String email,
    String calle,
    String ciudad,
    String codigoPostal
) {}
```
> [!NOTE]
> Observa que `CustomerDTO` ha resuelto todos los problemas de un plumazo:
> 1. Agrupa en un solo objeto los datos de `CUSTOMERS` y `ADDRESSES` (**1 única llamada**).
> 2. Oculta por completo `passwordHash`, `intentosFallidos` y metadatos internos (**Seguridad total**).
> 3. No contamina ninguna tabla ni entidad de la base de datos (**Desacoplamiento limpio**).

---

## 🔄 4. El Patrón Converter / Assembler / Mapper

Una vez que tenemos la `Entity` (en la capa de datos) y el `DTO` (en la capa de transporte), surge la pregunta clave: **¿Dónde y cómo se realiza la transformación entre ambos?**

El patrón **Converter / Assembler** centraliza toda la lógica de conversión en una clase dedicada, evitando duplicar código `set` / `get` por los DAOs, servicios o controladores.

```java
package es.educastur.dam2.mapper;

import es.educastur.dam2.dto.CustomerDTO;
import es.educastur.dam2.model.AddressEntity;
import es.educastur.dam2.model.CustomerEntity;

public class CustomerMapper {

    // Conversión de Entidades de Base de Datos -> DTO para la Vista
    public static CustomerDTO toDTO(CustomerEntity customer, AddressEntity address) {
        if (customer == null) {
            return null;
        }

        return new CustomerDTO(
            customer.getId(),
            customer.getNombre() + " " + customer.getApellidos(),
            customer.getEmail(),
            (address != null) ? address.getCalle() : "Sin dirección asignada",
            (address != null) ? address.getCiudad() : "N/D",
            (address != null) ? address.getCodigoPostal() : "N/D"
        );
    }

    // Conversión inversa: DTO recibido de un formulario -> Entidad para guardar en BD
    public static CustomerEntity toEntity(CustomerDTO dto) {
        if (dto == null) {
            return null;
        }

        CustomerEntity entity = new CustomerEntity();
        entity.setId(dto.id());
        // Descomponemos el nombre si fuera necesario o asignamos valores directos
        entity.setNombre(dto.nombreCompleto());
        entity.setEmail(dto.email());
        // Los campos sensibles se inicializan con valores seguros por defecto
        entity.setIntentosFallidos(0);
        return entity;
    }
}
```

### Composición de Conversores y Listas
Podemos convertir colecciones completas de forma declarativa con la API Streams de Java:
```java
List<CustomerEntity> entidades = customerDAO.findAll();
List<CustomerDTO> dtos = entidades.stream()
    .map(entity -> CustomerMapper.toDTO(entity, addressDAO.findByCustomerId(entity.getId())))
    .toList();
```

---

## 🏗️ 5. Flujo Arquitectónico Completo de una Petición

```text
1. Usuario pulsa "Ver Perfil" en la web
           │
           ▼
2. [ Controlador / API REST ]
   Recibe la petición HTTP y llama al Servicio.
           │
           ▼
3. [ Capa de Servicio (Lógica de Negocio) ]
   Llama al DAO para obtener las entidades de base de datos.
           │
           ▼
4. [ Capa DAO / Persistencia ] ──(SQL)──► [ Base de Datos Oracle ]
   Ejecuta: SELECT * FROM CUSTOMERS...   Retorna tuplas crudas.
   Construye las instancias de CustomerEntity y AddressEntity.
           │
           ▼ (Devuelve Entidades al Servicio)
5. [ Mapper / Assembler ]
   El Servicio invoca: CustomerMapper.toDTO(customerEntity, addressEntity)
           │
           ▼ (Genera CustomerDTO limpio y consolidado)
6. [ Controlador / API REST ]
   Serializa el CustomerDTO a JSON y lo devuelve al navegador.
```

---

## ⚠️ Errores Comunes y Puntos Clave en Examen/Taller
- **El Bucle Infinito de Serialización JSON**: En proyectos que usan JPA/Hibernate, si una entidad `Autor` tiene `@OneToMany List<Libro>` y la entidad `Libro` tiene `@ManyToOne Autor`, intentar retornar la entidad en un controlador REST de Spring provoca que Jackson intente serializar Autor -> Libro -> Autor -> Libro... hasta reventar la memoria con un `StackOverflowError`. **Solución profesional**: Retornar siempre un `LibroDTO` plano sin referencias circulares.
- **Poner lógica de negocio en el DTO**: Un DTO debe ser **completamente anémico** (sólo propiedades de datos, sin algoritmos de cálculo, validaciones complejas de base de datos ni conexiones).
- **Herramientas avanzadas de mapeo**: Aunque en 2º DAM se enseña a construir los Mappers a mano para dominar la lógica, en la industria se utilizan librerías de generación de código en tiempo de compilación como **MapStruct** (`@Mapper`) para evitar escribir código repetitivo.
