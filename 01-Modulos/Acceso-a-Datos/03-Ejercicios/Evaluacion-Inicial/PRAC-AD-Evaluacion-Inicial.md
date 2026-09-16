---
tipo: practica_diagnostica
modulo: "Acceso a Datos"
codigo_oficial: "0486"
ciclo: "DAM"
curso: 2
unidad: "Evaluación Inicial"
ra_asociados: ["RA1", "RA2"]
ce_asociados: ["CE1.a", "CE1.b", "CE1.c", "CE2.a"]
caracter: "Diagnóstica (Formativa, no computable para nota ordinaria)"
tiempo_estimado: "120 - 150 minutos (2 sesiones)"
entorno: "Eclipse IDE / Java SE 21 LTS / Git"
politica_ia: "Prohibido el uso de IA generativa para garantizar un diagnóstico competencial verídico"
---

# 🚀 Práctica de Evaluación Inicial: Diagnóstico de Competencias en Programación Java y Persistencia Básica

> **Centro**: CIFP Avilés · Departamento de Informática y Comunicaciones  
> **Módulo**: [[MOC-Acceso-a-Datos|Acceso a Datos (0486)]] · 2º Curso DAM  
> **Docente**: Sergio Capdevila Díez  
> **Duración**: 120 - 150 minutos · **Carácter**: Diagnóstica (Formativa)  
> **Entorno**: Eclipse IDE / Java SE 21 LTS  

---

## 🎯 1. Objetivos y Alineación Curricular

Esta actividad práctica tiene como finalidad diagnosticar el nivel competencial del alumnado al inicio del curso escolar para calibrar el ritmo de trabajo y detectar necesidades de refuerzo en los pilares fundamentales que sustentan el módulo de **Acceso a Datos**:

- **POO y Estructuras en Memoria**: Modelado robusto de clases, encapsulamiento, colecciones (`List`, `Map`) y flujos declarativos con `Stream API`.
- **Manejo de Excepciones y Recursos**: Uso estricto de `try-with-resources` y captura selectiva de excepciones de E/S.
- **Persistencia Básica en Ficheros**: Entrada/salida con ficheros de texto (CSV) y serialización de objetos en ficheros binarios (`.dat`).
- **Bases de Datos Relacionales**: Creación de esquemas DDL (claves foráneas e integridad referencial) y consultas SQL DML multi-tabla.

### RAs y Criterios Curriculares de Referencia:
- `RA1 (Manejo de Ficheros)`: `CE1.a` (clases de gestión de ficheros), `CE1.b` (flujos de texto), `CE1.c` (serialización y ficheros binarios).
- `RA2 (Acceso a BBDD Relacionales)`: `CE2.a` (sentencias SQL y lógica relacional previa al conector JDBC).

---

## 🏢 2. Escenario del Mundo Real: "LogiTech Express"

Trabajas en el departamento de desarrollo de **LogiTech Express**, una compañía de mensajería y paquetería urgente. La empresa está preparando la migración de su sistema hacia una arquitectura moderna basada en bases de datos relacionales y NoSQL que se implementará a lo largo del módulo de Acceso a Datos.

Antes de acometer la migración a gran escala, la dirección técnica te encarga desarrollar un **prototipo inicial de consola en Java 21** para validar el tratamiento de los datos de clientes y envíos, garantizar la exportación/importación de incidencias en ficheros y verificar el esquema relacional de partida.

---

## 📋 3. Enunciado y Tareas Paso a Paso

### Tarea 1: Modelado POO y Gestión en Memoria (Java 21)
1. **Modelado de Clientes y Envíos**:
   - Crear la clase `Cliente`: `id` (String), `nombre` (String), `telefono` (String), `activo` (boolean).
   - Crear la clase `Envio`: `codigoSeguimiento` (String), `clienteId` (String), `pesoKg` (double), `costeEnvio` (double), `fecha` (LocalDate), `entregado` (boolean).
   - Asegurar encapsulación completa (atributos privados, constructores sobrecargados, métodos *getters/setters*, `toString()` legible y métodos `equals()` / `hashCode()` basados en el identificador único).
