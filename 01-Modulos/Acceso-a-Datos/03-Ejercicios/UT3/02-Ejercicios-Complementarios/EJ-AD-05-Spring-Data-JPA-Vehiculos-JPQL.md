---
tipo: ejercicio
modulo: "Acceso a Datos"
ud: "UD03"
ra_asociados: ["RA3"]
ce_asociados: ["CE3.a", "CE3.b", "CE3.c"]
tipo_actividad: reto
dificultad: media
tiempo_estimado_min: 90
rubrica: "[[Rubrica-Practicas-Programacion]]"
---

# 💻 Ejercicio Guiado: Repositorio Spring Data JPA con Consultas JPQL en Oracle

> **Módulo**: [[MOC-Acceso-a-Datos|Acceso a Datos]] | **UD**: [[UD03-Mapeo-Objeto-Relacional-ORM|UD03 / UT3]] | **RAs**: `RA3 (CE3.a, CE3.b, CE3.c)` | **Tiempo**: `90 min`

---

## 📋 Enunciado

Desarrollar una aplicación de consola con **Spring Boot**, **Spring Data JPA** y **Oracle Database** para gestionar una flota de vehículos de empresa:

1. **Modelado de la Entidad `Vehiculo`**:
   - Atributos: `id` (autogenerado con secuencia Oracle), `matricula` (`unique`), `marca`, `modelo`, `kilometros` y `estado` (enum: `DISPONIBLE`, `EN_TALLER`, `BAJA`).
2. **Definición del Repositorio `VehiculoRepository`**:
   - Método derivado para buscar por matrícula: `Optional<Vehiculo> findByMatricula(String matricula)`.
   - Método derivado para filtrar por estado: `List<Vehiculo> findByEstado(EstadoVehiculo estado)`.
   - Consulta **JPQL** parametrizada:
     - Obtener los vehículos con kilometraje superior a un umbral ordenados descendentemente por kilómetros:
       `@Query("SELECT v FROM Vehiculo v WHERE v.kilometros >= :km ORDER BY v.kilometros DESC")`.
   - Consulta **SQL Nativa**:
     - Obtener el kilometraje medio de los vehículos en estado `DISPONIBLE`.
3. **Servicio y Ejecutable `CommandLineRunner`**:
   - Cargar 4 vehículos de prueba en Oracle.
   - Probar y mostrar por consola el resultado de cada una de las consultas anteriores.

---

## 🛠️ Requisitos Técnicos
- Configurar correctamente `application.properties` con la cadena JDBC de Oracle y `spring.jpa.hibernate.ddl-auto=update`.
- Evitar concatenaciones en `@Query`: usar parámetros con nombre (`@Param`).
