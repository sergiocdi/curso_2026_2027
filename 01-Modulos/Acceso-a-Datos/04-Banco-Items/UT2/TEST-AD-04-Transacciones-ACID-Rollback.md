---
tipo: item_evaluacion
subtipo: test
modulo: "Acceso a Datos"
ud: "UD02"
ra_asociados: ["RA2"]
ce_asociados: ["CE2.d"]
dificultad: dificil
estado: validada
correcta: "D"
---

# ❓ Test: Gestión Transaccional y AutoCommit en JDBC

> **Módulo**: Acceso a Datos | **UD**: UD02 | **RA**: RA2 | **CE**: CE2.d | **Dificultad**: Difícil

### Enunciado:
Para ejecutar varias operaciones de inserción y actualización dentro de una misma transacción atómica en JDBC, ¿cuál es la secuencia metodológica correcta?

### Opciones:
- [ ] A) Llamar a `connection.close()` después de cada instrucción SQL ejecutada.
- [ ] B) Configurar `connection.setAutoCommit(true)` y llamar a `connection.rollback()` al final.
- [ ] C) Usar la sentencia SQL `DROP TRANSACTION` en el primer bloque `catch`.
- [x] D) Invocar `connection.setAutoCommit(false)`, ejecutar las sentencias con `executeUpdate()`, llamar a `connection.commit()` si todo es correcto, o llamar a `connection.rollback()` en el bloque `catch` si se produce una excepción. *(Correcta)*