2. **Servicio de Gestión con Colecciones y Streams**:
   - Crear la clase `GestorLogistica` que contenga una lista `List<Envio>` y un mapa indexado `Map<String, Cliente>` (donde la clave es el `id` del cliente).
   - Implementar el método `List<Envio> obtenerEnviosPendientes()` que utilice **Java Streams** (`.stream().filter(...).toList()`) para devolver solo los envíos no entregados.
   - Implementar el método `double calcularFacturacionCliente(String clienteId)` que calcule el coste acumulado de todos los envíos realizados por un cliente concreto mediante operaciones de reducción (`.mapToDouble(...).sum()`).

---

### Tarea 2: Manejo de Ficheros de Texto (CSV) y Excepciones Robustas
1. **Exportación a CSV**:
   - Implementar el método `exportarEnviosCSV(String rutaFichero)` que recorra la lista de envíos y escriba los datos en un fichero `envios.csv` con encabezado:
     ```csv
     codigo,clienteId,peso,coste,fecha,entregado
     ENV-001,CLI-10,3.5,12.50,2026-09-15,false
     ENV-002,CLI-20,1.2,6.80,2026-09-15,true
     ```
2. **Importación con Validación de Errores**:
   - Implementar el método `importarEnviosCSV(String rutaFichero)`.
   - Utilizar obligatoriamente la sentencia `try-with-resources` (`BufferedReader` o `Files.newBufferedReader()`).
   - Controlar posibles líneas corruptas (datos incompletos o errores de conversión numérica `NumberFormatException`) descartándolas y mostrando un aviso por consola sin interrumpir la lectura del resto del fichero.

---

### Tarea 3: Serialización Binaria de Objetos
1. **Serialización del Estado**:
   - Marcar la clase `Envio` con la interfaz `Serializable` y declarar un `serialVersionUID` explícito.
   - Implementar el método `guardarCopiaSeguridad(String rutaFichero)` que almacene la colección completa `List<Envio>` en un archivo binario `backup_envios.dat` utilizando `ObjectOutputStream`.
2. **Deserialización y Recuperación**:
   - Implementar el método `List<Envio> restaurarCopiaSeguridad(String rutaFichero)` que recupere la lista de envíos desde el fichero binario utilizando `ObjectInputStream`, capturando `ClassNotFoundException` e `IOException`.

---

### Tarea 4: Diagnóstico de Fundamentos SQL (DDL y DML)
Escribir un script SQL `logitech_schema.sql` con las siguientes sentencias:
1. **Sentencias DDL**:
   - Crear la tabla `CLIENTES` con clave primaria `ID_CLIENTE` (VARCHAR 10) y restricciones de no nulidad.
   - Crear la tabla `ENVIOS` con clave primaria `CODIGO_ENVIO` (VARCHAR 15), clave foránea `ID_CLIENTE` referenciando a `CLIENTES` con borrado en cascada o restricción referencial, y una restricción `CHECK` para asegurar que `PESO_KG > 0`.
2. **Sentencias DML**:
   - Una consulta `SELECT` con `INNER JOIN` que muestre el nombre del cliente, el código de seguimiento y el coste de todos los envíos con importe superior a 10.00 €.
   - Una consulta agregada con `GROUP BY` que calcule el peso medio de paquetería agrupado por cliente.

---

## 💻 4. Entorno de Desarrollo y Política de Inteligencia Artificial

> [!IMPORTANT]
> - **Entorno de Aula**: **Eclipse IDE** (o alternativamente IntelliJ IDEA / VS Code configurados con Maven estándar) y **Java SE 21 LTS**.
> - **Política de Inteligencia Artificial**:
>   Al tratarse de una **prueba de evaluación inicial diagnóstica**, queda **totalmente prohibido el uso de herramientas de IA generativa** (ChatGPT, Copilot, Claude, etc.) y de motores de autocompletado inteligente asistidos por IA. El propósito exclusivo de esta actividad es conocer tu autonomía técnica real para adaptar la docencia a tus necesidades.

