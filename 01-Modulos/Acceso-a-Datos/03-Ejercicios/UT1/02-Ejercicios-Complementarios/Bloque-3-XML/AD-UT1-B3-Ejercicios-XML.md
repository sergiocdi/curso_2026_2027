---
tipo: hoja_ejercicios
modulo: "Acceso a Datos"
ud: "UD01"
bloque: "Bloque 3 - Ficheros XML (DOM, SAX, StAX y JAXB)"
ra_asociados: ["RA1"]
ce_asociados: ["CE1.e"]
dificultad: progresiva
destinatario: alumnado
---

# 📑 Hoja de Ejercicios Complementarios: Ecosistema XML en Java

> **Módulo**: [[MOC-Acceso-a-Datos|Acceso a Datos]] | **Ciclo**: DAM2 | **Unidad**: [[UD01-Manejo-de-Ficheros|UT1]]  
> **Bloque 3**: Ecosistema XML: Modelos DOM, Transformaciones XSLT, Parsers SAX y StAX, y Mapeo POJO JAXB  
> **Solucionario**: [[AD-UT1-B3-Soluciones-XML|Ver Solucionario y Guía Docente (Profesor)]]

---

## 🎯 Objetivos de Aprendizaje
1. Construir documentos XML en memoria RAM mediante **DOM** (`DocumentBuilder`, `Element`, `Text`, `Attr`) y serializarlos a disco con sangría (*pretty-print*) mediante `Transformer`.
2. Parsear e inspeccionar documentos XML con DOM, dominando la navegación por `NodeList` y la prevención de colapsos ante nodos de texto whitespace (`#text`).
3. Procesar grandes volúmenes XML sin carga en memoria mediante eventos **SAX** (`DefaultHandler`, acumulación en `StringBuilder`).
4. Controlar el flujo de lectura iterativo mediante cursores **StAX** (`XMLStreamReader`) demostrando la interrupción anticipada (*early exit*).
5. Automatizar el intercambio de datos entre objetos Java y ficheros XML mediante anotaciones declarativas **JAXB** (`Marshaller` y `Unmarshaller`).

---

## 📝 Ejercicio 1 (Nivel Básico): Generador de Facturas DOM con Transformer (`FacturaDOM.java`)

### Contexto Empresarial:
La normativa fiscal exige a las empresas la expedición de facturas electrónicas estructuradas en formato XML. Tu tarea consiste en crear un módulo generador capaz de construir el documento en memoria y volcarlo a disco con formato legible y sangrado de 4 espacios.

### Enunciado:
Desarrolla un programa en Java que genere el archivo `datos/factura_electronica.xml` con la siguiente estructura exacta:
```xml
<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<factura numero="FAC-2026-0042" fecha="2026-09-17">
    <emisor cif="B-33123456">
        <nombre>ElectroTech S.L.</nombre>
        <ciudad>Avilés</ciudad>
    </emisor>
    <cliente nif="71888999X">
        <nombre>Desarrollos Astur S.A.</nombre>
        <ciudad>Gijón</ciudad>
    </cliente>
    <lineas>
        <linea id="1">
            <concepto>Servidor Rack 1U</concepto>
            <cantidad>2</cantidad>
            <precioUnitario>850.00</precioUnitario>
        </linea>
        <linea id="2">
            <concepto>Switch Gigabit 24 Puertos</concepto>
            <cantidad>1</cantidad>
            <precioUnitario>145.50</precioUnitario>
        </linea>
    </lineas>
</factura>
```

### Requerimientos Técnicos:
- Crear el documento vacío con `DocumentBuilder.newDocument()`.
- Utilizar `doc.createElement()`, `doc.appendChild()`, `doc.createTextNode()` y `elemento.setAttribute()`.
- Configurar `Transformer`:
  - `tf.setOutputProperty(OutputKeys.INDENT, "yes");`
  - `tf.setOutputProperty("{http://xml.apache.org/xslt}indent-amount", "4");`
  - `tf.setOutputProperty(OutputKeys.ENCODING, "UTF-8");`
- Volcar a disco mediante `new DOMSource(doc)` y `new StreamResult(new File(...))`.

---

## 📝 Ejercicio 2 (Nivel Intermedio): Modificador de Tarifas DOM In-Situ (`GestorTarifasDOM.java`)

### Contexto Empresarial:
El departamento de compras dispone de un catálogo general de artículos informáticos `catalogo_tienda.xml`. Se necesita una herramienta de mantenimiento que permita aplicar campañas promocionales (por ejemplo, aplicar un 15% de descuento a todos los productos de la categoría `"Perifericos"`).

