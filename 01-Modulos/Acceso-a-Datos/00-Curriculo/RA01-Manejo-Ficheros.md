---
tipo: ra
modulo: "Acceso a Datos"
codigo: "RA1"
peso_porcentaje: 15
descripcion: "Desarrolla aplicaciones que gestionan información almacenada en ficheros identificando el campo de aplicación de los mismos y utilizando clases específicas."
---

# RA1: Gestión de Información en Ficheros y Formatos Estructurados

> **Enunciado Oficial**: Desarrolla aplicaciones que gestionan información almacenada en ficheros identificando el campo de aplicación de los mismos y utilizando clases específicas.  
> **Ponderación en el Módulo**: **15%**

---

## 🎯 Criterios de Evaluación Oficiales

| Código | Criterio de Evaluación | Ponderación en RA | Instrumento |
| :---: | :--- | :---: | :--- |
| **CE1.a** | Se han utilizado clases para la gestión de ficheros y directorios (paquete `java.io` y `java.nio`). | 20% | Ejercicio de aula |
| **CE1.b** | Se han utilizado flujos de caracteres y bytes para leer y escribir información en ficheros de texto y binarios. | 25% | Práctica evaluable |
| **CE1.c** | Se han implementado mecanismos de acceso secuencial y aleatorio gestionando punteros de lectura/escritura. | 20% | Práctica evaluable |
| **CE1.d** | Se han serializado y deserializado objetos gestionando versiones (`serialVersionUID`). | 15% | Test conceptual |
| **CE1.e** | Se han procesado documentos XML y JSON utilizando librerías estándar o de terceros. | 20% | Ejercicio práctico |

---

## 📦 Unidades Didácticas Asociadas
- [[UD01-Manejo-de-Ficheros]]

---

## 📝 Banco de Preguntas y Ejercicios Vinculados
```dataview
TABLE tipo as "Tipo", subtipo as "Subtipo", dificultad as "Dificultad", file.name as "Ficha"
FROM "01-Modulos/Acceso-a-Datos"
WHERE contains(ra_asociados, "RA1")
```