---

## 📊 5. Rúbrica Analítica de Evaluación Diagnóstica (Total: 10.0 Puntos)

| Criterio / Indicador | Excelente (100%) | Notable (75%) | Aprobado (50%) | Insuficiente (<50%) | Puntos |
| :--- | :--- | :--- | :--- | :--- | :---: |
| **1. Modelado POO y Colecciones (Java 21)**<br>*(Clases, encapsulation, List, Map y Streams)* | Modelado impecable con getters/setters, `equals/hashCode` correctos, uso fluido de `Stream API` para filtrado y sumatorio. | Clases bien diseñadas, colecciones correctas, streams funcionales aunque con código mejorable. | Clases funcionales con colecciones básicas; operaciones resueltas con bucles clásicos en lugar de streams. | Errores graves en POO, falta de encapsulación o incapacidad para manejar listas/mapas. | **2.5 pts** |
| **2. Ficheros de Texto (CSV) y Excepciones**<br>*(E/S, try-with-resources, validación)* | Uso impecable de `try-with-resources`, parsing robusto de CSV, captura selectiva de `IOException` y `NumberFormatException`. | Fichero CSV generado y leído correctamente; gestión adecuada de recursos con algún detalle menor en excepciones. | Lee y escribe ficheros pero no controla el cierre seguro de recursos o falla ante líneas mal formateadas. | Bloqueo de ficheros por fugas de descriptores, excepciones no controladas o código que no compila. | **2.5 pts** |
| **3. Persistencia Binaria y Serialización**<br>*(Serializable, ObjectStreams)* | Implementación correcta de `Serializable`, `serialVersionUID`, serialización y deserialización sin errores de casting. | Guarda y recupera la lista binaria correctamente; omite el `serialVersionUID` o detalles menores. | Serialización funcional pero con advertencias en la deserialización o sin captura de `ClassNotFoundException`. | Incapacidad de serializar objetos, errores de ejecución o no uso de streams de objetos. | **2.0 pts** |
| **4. Fundamentos SQL Relacionales**<br>*(DDL, FK, JOIN y GROUP BY)* | Script SQL perfecto con PK, FK, restricciones `CHECK`, `JOIN` correcto y agregación `GROUP BY` precisa. | DDL funcional con relaciones correctas; consultas SQL bien construidas con errores menores de sintaxis. | DDL básico funcional; JOIN operativo pero con dificultades en la cláusula `GROUP BY`. | Errores en definición de claves primarias/foráneas o incapacidad para enlazar tablas en SQL. | **2.0 pts** |
| **5. Buenas Prácticas y Entorno**<br>*(Eclipse/Maven, Clean Code, Git)* | Código limpio, nombres descriptivos, paquetes organizados (`model`, `service`, `app`), proyecto Maven estándar. | Estructura ordenada, código legible y bien tabulado. | Código funcional pero desorganizado en un único paquete o sin estructura estándar. | Código ilegible, sin indentación o errores de compilación en el entorno. | **1.0 pt** |

---

## 📦 6. Instrucciones de Entrega
1. Crear un proyecto Java en **Eclipse IDE** (nombrado `EvaluacionInicial-NombreApellido`).
2. Organizar el código en paquetes:
   - `es.cifpaviles.logitech.model` (Clases `Cliente`, `Envio`)
   - `es.cifpaviles.logitech.service` (Clase `GestorLogistica`)
   - `es.cifpaviles.logitech.app` (Clase ejecutable `MainApp` con menú o pruebas)
3. Incluir el archivo SQL `logitech_schema.sql` en la raíz del proyecto.
4. Exportar el proyecto comprimido en `.zip` o subirlo al repositorio GitHub indicado por el docente en Moodle Educastur.
