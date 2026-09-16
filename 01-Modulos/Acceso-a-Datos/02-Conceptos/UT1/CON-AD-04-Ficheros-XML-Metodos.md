---
tipo: concepto
modulo: "Acceso a Datos"
ud: "UD01"
ra_asociados: ["RA1"]
tags: [concepto, java, xml, dom, sax, stax, jaxb, parser]
dificultad: media
estado: revisado
---

# 💡 Concepto: Lectura y Escritura de Ficheros XML (DOM, SAX, StAX y JAXB)

> **Módulo**: [[MOC-Acceso-a-Datos|Acceso a Datos]] | **UD**: [[UD01-Manejo-de-Ficheros|UD01 / UT1]] | **RA**: [[RA01-Manejo-Ficheros|RA1]]

---

## 👨‍🏫 Introducción del Profesor: El Ecosistema XML en Java

El formato **XML (eXtensible Markup Language)** es un estándar universal estructurado, independiente de plataforma y legible tanto por personas como por sistemas. Es el formato oficial para intercambio tributario (Facturae), mensajería interbancaria (SEPA ISO 20022), servicios web SOAP y configuraciones empresariales complejas.

En Java existen cuatro tecnologías fundamentales para su tratamiento. Cada una responde a una necesidad técnica concreta:
1. **DOM**: Carga el árbol completo en memoria RAM. Ideal para consultar, modificar y generar XMLs pequeños y medianos (< 20 MB).
2. **SAX**: Parser unidireccional reactivo (*Push*). Ideal para extraer información de ficheros gigantescos (gigabytes) con consumo de RAM plano.
3. **StAX**: Parser por flujo controlado por el programador (*Pull*). Permite detener la lectura o escribir XMLs de forma iterativa y eficiente.
4. **JAXB**: Mapeo declarativo Objeto-XML mediante anotaciones POJO. Elimina la manipulación manual de nodos.

---

## 🌳 1. Manera 1: DOM (Document Object Model) y `Transformer`

### 1.1 Arquitectura del Árbol en Memoria
DOM convierte todo el archivo XML en una estructura de nodos en memoria RAM (`org.w3c.dom.*`):
- El documento completo es un `Document`.
- Las etiquetas son `Element`.
- El texto dentro de las etiquetas son nodos hijos `Text`.
- Los parámetros dentro de las etiquetas son `Attr`.

### 🛠️ Ficha Técnica de Instrucciones de DOM (Lectura y Navegación)

| Instrucción / Método | Parámetros | Retorno | Qué hace exactamente a bajo nivel |
| :--- | :--- | :--- | :--- |
| `DocumentBuilderFactory.newInstance()` | Ninguno | Factoría | Crea la factoría proveedora de parsers DOM de la JVM. |
| `factory.newDocumentBuilder()` | Ninguno | `DocumentBuilder` | Construye el parser DOM concreto. |
| `builder.parse(File f)` | `File f` | `Document` | **Lee el archivo entero y construye el árbol completo de objetos en RAM.** |
| `doc.getDocumentElement()` | Ninguno | `Element` | Obtiene el nodo raíz principal del documento XML. |
| `doc.normalize()` | Ninguno | `void` | **Unifica y limpia el árbol**: fusiona nodos de texto fragmentados y elimina espacios adyacentes. |
| `elem.getElementsByTagName(String tag)` | `String tag` | `NodeList` | Busca de forma recursiva todos los elementos con esa etiqueta. |
| `nodeList.getLength()` | Ninguno | `int` | Devuelve cuántos nodos contiene la lista. |
| `nodeList.item(int index)` | `int index` | `Node` | Retorna el nodo situado en esa posición (base 0). |
| `node.getNodeType()` | Ninguno | `short` | Devuelve el tipo de nodo (`Node.ELEMENT_NODE == 1`, `Node.TEXT_NODE == 3`). |
| `elem.getAttribute(String name)` | `String name` | `String` | Retorna el valor del atributo dentro de la etiqueta. |
| `node.getTextContent()` | Ninguno | `String` | Devuelve el texto contenido dentro de la etiqueta y de todos sus hijos. |

---

