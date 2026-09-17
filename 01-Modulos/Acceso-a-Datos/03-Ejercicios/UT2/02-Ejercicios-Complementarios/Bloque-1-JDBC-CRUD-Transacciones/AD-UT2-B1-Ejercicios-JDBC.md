---
tipo: ejercicios_complementarios
modulo: Acceso-a-Datos
unidad: UT2
bloque: B1
version: alumnado
fecha: 2026-09-17
---

# 📝 Ejercicios Complementarios Bloque 1: JDBC, CRUD y Transacciones ACID
**Módulo**: Acceso a Datos · **Curso**: 2º DAM · **Profesor**: Sergio Capdevila Díez

## 1. Ejercicio 2.1: CLI Interactivo de Inventario con PreparedStatement (45 min)
Desarrolla una aplicación de consola en Java que se conecte a Oracle 23c y permita: (1) Añadir un artículo con nombre, precio y stock devolviendo el ID autogenerado, (2) Listar todos los artículos con formato de tabla ASCII, (3) Actualizar el stock de un producto buscando por ID.

## 2. Ejercicio 2.2: Transacción Bancaria con Savepoints y Auditoría de Fallos (55 min)
Crea una tabla `movimientos_auditoria (id NUMBER PRIMARY KEY, operacion VARCHAR2(100), estado VARCHAR2(20), fecha TIMESTAMP)`. Desarrolla una operación transaccional que intente transferir dinero. Si el saldo no alcanza, la transacción debe hacer rollback a un Savepoint para no mover dinero, pero debe registrar en la tabla de auditoría el intento fallido y confirmarlo.
