---
tipo: hoja_ejercicios
modulo: "Acceso a Datos"
ud: "UD01"
bloque: "Bloque 1 - Ficheros de Texto Plano y Java NIO.2"
ra_asociados: ["RA1"]
ce_asociados: ["CE1.a", "CE1.b"]
dificultad: progresiva
destinatario: alumnado
---

# 📑 Hoja de Ejercicios Complementarios: Ficheros de Texto Plano y Java NIO.2

> **Módulo**: [[MOC-Acceso-a-Datos|Acceso a Datos]] | **Ciclo**: DAM2 | **Unidad**: [[UD01-Manejo-de-Ficheros|UT1]]  
> **Bloque 1**: Ficheros de Texto Plano, Buffers, Charsets y API Moderna Java NIO.2  
> **Solucionario**: [[AD-UT1-B1-Soluciones-Texto-NIO2|Ver Solucionario y Guía Docente (Profesor)]]

---

## 🎯 Objetivos de Aprendizaje
Esta batería de ejercicios de consolidación y ampliación permite verificar y afianzar las siguientes competencias técnicas:
1. Dominio de la jerarquía de flujos de caracteres de `java.io` (`Reader`, `Writer`, `BufferedReader`, `BufferedWriter`, `PrintWriter`).
2. Gestión estricta de codificaciones de caracteres (`StandardCharsets`) evitando pérdida de datos o *Mojibake*.
3. Manejo robusto de recursos con `try-with-resources` y captura selectiva de excepciones (`NoSuchFileException`, `IOException`).
4. Procesamiento reactivo y declarativo de grandes volúmenes de texto con **Java NIO.2** (`Path`, `Files.lines()`, `Streams`).

---

## 📝 Ejercicio 1 (Nivel Básico): Validador y Normalizador de CSV de Empleados (`ValidadorCSV.java`)

### Contexto Empresarial:
El departamento de Recursos Humanos recibe periódicamente un archivo CSV exportado desde una aplicación externa antigua (`empleados_raw.csv`) con codificación `ISO-8859-1`. Dicho archivo contiene filas con campos incompletos, espacios sobrantes y caracteres acentuados.

### Enunciado:
Desarrolla un programa en Java que procese `datos/empleados_raw.csv` y genere dos archivos resultantes:
1. `datos/empleados_limpios.csv` (codificado en `UTF-8`): contendrá únicamente los registros válidos.
2. `datos/empleados_errores.log`: registrará las líneas descartadas indicando el número de fila y la causa técnica del rechazo.

### Datos de Prueba (`datos/empleados_raw.csv`):
```text
DNI;NOMBRE;DEPARTAMENTO;SALARIO;FECHA_ALTA
12345678A;  García Pérez, María  ;Administración;2450.50;2024-01-15
87654321B;Muñoz Cañete, José;Diseño & Marketing;invalid_salary;2023-11-20
23456789C;Álvarez Díaz, Lucía;I+D;3100.00
;López Vega, Ana;Ventas;1900.00;2024-03-01
34567890D;Núñez Rivas, Carlos;Logística y Almacén;2100.75;2022-06-10
```

### Requerimientos Técnicos:
- Leer con `Files.newBufferedReader(path, StandardCharsets.ISO_8859_1)`.
- Validar cada fila:
  - Debe contener exactamente 5 campos separados por `;`.
  - El DNI no puede estar vacío (`!dni.isBlank()`).
  - El salario debe ser un número decimal positivo válido (`Double.parseDouble(salario) > 0`).
- Limpiar los espacios superfluos en los nombres con `trim()`.
- Escribir los válidos en `UTF-8` con `BufferedWriter`.
- En el archivo de log, registrar las anomalías con el formato: `[LÍNEA X] Error: <Causa> -> Contenido: <Texto Original>`.

---

## 📝 Ejercicio 2 (Nivel Intermedio): Generador de Informes de Ventas con `PrintWriter` (`GeneradorInforme.java`)

### Contexto Empresarial:
La dirección comercial necesita un generador automático de informes diarios de liquidación de tiendas. El programa debe leer un fichero de transacciones de texto y generar un documento de informe tabulado (`informe_ventas.txt`) con un diseño estético riguroso y alineación de columnas.

### Enunciado:
A partir de un archivo `datos/ventas_diarias.txt` con el formato `ID_TIENDA|CIUDAD|IMPORTE_NETO|UNIDADES_VENDIDAS`, genera un informe con cabecera institucional, columnas calculadas e importes monetarios alineados a la derecha.

### Datos de Prueba (`datos/ventas_diarias.txt`):
```text
T01|Avilés Centro|14520.80|142
T02|Gijón Puerto|23100.50|215
T03|Oviedo Catedral|18940.25|180
T04|Llanes Costa|8450.00|94
```

### Requerimientos Técnicos:
- Utilizar `PrintWriter` envolviendo `BufferedWriter` y `FileWriter` con codificación `UTF-8`.
- Aplicar máscaras de formateo `printf`:
  - ID y Ciudad alineados a la izquierda (`%-6s`, `%-18s`).
  - Importe Neto y Ticket Medio (`Importe / Unidades`) alineados a la derecha con 2 decimales y símbolo del euro (`%12.2f €`).
  - Unidades vendidas alineadas a la derecha (`%8d`).
- Calcular e imprimir al pie del informe:
  - Facturación Total Global.
  - Media de ventas por tienda.
  - Tienda líder (con mayor facturación).

---

## 📝 Ejercicio 3 (Nivel Avanzado): Analizador de Tráfico Web con NIO.2 y Java Streams (`LogAnalyzerNIO.java`)

### Contexto Empresarial:
Un servidor web Apache expone diariamente un archivo de acceso de gran volumen (`access.log`) con miles de peticiones HTTP. Se requiere una herramienta forense de consola de alto rendimiento capaz de analizar el tráfico en *streaming* sin cargar todo el archivo en la memoria RAM.

### Enunciado:
Construye una utilidad que procese `datos/access.log` empleando exclusivamente **Java NIO.2** y la API de **Streams** (`Files.lines()`) para responder a las siguientes consultas de auditoría:

### Formato de Log:
```text
192.168.1.105 - - [17/Sep/2026:10:14:22] "GET /api/productos HTTP/1.1" 200 4520
10.0.0.15 - - [17/Sep/2026:10:14:23] "POST /login HTTP/1.1" 401 512
172.16.0.4 - - [17/Sep/2026:10:14:25] "GET /admin/db.php HTTP/1.1" 404 1204
192.168.1.105 - - [17/Sep/2026:10:14:30] "GET /imagenes/logo.png HTTP/1.1" 200 18450
10.0.0.88 - - [17/Sep/2026:10:14:35] "POST /checkout HTTP/1.1" 500 850
```

### Consultas Requeridas:
1. **Conteo total de peticiones**: Contar el número total de accesos registrados.
2. **Filtrado de peticiones erróneas (HTTP 4xx y 5xx)**: Volcar a `datos/peticiones_sospechosas.txt` todas las líneas cuyo código de respuesta HTTP sea $\ge 400$.
3. **Análisis de volumen transferido**: Calcular la suma total de bytes transmitidos por las peticiones con código `200` (OK).
4. **Top IPs más activas**: Identificar y mostrar por consola las 3 direcciones IP que más peticiones han realizado.

### Requerimientos Técnicos:
- `Files.lines(path, StandardCharsets.UTF_8)` dentro de un bloque `try-with-resources`.
- Prohibido acumular todas las líneas en una `List<String>` intermedia.
- Empleo de operaciones declarativas (`filter`, `map`, `mapToLong`, `collect(groupingBy...)`).