### 🛠️ Ficha Técnica de Instrucciones de DOM (Creación, Modificación y Volcado)

| Instrucción / Método | Parámetros | Retorno | Qué hace exactamente |
| :--- | :--- | :--- | :--- |
| `builder.newDocument()` | Ninguno | `Document` | Crea un árbol XML nuevo y completamente vacío en memoria RAM. |
| `doc.createElement(String tag)` | `String tag` | `Element` | **Crea una etiqueta nueva** asociada a la factoría del documento. |
| `elem.setAttribute(String k, String v)` | `String k, String v` | `void` | Añade o modifica un atributo en la etiqueta. |
| `elem.setTextContent(String text)` | `String text` | `void` | Asigna el texto interior de la etiqueta creando su nodo `Text` hijo. |
| `nodoPadre.appendChild(Node hijo)` | `Node hijo` | `Node` | **Engancha el nuevo nodo** al final de la lista de hijos del padre. |
| `nodoPadre.removeChild(Node hijo)` | `Node hijo` | `Node` | Desvincula y elimina el nodo hijo del árbol en memoria. |
| `TransformerFactory.newInstance()` | Ninguno | Factoría | Crea la factoría para construir el serializador XML a disco. |
| `tfFactory.newTransformer()` | Ninguno | `Transformer` | Instancia el motor de transformación XSLT/XML. |
| `tf.setOutputProperty(key, value)` | `String k, String v` | `void` | Configura el volcado: `OutputKeys.INDENT = "yes"` para sangría y `{http://xml.apache.org/xslt}indent-amount = "4"`. |
| `tf.transform(Source src, Result res)` | `DOMSource, StreamResult` | `void` | **Vuelca físicamente el árbol DOM de la RAM al fichero en disco.** |

---

### 💻 Ejemplo Completo de DOM: Creación y Lectura con Explicación

```java
package es.cifpaviles.ad.ut1.xml;

import java.io.File;
import javax.xml.parsers.*;
import javax.xml.transform.*;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;
import org.w3c.dom.*;

public class EjemploDOMCompleto {

    private static final String RUTA_XML = "datos/catalogo_coches.xml";

    public static void main(String[] args) throws Exception {
        crearXmlConDOM();
        leerXmlConDOM();
    }

    public static void crearXmlConDOM() throws Exception {
        DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
        DocumentBuilder builder = factory.newDocumentBuilder();
        Document doc = builder.newDocument(); // Documento vacío en RAM

        // 1. Crear elemento raíz: <concesionario>
        Element raiz = doc.createElement("concesionario");
        doc.appendChild(raiz);

        // 2. Crear coche 1 con atributo matricula y etiquetas hijas
        Element coche1 = doc.createElement("coche");
        coche1.setAttribute("matricula", "1234-ABC");

        Element marca1 = doc.createElement("marca");
        marca1.setTextContent("Toyota");
        coche1.appendChild(marca1);

        Element precio1 = doc.createElement("precio");
        precio1.setTextContent("24500.00");
        coche1.appendChild(precio1);

        raiz.appendChild(coche1); // Colgamos el coche de la raíz

        // 3. Volcado formateado a disco con Transformer
        Transformer tf = TransformerFactory.newInstance().newTransformer();
        tf.setOutputProperty(OutputKeys.INDENT, "yes");
        tf.setOutputProperty("{http://xml.apache.org/xslt}indent-amount", "4");

        tf.transform(new DOMSource(doc), new StreamResult(new File(RUTA_XML)));
        System.out.println("✅ Archivo XML creado con DOM y Transformer en: " + RUTA_XML);
    }

    public static void leerXmlConDOM() throws Exception {
        File f = new File(RUTA_XML);
        DocumentBuilder builder = DocumentBuilderFactory.newInstance().newDocumentBuilder();
        Document doc = builder.parse(f);

        doc.getDocumentElement().normalize(); // Limpieza obligatoria de espacios adyacentes
        System.out.println("\n🌳 Leyendo árbol DOM desde RAM (Raíz: " + doc.getDocumentElement().getNodeName() + "):");

        NodeList listaCoches = doc.getElementsByTagName("coche");

        for (int i = 0; i < listaCoches.getLength(); i++) {
            Node nodo = listaCoches.item(i);

            // FILTRADO ESTRICTO: Ignorar nodos de texto vacíos (#text)
            if (nodo.getNodeType() == Node.ELEMENT_NODE) {
                Element elemCoche = (Element) nodo;
                String matricula = elemCoche.getAttribute("matricula");
                String marca = elemCoche.getElementsByTagName("marca").item(0).getTextContent();
                double precio = Double.parseDouble(elemCoche.getElementsByTagName("precio").item(0).getTextContent());

                System.out.printf("  🚗 Coche [%s] Marca: %-10s | Precio: %.2f €%n",
                                  matricula, marca, precio);
            }
        }
    }
}
```

