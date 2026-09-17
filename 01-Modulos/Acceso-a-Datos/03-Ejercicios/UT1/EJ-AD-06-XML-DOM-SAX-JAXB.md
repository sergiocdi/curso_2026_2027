---
tipo: ejercicio
modulo: "Acceso a Datos"
ud: "UD01"
ra_asociados: ["RA1"]
ce_asociados: ["CE1.d", "CE1.e"]
tipo_actividad: practica_guiada
dificultad: media-avanzada
tiempo_estimado_min: 90
entregable: proyecto_maven
estado: listo
---

# 💻 Ejercicio: Procesamiento de Catálogos XML con DOM, SAX y JAXB

> **Módulo**: [[MOC-Acceso-a-Datos|Acceso a Datos]] | **UD**: [[UD01-Manejo-de-Ficheros|UD01 / UT1]] | **Conceptos**: [[CON-AD-04-Ficheros-XML-Metodos|Métodos de Procesamiento XML]]

---

## 🎯 Objetivo Pedagógico
En este ejercicio practicarás las tres tecnologías dominantes en el ecosistema Java para el tratamiento de XML:
1. **DOM**: Crear desde cero un catálogo de productos estructurado en memoria y serializarlo a disco con formato legible (*pretty print*).
2. **SAX**: Diseñar un analizador reactivo para calcular estadísticas sobre el catálogo sin cargar el árbol completo en memoria RAM.
3. **JAXB**: Automatizar la persistencia y carga de objetos Java mediante anotaciones declarativas.

---

## 📝 Enunciado de la Actividad

### Reto 1: Generador y Modificador DOM (`CatalogoDOM.java`)
1. Generar mediante `DocumentBuilder` un documento XML `catalogo_tienda.xml` con la siguiente estructura:
```xml
<?xml version="1.0" encoding="UTF-8"?>
<catalogo fecha="2026-09-16">
    <producto id="P01" categoria="Hardware">
        <nombre>Disco SSD NVMe 1TB</nombre>
        <precio>89.95</precio>
        <stock>25</stock>
    </producto>
    <producto id="P02" categoria="Perifericos">
        <nombre>Raton Ergonomico Inalambrico</nombre>
        <precio>34.50</precio>
        <stock>12</stock>
    </producto>
</catalogo>
```
2. Volcar a disco utilizando `TransformerFactory` y `Transformer` con sangría de 4 espacios.
3. Implementar un método `aplicarDescuento(File archivo, double porcentaje)` que abra el fichero con DOM, busque todos los nodos `<precio>`, calcule el nuevo precio rebajado y vuelva a guardar el fichero actualizado.

---

### Reto 2: Analizador Estadístico SAX (`EstadisticasSAX.java`)
Dado un fichero XML con miles de productos:
1. Crear una clase que herede de `DefaultHandler`.
2. Interceptar las etiquetas `<precio>` y `<stock>` acumulando:
   - Número total de productos analizados.
   - Valor económico total del inventario ($\sum \text{precio} \times \text{stock}$).
   - Producto más caro encontrado.
3. Mostrar el informe estadístico final en consola al dispararse `endDocument()`.

---

### Reto 3: Mapeo con JAXB (`CatalogoJAXB.java`)
1. Modelar las clases `Catalogo` y `Producto` con las anotaciones `@XmlRootElement`, `@XmlAccessorType(XmlAccessType.FIELD)`, `@XmlAttribute` y `@XmlElement`.
2. Crear un programa principal que cree una lista de 3 productos en Java, los guarde en `catalogo_jaxb.xml` mediante `Marshaller` con `JAXB_FORMATTED_OUTPUT = true`, y a continuación los recupere con `Unmarshaller` mostrando los objetos por consola.

---

### Reto 4: Extracción Rápida con Cursor StAX (`BuscadorStAX.java`)
1. Instanciar `XMLInputFactory` y obtener un cursor `XMLStreamReader` sobre el catálogo.
2. Implementar el bucle de control `while (reader.hasNext())` avanzando con `reader.next()`.
3. Al detectar `XMLStreamConstants.START_ELEMENT`, si la etiqueta es `<producto>`, leer su atributo `id` con `reader.getAttributeValue(null, "id")`.
4. Si la etiqueta es `<precio>`, extraer el texto mediante `reader.getElementText()`.
5. Demostrar la ventaja de Pull Parser frente a Push (SAX): detener la lectura con un `break` en cuanto se encuentre un producto con precio superior a 50€, sin necesidad de parsear el resto del documento.

---

## 🔍 Criterios de Evaluación
- **Normalización de documentos y control de nodos `#text` en DOM**: 25%.
- **Correcta acumulación en buffer y gestión de estados en SAX**: 25%.
- **Anotaciones y configuración adecuada de contexto en JAXB**: 25%.
- **Control de cursor e interrupción anticipada con StAX**: 15%.
- **Buenas prácticas en el volcado con `Transformer` (indentación y UTF-8)**: 10%.
