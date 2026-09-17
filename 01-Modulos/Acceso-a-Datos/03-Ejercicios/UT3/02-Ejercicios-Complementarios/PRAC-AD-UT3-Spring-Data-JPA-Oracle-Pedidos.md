---
tipo: ejercicio
modulo: "Acceso a Datos"
ud: "UD03"
ra_asociados: ["RA3"]
ce_asociados: ["CE3.a", "CE3.b", "CE3.c", "CE3.d", "CE3.e"]
tipo_actividad: practica_afianzamiento
dificultad: media
tiempo_estimado_min: 240
rubrica: "[[Rubrica-Practicas-Programacion]]"
---

# 🚀 Práctica de Afianzamiento UT3: API de Gestión de Pedidos y Facturación con Spring Boot, JPA, Hibernate y Oracle

> **Módulo**: [[MOC-Acceso-a-Datos|Acceso a Datos]] | **UD**: [[UD03-Mapeo-Objeto-Relacional-ORM|UD03 / UT3]] | **RAs**: `RA3 (CE3.a al CE3.e)` | **Tiempo**: `240 min (4 sesiones)` | **Carácter**: `Formativo (No evaluable numéricamente - Afianzamiento previo a examen)`

---

## 🎯 Contexto del Proyecto

Desarrollar la capa de persistencia completa para un sistema de comercio electrónico empresarial utilizando **Spring Boot 3**, **Spring Data JPA**, **Hibernate** y **Oracle Database**.

El sistema debe modelar una jerarquía relacional realista con relaciones bidireccionales, claves foráneas, borrado en cascada y consultas complejas de agregación.

---

## 📋 Requerimientos Funcionales y de Modelado

### 1. Entidades y Mapeos Relacionales
- **`Cliente`**: `id`, `cif_nif` (`unique`), `razonSocial`, `email`, `telefono`. Relación `@OneToMany` bidireccional con `Pedido`.
- **`Pedido`**: `id`, `codigoPedido`, `fechaPedido`, `estado` (`PENDIENTE`, `ENVIADO`, `CANCELADO`), `@ManyToOne` con `Cliente` y `@OneToMany(cascade = CascadeType.ALL, orphanRemoval = true)` con `LineaPedido`.
- **`Producto`**: `id`, `sku`, `descripcion`, `precioUnitario`, `stock`.
- **`LineaPedido`**: `id`, `@ManyToOne` con `Pedido`, `@ManyToOne` con `Producto`, `cantidad`, `precioAplicado`.

### 2. Capa de Repositorios (Spring Data JPA)
- **`ClienteRepository`**:
  - Consulta derivada para buscar clientes por dominio de correo electrónico (`findByEmailEndingWith`).
- **`PedidoRepository`**:
  - Consulta JPQL que recupere un pedido con todas sus líneas y productos asociados en una sola consulta evitando el problema N+1 (`JOIN FETCH`).
  - Consulta nativa en SQL de Oracle para obtener el importe total facturado por cliente en el mes en curso.
- **`ProductoRepository`**:
  - Actualización masiva de precios mediante `@Modifying` y `@Query`: aplicar un porcentaje de descuento a productos con stock superior a cierto límite.

### 3. Servicio de Negocio y Transaccionalidad (`@Transactional`)
- Implementar el método `crearPedido(Long clienteId, List<DetalleItemDTO> items)`:
  - Validar la existencia de cliente y el stock de cada producto solicitado.
  - Decrementar el stock en la entidad `Producto`.
  - Crear y asociar las líneas al pedido calculando el total.
  - La operación debe ser atómica: si cualquier producto no dispone de stock suficiente, se lanza una excepción de negocio y toda la transacción debe revertirse automáticamente (`rollbackFor = Exception.class`).

---

## 🛠️ Requisitos Técnicos
- Generación automática o validación de tablas con secuencias Oracle (`GenerationType.SEQUENCE`).
- Uso de `FetchType.LAZY` en todas las relaciones para optimizar consumo de memoria.
- Cobertura de pruebas de integración con `@DataJpaTest` o un runner de consola que verifique el rollback ante falta de stock.

---

## 📊 Guía de Autoevaluación y Rúbrica Formativa de Competencias (RA3)
> Esta rúbrica permite al alumno comprobar su nivel de dominio técnico antes de la prueba escrita/práctica de evaluación.

| Indicador de Dominio Técnico | Nivel Esperado para el Examen |
| :--- | :--- |
| **CE3.a / CE3.b: Configuración Spring Boot & Oracle** | Configuración sin errores del DataSource de Oracle, secuencias y perfiles de conexión. |
| **CE3.c: Mapeo Relacional y Fetching** | Relaciones 1:N y N:M modeladas limpiamente, `mappedBy` y `JoinColumn` correctos, prevención activa de bucles y problema N+1. |
| **CE3.d: Consultas JPQL y Nativas** | Consultas optimizadas con `JOIN FETCH`, proyecciones y actualización `@Modifying` bien implementada. |
| **CE3.e: Transaccionalidad `@Transactional`** | Atomicidad demostrada en la compra; rollback verificado ante inconsistencias o stock insuficiente. |