---

## ⚡ 2. Manera 2: SAX (Simple API for XML)

### 2.1 El Modelo Orientado a Eventos (Push Parsing)
Para ficheros masivos de varios gigabytes (facturación, censos), DOM es inviable porque colapsa la memoria con `OutOfMemoryError`.
**SAX lee secuencialmente hacia adelante como una cinta transportadora**. Dispara eventos que son atendidos por la clase `DefaultHandler`.

### 🛠️ Ficha Técnica de Callbacks de `DefaultHandler`

| Método Callback | Parámetros | Cuándo se dispara y qué hacer en él |
| :--- | :--- | :--- |
| `startDocument()` | Ninguno | Se dispara una sola vez al inicio del archivo. Ideal para inicializar contadores y colecciones. |
| `startElement(...)` | `uri, localName, qName, attributes` | **Se dispara al encontrar una etiqueta de apertura** (ej. `<coche matricula="...">`). `qName` contiene el nombre de la etiqueta y `attributes.getValue("nombre")` lee los atributos. Se debe limpiar el acumulador de texto. |
| `characters(...)` | `char[] ch, int start, int length` | **Se dispara cuando lee texto dentro de la etiqueta.** ⚠️ *¡Atención!* El parser puede llamar a este método varias veces seguidas para un mismo texto; **es obligatorio acumular con `StringBuilder.append()`**. |
| `endElement(...)` | `uri, localName, qName` | **Se dispara al encontrar la etiqueta de cierre** (ej. `</coche>`). Es el momento de extraer el texto acumulado del `StringBuilder`, parsearlo y procesar la entidad. |
| `endDocument()` | Ninguno | Se dispara al terminar de leer todo el documento XML. Ideal para emitir informes finales. |

---

### 💻 Ejemplo Completo de SAX con Acumulador de Texto Seguro

```java
package es.cifpaviles.ad.ut1.xml;

import java.io.File;
import javax.xml.parsers.SAXParser;
import javax.xml.parsers.SAXParserFactory;
import org.xml.sax.Attributes;
import org.xml.sax.SAXException;
import org.xml.sax.helpers.DefaultHandler;

public class EjemploSAXCompleto {

    public static void main(String[] args) throws Exception {
        File f = new File("datos/catalogo_coches.xml");

        SAXParserFactory factory = SAXParserFactory.newInstance();
        SAXParser saxParser = factory.newSAXParser();

        ManejadorCochesSAX handler = new ManejadorCochesSAX();
        System.out.println("⚡ Iniciando parseo reactivo SAX sin consumo de RAM:");
        saxParser.parse(f, handler);
    }
}

class ManejadorCochesSAX extends DefaultHandler {

    private StringBuilder bufferTexto = new StringBuilder();
    private String matriculaActual;
    private String marcaActual;
    private double precioActual;

    @Override
    public void startElement(String uri, String localName, String qName, Attributes attributes) {
        bufferTexto.setLength(0); // Vaciamos el acumulador al entrar en cualquier etiqueta

        if (qName.equalsIgnoreCase("coche")) {
            // Leemos el atributo usando attributes.getValue()
            matriculaActual = attributes.getValue("matricula");
        }
    }

    @Override
    public void characters(char[] ch, int start, int length) {
        // Acumulamos los caracteres en el buffer (no asumir una sola llamada)
        bufferTexto.append(ch, start, length);
    }

    @Override
    public void endElement(String uri, String localName, String qName) {
        String texto = bufferTexto.toString().trim();

        if (qName.equalsIgnoreCase("marca")) {
            marcaActual = texto;
        } else if (qName.equalsIgnoreCase("precio")) {
            precioActual = Double.parseDouble(texto);
        } else if (qName.equalsIgnoreCase("coche")) {
            // Fin del elemento coche: mostramos los datos consolidados
            System.out.printf("  [SAX Event] Coche procesado -> Matrícula: %s | Marca: %s | Precio: %.2f €%n",
                              matriculaActual, marcaActual, precioActual);
        }
    }
}
```