### Datos de Prueba (`datos/catalogo_tienda.xml`):
```xml
<?xml version="1.0" encoding="UTF-8"?>
<catalogo>
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
    <producto id="P03" categoria="Perifericos">
        <nombre>Teclado Mecanico RGB</nombre>
        <precio>65.00</precio>
        <stock>8</stock>
    </producto>
</catalogo>
```

### Enunciado:
Implementa el método `aplicarDescuentoCategoria(File archivo, String categoriaObjetivo, double porcentajeDescuento)`:
1. Carga el documento XML en memoria y aplica `doc.getDocumentElement().normalize()`.
2. Recorre todos los nodos `<producto>`.
3. Comprueba que el nodo es de tipo `Node.ELEMENT_NODE` para evitar los saltos de línea (`#text`).
4. Si el atributo `categoria` coincide con la categoría objetivo:
   - Extrae el precio actual con `Double.parseDouble(nodoPrecio.getTextContent())`.
   - Calcula el nuevo precio rebajado (`precio * (1.0 - (porcentajeDescuento / 100.0))`).
   - Actualiza el nodo en memoria con `nodoPrecio.setTextContent(String.format(Locale.US, "%.2f", nuevoPrecio))`.
5. Sobrescribe el archivo en disco con `Transformer` conservando la indentación de 4 espacios.

---

## 📝 Ejercicio 3 (Nivel Avanzado): Analizador Dual SAX y StAX (`AnalizadorDualXML.java`)

### Contexto Empresarial:
En entornos bancarios o de facturación gubernamental (como la Agencia Tributaria), los documentos XML superan con frecuencia los **500 MB** o **2 GB**. Cargar estos archivos con DOM provocaría un colapso de memoria `OutOfMemoryError`.

### Enunciado:
Desarrolla dos soluciones de alto rendimiento para procesar un catálogo XML masivo:

#### Parte A: Parser Reactivo SAX (`CatalogoStatsHandler.java`)
Hereda de `DefaultHandler` y calcula en una única pasada secuencial hacia adelante:
1. Número total de productos en el catálogo.
2. Valor total del inventario ($\sum \text{precio} \times \text{stock}$).
3. Nombre y precio del producto más caro.
- **Regla estricta**: El texto debe acumularse en un `StringBuilder` dentro del callback `characters()`, procesando la conversión numérica únicamente en `endElement()`.

#### Parte B: Cursor Pull StAX (`BuscadorStAX.java`)
Utiliza `XMLInputFactory` y `XMLStreamReader` para implementar una búsqueda directa:
- Método `buscarProductoPorId(File archivo, String idBuscado)`.
- El bucle `while (reader.hasNext())` debe avanzar con `reader.next()`.
- En cuanto se localice la etiqueta `<producto>` con el atributo `id` solicitado, extrae sus datos y **detén inmediatamente el bucle con un `break`**, demostrando la ventaja de StAX frente a SAX para búsquedas puntuales sin leer el resto del archivo.

---

## 📝 Ejercicio 4 (Nivel Avanzado): Mapeo Declarativo Objeto-XML con JAXB (`BibliotecaJAXB.java`)

### Contexto Empresarial:
Una plataforma de gestión editorial digital necesita sincronizar su catálogo de publicaciones entre microservicios mediante XML, utilizando anotaciones estándar de Java sin necesidad de interactuar con nodos ni descriptores de bajo nivel.

### Enunciado:
1. Modela las clases `Libro` y `Biblioteca`:
   - `Libro`: atributos `isbn` (String, atributo XML), `titulo` (String), `autor` (String), `precio` (double) y `paginas` (int).
   - `Biblioteca`: atributo `nombre` (String, atributo XML), lista de libros `List<Libro>` envuelta con `@XmlElement(name = "libro")`.
   - Recuerda incluir los constructores por defecto sin argumentos (`public Libro() {}`, `public Biblioteca() {}`).
2. Diseña la clase `BibliotecaJAXB`:
   - Método `exportarBiblioteca(Biblioteca bib, File destino)`: genera `datos/biblioteca.xml` utilizando `Marshaller` con `JAXB_FORMATTED_OUTPUT = true`.
   - Método `importarBiblioteca(File origen)`: reconstruye la instancia `Biblioteca` completa a partir del XML con `Unmarshaller` y muestra en consola el listado de libros con sus precios.
