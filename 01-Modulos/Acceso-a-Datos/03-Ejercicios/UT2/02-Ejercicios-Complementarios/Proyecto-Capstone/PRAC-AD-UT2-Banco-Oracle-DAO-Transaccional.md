---
tipo: ejercicio
modulo: "Acceso a Datos"
ud: "UD02"
ra_asociados: ["RA2"]
ce_asociados: ["CE2.a", "CE2.b", "CE2.c", "CE2.d", "CE2.e"]
tipo_actividad: practica_afianzamiento
dificultad: media
tiempo_estimado_min: 180
rubrica: "[[Rubrica-Practicas-Programacion]]"
---

# 🚀 Práctica de Afianzamiento UT2: Sistema Bancario Seguro con Oracle Database, DAO y Transacciones

> **Módulo**: [[MOC-Acceso-a-Datos|Acceso a Datos]] | **UD**: [[UD02-Conectores-BBDD-Relacionales|UD02 / UT2]] | **RAs**: `RA2 (CE2.a al CE2.e)` | **Tiempo**: `180 min (3 sesiones)` | **Carácter**: `Formativo (No evaluable numéricamente - Afianzamiento previo a examen)`

---

## 🎯 Contexto del Proyecto

Una entidad financiera requiere un backend seguro en Java para gestionar cuentas corrientes y movimientos bancarios sobre un motor empresarial **Oracle Database**.

La aplicación debe estructurarse obligatoriamente bajo los patrones de diseño **Singleton**, **Data Access Object (DAO)** y **Data Transfer Object (DTO)**, asegurando atomicidad estricta en las operaciones financieras mediante control manual de transacciones ACID.

---

## 📋 Requerimientos Técnicos y Funcionales

### 1. Modelo de Datos en Oracle
Ejecutar el script DDL inicial creando las tablas con integridad referencial:
```sql
CREATE TABLE CUENTAS (
    IBAN VARCHAR2(24) PRIMARY KEY,
    TITULAR VARCHAR2(100) NOT NULL,
    SALDO NUMBER(12,2) CHECK (SALDO >= 0),
    ESTADO VARCHAR2(20) DEFAULT 'ACTIVA' CHECK (ESTADO IN ('ACTIVA', 'BLOQUEADA'))
);

CREATE TABLE MOVIMIENTOS (
    ID NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    IBAN_ORIGEN VARCHAR2(24) REFERENCES CUENTAS(IBAN),
    IBAN_DESTINO VARCHAR2(24) REFERENCES CUENTAS(IBAN),
    CANTIDAD NUMBER(10,2) NOT NULL,
    TIPO VARCHAR2(20) CHECK (TIPO IN ('TRANSFERENCIA', 'INGRESO', 'RETIRADA')),
    FECHA_HORA TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
```

### 2. Arquitectura del Backend Java
- **Capa de Conexión**: Clase `OracleConnectionPool` implementada como **Singleton** utilizando `HikariCP` o un gestor centralizado de conexiones con el driver JDBC Thin.
- **Capa DTO**: Records o clases inmutables `CuentaDTO` y `MovimientoDTO`.
- **Capa DAO**:
  - `CuentaDAO` con métodos para buscar por IBAN, actualizar saldo y bloquear cuenta.
  - `MovimientoDAO` para registrar auditorías de operaciones.
- **Capa de Negocio / Servicio Transaccional (`TransferenciaService`)**:
  - Operación `realizarTransferencia(String origen, String destino, double cantidad)`:
    1. Validar que ambas cuentas existan y estén en estado `ACTIVA`.
    2. Comprobar que la cuenta de origen disponga de saldo suficiente.
    3. Iniciar transacción: `con.setAutoCommit(false)`.
    4. Restar saldo en origen (`UPDATE CUENTAS SET SALDO = SALDO - ? ...`).
    5. Sumar saldo en destino (`UPDATE CUENTAS SET SALDO = SALDO + ? ...`).
    6. Insertar registro en `MOVIMIENTOS`.
    7. Si todo es correcto, ejecutar `con.commit()`.
    8. En caso de cualquier excepción (`SQLException` o regla de negocio violada), ejecutar `con.rollback()` garantizando que ninguna cuenta sufra variación.

---

## 🛠️ Requisitos de Calidad
- **Prevención de Inyección SQL**: 100% de consultas construidas con `PreparedStatement`.
- **Gestión de Recursos**: Todo recurso JDBC (`Connection`, `PreparedStatement`, `ResultSet`) liberado automáticamente con `try-with-resources`.
- **Códigos de Error Oracle**: Detección y tratamiento de errores típicos de Oracle (p. ej. `ORA-02290` check constraint violation, `ORA-00001` unique constraint).

---

## 📊 Guía de Autoevaluación y Rúbrica Formativa de Competencias (RA2)
> Esta rúbrica permite al alumno comprobar su nivel de dominio técnico antes de la prueba escrita/práctica de evaluación.

| Indicador de Dominio Técnico | Nivel Esperado para el Examen |
| :--- | :--- |
| **CE2.a / CE2.b: Conexión y Conector Oracle** | Conexión perfecta mediante driver JDBC Thin, configuración desacoplada y Singleton bien aplicado. |
| **CE2.c: Patrones DAO y DTO** | Arquitectura desacoplada, interfaces limpias, ausencia total de SQL fuera de la capa DAO. |
| **CE2.d: Control Transaccional ACID** | `commit` y `rollback` impecables; prueba de simulación de fallo donde el saldo nunca queda inconsistente. |
| **CE2.e: Manejo de Excepciones y Seguridad** | Parametrización estricta contra SQLi, captura de códigos `ORA-XXXXX` y cierre garantizado de recursos. |