---

## 🎛️ 3. Manera 3: StAX (Streaming API for XML - Pull Parsing)

### 3.1 Control Total del Bucle (Pull vs Push)
A diferencia de SAX (donde el parser te "empuja" eventos cuando él quiere), en StAX **el programador tiene el control del bucle mediante un cursor iterativo** (`XMLStreamReader` y `XMLStreamWriter`). Permite detener la lectura en cualquier momento con un simple `break`.

### 🛠️ Ficha Técnica de Instrucciones de StAX (Lectura con `XMLStreamReader`)

| Instrucción / Método | Retorno | Qué hace exactamente |
| :--- | :---: | :--- |
| `reader.hasNext()` | `boolean` | Comprueba si quedan más eventos/tokens por procesar en el flujo. |
| `reader.next()` | `int` | **Avanza el cursor al siguiente evento** y devuelve su código entero (`START_ELEMENT`, `CHARACTERS`, `END_ELEMENT`). |
| `reader.getEventType()` | `int` | Consulta el código del evento actual donde está posicionado el cursor. |
| `reader.getLocalName()` | `String` | Retorna el nombre de la etiqueta (`coche`, `marca`, etc.). |
| `reader.getAttributeValue(null, name)` | `String` | Lee directamente el valor del atributo indicado sin recorrer listas. |
| `reader.getElementText()` | `String` | **Lee directamente todo el texto interior** de la etiqueta actual hasta su cierre. |

---

### 💻 Ejemplo Completo de Lectura con StAX (Pull)

```java
package es.cifpaviles.ad.ut1.xml;

import java.io.FileInputStream;
import javax.xml.stream.XMLInputFactory;
import javax.xml.stream.XMLStreamConstants;
import javax.xml.stream.XMLStreamReader;

public class EjemploStAXPull {

    public static void main(String[] args) throws Exception {
        XMLInputFactory factory = XMLInputFactory.newInstance();

        try (FileInputStream fis = new FileInputStream("datos/catalogo_coches.xml")) {
            XMLStreamReader reader = factory.createXMLStreamReader(fis);

            System.out.println("🎛️ Procesando XML con StAX Pull Cursor:");

            // El programador maneja el bucle while a voluntad
            while (reader.hasNext()) {
                int evento = reader.next();

                if (evento == XMLStreamConstants.START_ELEMENT) {
                    String nombreTag = reader.getLocalName();

                    if ("coche".equalsIgnoreCase(nombreTag)) {
                        String matricula = reader.getAttributeValue(null, "matricula");
                        System.out.println("-> Coche encontrado con matrícula: " + matricula);
                    } else if ("marca".equalsIgnoreCase(nombreTag)) {
                        // getElementText() consume automáticamente el evento CHARACTERS
                        System.out.println("   Marca: " + reader.getElementText());
                    } else if ("precio".equalsIgnoreCase(nombreTag)) {
                        System.out.println("   Precio: " + reader.getElementText() + " €");
                    }
                }
            }
            reader.close();
        }
    }
}
```

---

## 🎯 4. Manera 4: JAXB (Jakarta XML Binding)

### 4.1 Mapeo Declarativo sin Manipulación de Nodos
JAXB elimina por completo el código de bajo nivel. Vincula clases POJO con etiquetas XML mediante anotaciones estándar:
- **Marshalling**: Convierte un objeto Java en un fichero XML.
- **Unmarshalling**: Lee un fichero XML y crea directamente el objeto Java poblado.

### 🛠️ Ficha Técnica de Anotaciones de JAXB

