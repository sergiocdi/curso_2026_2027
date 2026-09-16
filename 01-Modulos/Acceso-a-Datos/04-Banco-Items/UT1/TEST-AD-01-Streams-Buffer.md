---
tipo: item_evaluacion
subtipo: test
modulo: "Acceso a Datos"
ud: "UD01"
ra_asociados: ["RA1"]
ce_asociados: ["CE1.b"]
dificultad: facil
estado: validada
correcta: "B"
---

# ❓ Test: Eficiencia en lectura de flujos con Buffer

> **Módulo**: Acceso a Datos | **UD**: UD01 | **RA**: RA1 | **CE**: CE1.b | **Dificultad**: Fácil

### Enunciado:
¿Por qué es recomendable envolver un `FileReader` dentro de un `BufferedReader` al leer archivos de texto extensos en Java?

### Opciones:
- [ ] A) Porque `FileReader` solo permite leer archivos binarios y `BufferedReader` los transforma a texto.
- [x] B) Porque `BufferedReader` almacena bloques de caracteres en memoria RAM, reduciendo sustancialmente las costosas operaciones de acceso a disco físico. *(Correcta)*
- [ ] C) Porque `BufferedReader` encripta automáticamente el contenido en memoria para evitar accesos indebidos.
- [ ] D) Porque sin `BufferedReader` el archivo se elimina automáticamente tras finalizar la lectura.

---

### 💡 Justificación:
- **Opción B correcta**: Cada llamada a lectura directa de disco implica interrupciones del SO y latencias de I/O. El buffer reduce el número de operaciones de lectura física cargando trozos grandes en memoria intermedia.
