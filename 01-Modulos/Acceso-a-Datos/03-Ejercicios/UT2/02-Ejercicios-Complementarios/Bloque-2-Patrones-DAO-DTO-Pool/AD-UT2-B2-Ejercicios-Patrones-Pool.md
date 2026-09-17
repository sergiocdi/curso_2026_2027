---
tipo: ejercicios_complementarios
modulo: Acceso-a-Datos
unidad: UT2
bloque: B2
version: alumnado
fecha: 2026-09-17
---

# 📝 Ejercicios Complementarios Bloque 2: Patrones DAO/DTO y Connection Pools (HikariCP)
**Módulo**: Acceso a Datos · **Curso**: 2º DAM · **Profesor**: Sergio Capdevila Díez

## 1. Ejercicio 2.3: Configuración Avanzada de Pool HikariCP con Detección de Fugas (40 min)
Configura un DataSource HikariCP en Java 21 estableciendo: `maximumPoolSize=5`, `connectionTimeout=10000`, y `leakDetectionThreshold=5000` (5 segundos). Desarrolla una prueba donde se obtiene una conexión y deliberadamente se olvida invocar `conn.close()`. Observa en los logs cómo HikariCP reporta una fuga de conexión indicando la línea exacta del código causante.

## 2. Ejercicio 2.4: Capa de Persistencia Completa DAO/DTO con Transacciones Inyectadas (60 min)
Diseña una capa DAO para la entidad `Cliente (id, nif, nombre, activo)` y `Factura (id, id_cliente, total, fecha)`. Implementa un método de servicio `emitirFactura(ClienteDTO cliente, BigDecimal total)` que en una sola transacción cree el cliente si no existe y registre su primera factura utilizando el DataSource de HikariCP.