| Anotación | Dónde se coloca | Qué hace exactamente |
| :--- | :--- | :--- |
| `@XmlRootElement(name = "catalogo")` | Sobre la clase | Marca la clase que representará la **etiqueta raíz del documento XML**. |
| `@XmlElement(name = "coche")` | Sobre campo o getter | Asocia la propiedad con una **etiqueta hija interior**. |
| `@XmlAttribute(name = "matricula")` | Sobre campo o getter | Asocia la propiedad con un **atributo de la etiqueta**. |
| `@XmlTransient` | Sobre campo o getter | **Excluye el campo**: no se guardará ni leerá del XML. |
| `@XmlElementWrapper(name = "lista_coches")` | Sobre colecciones (`List`) | Genera una etiqueta contenedora envolvente alrededor de la lista de elementos. |

---

### 💻 Ejemplo Completo de JAXB: Marshalling y Unmarshalling

#### Paso 1: Clase POJO Anotada
```java
package es.cifpaviles.ad.ut1.xml;

import jakarta.xml.bind.annotation.*;

@XmlRootElement(name = "vehiculo")
@XmlType(propOrder = { "marca", "modelo", "precio" }) // Fija el orden de las etiquetas
public class VehiculoJAXB {

    private String matricula;
    private String marca;
    private String modelo;
    private double precio;

    // CONSTRUCTOR VACÍO OBLIGATORIO para que JAXB pueda instanciar la clase por reflexión
    public VehiculoJAXB() {}

    public VehiculoJAXB(String matricula, String marca, String modelo, double precio) {
        this.matricula = matricula;
        this.marca = marca;
        this.modelo = modelo;
        this.precio = precio;
    }

    @XmlAttribute(name = "matricula")
    public String getMatricula() { return matricula; }
    public void setMatricula(String matricula) { this.matricula = matricula; }

    @XmlElement(name = "marca")
    public String getMarca() { return marca; }
    public void setMarca(String marca) { this.marca = marca; }

    @XmlElement(name = "modelo")
    public String getModelo() { return modelo; }
    public void setModelo(String modelo) { this.modelo = modelo; }

    @XmlElement(name = "precio")
    public double getPrecio() { return precio; }
    public void setPrecio(double precio) { this.precio = precio; }

    @Override
    public String toString() {
        return String.format("VehiculoJAXB [%s] %s %s - %.2f €", matricula, marca, modelo, precio);
    }
}
```

#### Paso 2: Serialización y Deserialización con JAXBContext
```java
package es.cifpaviles.ad.ut1.xml;

import jakarta.xml.bind.JAXBContext;
import jakarta.xml.bind.Marshaller;
import jakarta.xml.bind.Unmarshaller;
import java.io.File;

public class EjemploJAXBCompleto {

    public static void main(String[] args) throws Exception {
        File destino = new File("datos/vehiculo_jaxb.xml");

        // 1. Crear el contexto JAXB indicando la clase raíz a mapear
        JAXBContext contexto = JAXBContext.newInstance(VehiculoJAXB.class);

        // =====================================================================
        // MARSHALLING: Objeto Java -> Archivo XML
        // =====================================================================
        Marshaller marshaller = contexto.createMarshaller();
        marshaller.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true); // Sangría bonita

        VehiculoJAXB coche = new VehiculoJAXB("5678-DEF", "Ford", "Focus", 21000.00);
        marshaller.marshal(coche, destino);
        System.out.println("✅ Objeto exportado a XML con Marshaller en: " + destino.getAbsolutePath());

        // =====================================================================
        // UNMARSHALLING: Archivo XML -> Objeto Java
        // =====================================================================
        Unmarshaller unmarshaller = contexto.createUnmarshaller();
        VehiculoJAXB cocheRecuperado = (VehiculoJAXB) unmarshaller.unmarshal(destino);

        System.out.println("\n📥 Objeto Java deserializado desde XML:");
        System.out.println("  " + cocheRecuperado);
        System.out.println("  Marca leída: " + cocheRecuperado.getMarca());
        System.out.println("  Precio leído: " + cocheRecuperado.getPrecio() + " €");
    }
}
```
