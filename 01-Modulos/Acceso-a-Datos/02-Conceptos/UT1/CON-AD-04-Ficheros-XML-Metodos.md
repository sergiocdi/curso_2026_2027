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

El formato **XML (eXtensible Markup Language)** ha sido durante décadas el estándar de facto para la configuración de servidores empresariales, intercambio de información entre sistemas heterogéneos (servicios SOAP) y almacenamiento de documentos estructurados con metadatos.

A diferencia del texto plano no estructurado o de los ficheros binarios propietarios, el XML ofrece:
1. **Auto-descriptividad**: Etiquetas semánticas comprensibles por humanos y máquinas.
2. **Jerarquía estricta en árbol**: Elemento raíz único, elementos anidados y atributos.
3. **Independencia absoluta**: Neutral respecto al sistema operativo, lenguaje y arquitectura.

En el currículo de 2º DAM debemos responder a una pregunta clave:
**¿Qué tecnología de Java debemos escoger según el tamaño del archivo y las necesidades del proyecto?**
A lo largo de este tema exploraremos las cuatro maneras esenciales de trabajar con XML:
- **DOM**: El árbol completo en memoria RAM (ideal para modificar, consultar libremente o generar XMLs medianos).
- **SAX**: Lectura reactiva orientada a eventos *Push* (ideal para extraer datos de archivos masivos con mínimo consumo de RAM).
- **StAX**: Lectura orientada a flujo *Pull* mediante cursor/iterador (control total en el hilo del programador).
- **JAXB**: Mapeo declarativo Objeto-Relacional/XML con anotaciones (la vía más limpia y orientada a POO).

---

## 🌳 1. Manera 1: DOM (Document Object Model)

### 1.1 Fundamentos y Arquitectura en Memoria
El procesador DOM lee el documento XML completo desde disco y construye en la memoria RAM una estructura de datos idéntica: un **árbol jerárquico de nodos** (`org.w3c.dom.*`).
- Todo es un nodo (`Node`).
- El documento completo es un `Document`.
- Las etiquetas son `Element`.
- Los valores dentro de las etiquetas son nodos de texto `Text`.
- Los parámetros dentro de las etiquetas son `Attr`.

```
          <concesionario>               <- Elemento Raíz (DocumentElement)
             /          \
      <coche id="1">   <coche id="2">   <- Elementos Hijos
        /        \
    <marca>     <precio>               <- Elementos Nieto
      |            |
   "Toyota"     "24500"                <- Nodos Text (#text)
```

> [!WARNING]
> **La trampa de los nodos `#text` (espacios y saltos de línea)**:
> En XML, los saltos de línea y tabuladores entre etiquetas son interpretados por el parser DOM como nodos de texto (`#text`) con espacios en blanco. Si recorres los hijos con `nodo.getChildNodes()`, te toparás con nodos de texto vacíos.
> **Solución de aula**: Comprobar siempre `if (nodo.getNodeType() == Node.ELEMENT_NODE)` y llamar a `doc.getDocumentElement().normalize()` inmediatamente tras el parseo.

### 1.2 Lectura y Consulta con DOM
```java
import java.io.File;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import org.w3c.dom.*;

public class LectorDOM {
    public static void leerCatalogo(File ficheroXml) {
        try {
            // 1. Crear factoría y constructor
            DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
            DocumentBuilder builder = factory.newDocumentBuilder();

            // 2. Parsear el archivo al árbol DOM en memoria
            Document doc = builder.parse(ficheroXml);
            doc.getDocumentElement().normalize(); // Limpia nodos de texto huérfanos

            System.out.println("Elemento Raíz: " + doc.getDocumentElement().getNodeName());

            // 3. Buscar todos los elementos de tipo <vehiculo>
            NodeList listaVehiculos = doc.getElementsByTagName("vehiculo");

            for (int i = 0; i < listaVehiculos.getLength(); i++) {
                Node nodo = listaVehiculos.item(i);
                if (nodo.getNodeType() == Node.ELEMENT_NODE) {
                    Element elemento = (Element) nodo;
                    String matricula = elemento.getAttribute("matricula");
                    String marca = elemento.getElementsByTagName("marca").item(0).getTextContent();
                    String modelo = elemento.getElementsByTagName("modelo").item(0).getTextContent();
                    double precio = Double.parseDouble(elemento.getElementsByTagName("precio").item(0).getTextContent());

                    System.out.printf("  🚗 [%s] %s %s - %.2f €%n", matricula, marca, modelo, precio);
                }
            }
        } catch (Exception e) {
            System.err.println("Error al parsear DOM: " + e.getMessage());
        }
    }
}
```

### 1.3 Creación y Escritura de XML con DOM y `Transformer`
Para generar un nuevo archivo XML desde Java:
1. Creamos un `Document` vacío con `builder.newDocument()`.
2. Añadimos el elemento raíz con `doc.createElement()` y `doc.appendChild()`.
3. Construimos los hijos, asignamos atributos con `setAttribute()` y texto con `setTextContent()`.
4. Volcamos el árbol en disco usando `TransformerFactory` y `Transformer` con salida formateada.

```java
import java.io.File;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.transform.OutputKeys;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;
import org.w3c.dom.Document;
import org.w3c.dom.Element;

public class GeneradorDOM {
    public static void exportarCatalogo(File destino) {
        try {
            DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
            DocumentBuilder builder = factory.newDocumentBuilder();
            Document doc = builder.newDocument();

            // Raíz: <concesionario>
            Element raiz = doc.createElement("concesionario");
            doc.appendChild(raiz);

            // Hijo 1: <vehiculo matricula="9823-XYZ">
            Element vehiculo = doc.createElement("vehiculo");
            vehiculo.setAttribute("matricula", "9823-XYZ");

            Element marca = doc.createElement("marca");
            marca.setTextContent("Seat");
            vehiculo.appendChild(marca);

            Element modelo = doc.createElement("modelo");
            modelo.setTextContent("León");
            vehiculo.appendChild(modelo);

            Element precio = doc.createElement("precio");
            precio.setTextContent("19500.00");
            vehiculo.appendChild(precio);

            raiz.appendChild(vehiculo);

            // Volcado a disco físico con indentación bonita (pretty print)
            TransformerFactory tf = TransformerFactory.newInstance();
            Transformer transformer = tf.newTransformer();
            transformer.setOutputProperty(OutputKeys.INDENT, "yes");
            transformer.setOutputProperty("{http://xml.apache.org/xslt}indent-amount", "4");

            DOMSource source = new DOMSource(doc);
            StreamResult result = new StreamResult(destino);
            transformer.transform(source, result);

            System.out.println("✅ Archivo XML generado con DOM correctamente.");
        } catch (Exception e) {
            System.err.println("Error al generar XML: " + e.getMessage());
        }
    }
}
```

---

## ⚡ 2. Manera 2: SAX (Simple API for XML)

### 2.1 El Modelo Orientado a Eventos (Push Parsing)
¿Qué ocurre si la Agencia Tributaria o una aseguradora nos envía un archivo XML de **8 Gigabytes** con millones de facturas?
Si intentamos cargarlo con DOM, la aplicación colapsará inmediatamente con `OutOfMemoryError`, ya que DOM multiplica por 4 o 5 el tamaño del archivo en memoria RAM.

**SAX** es la solución:
- No almacena nada en memoria.
- Lee el archivo secuencialmente desde el primer byte hasta el último.
- A medida que se encuentra etiquetas, dispara **callbacks (eventos)** que el programador atiende en una clase que hereda de `org.xml.sax.helpers.DefaultHandler`:
  - `startElement(...)`: Se dispara al abrir una etiqueta (ej. `<vehiculo matricula="...">`).
  - `characters(...)`: Se dispara cuando lee texto dentro de una etiqueta.
  - `endElement(...)`: Se dispara al cerrar una etiqueta (ej. `</vehiculo>`).

```java
import java.io.File;
import javax.xml.parsers.SAXParser;
import javax.xml.parsers.SAXParserFactory;
import org.xml.sax.Attributes;
import org.xml.sax.SAXException;
import org.xml.sax.helpers.DefaultHandler;

public class LectorSAX {

    // Clase manejadora de eventos
    private static class CatalogoHandler extends DefaultHandler {
        private StringBuilder bufferTexto = new StringBuilder();
        private String matriculaActual;
        private String marcaActual;
        private String modeloActual;
        private double precioActual;

        @Override
        public void startElement(String uri, String localName, String qName, Attributes attributes) {
            bufferTexto.setLength(0); // Limpiamos el buffer acumulador de texto
            if ("vehiculo".equalsIgnoreCase(qName)) {
                matriculaActual = attributes.getValue("matricula");
            }
        }

        @Override
        public void characters(char[] ch, int start, int length) {
            // El parser puede llamar a characters() varias veces para un mismo texto, por eso acumulamos
            bufferTexto.append(ch, start, length);
        }

        @Override
        public void endElement(String uri, String localName, String qName) {
            String valor = bufferTexto.toString().trim();
            switch (qName.toLowerCase()) {
                case "marca":
                    marcaActual = valor;
                    break;
                case "modelo":
                    modeloActual = valor;
                    break;
                case "precio":
                    precioActual = Double.parseDouble(valor);
                    break;
                case "vehiculo":
                    System.out.printf("⚡ [SAX Event] Coche %s: %s %s - %.2f €%n",
                            matriculaActual, marcaActual, modeloActual, precioActual);
                    break;
            }
        }
    }

    public static void parsear(File archivoXml) {
        try {
            SAXParserFactory factory = SAXParserFactory.newInstance();
            SAXParser saxParser = factory.newSAXParser();
            saxParser.parse(archivoXml, new CatalogoHandler());
        } catch (Exception e) {
            System.err.println("Error procesando SAX: " + e.getMessage());
        }
    }
}
```

---

## 🧭 3. Manera 3: StAX (Streaming API for XML - Pull Parsing)

Mientras que SAX es *Push* (el parser tiene el control y empuja eventos a tu `DefaultHandler`), **StAX** es *Pull*: el programador tiene el control del bucle de ejecución y pide el siguiente evento cuando lo necesita (`reader.next()`).

### Ventajas de StAX
1. Es bidireccional: incluye `XMLStreamReader` (lectura ultrarrápida) y `XMLStreamWriter` (escritura directa a disco sin crear nodos en memoria).
2. Permite detener la lectura en cualquier momento cuando ya hemos encontrado lo que buscábamos (`break`), cosa que en SAX es muy engorrosa.

```java
import java.io.FileInputStream;
import javax.xml.stream.XMLInputFactory;
import javax.xml.stream.XMLStreamConstants;
import javax.xml.stream.XMLStreamReader;

public class LectorStAX {
    public static void leerPrecios(String ruta) {
        XMLInputFactory factory = XMLInputFactory.newInstance();
        try (FileInputStream fis = new FileInputStream(ruta)) {
            XMLStreamReader reader = factory.createXMLStreamReader(fis);

            String etiquetaActual = "";
            while (reader.hasNext()) {
                int evento = reader.next();

                switch (evento) {
                    case XMLStreamConstants.START_ELEMENT:
                        etiquetaActual = reader.getLocalName();
                        if ("vehiculo".equals(etiquetaActual)) {
                            System.out.print("Matrícula: " + reader.getAttributeValue(null, "matricula") + " -> ");
                        }
                        break;
                    case XMLStreamConstants.CHARACTERS:
                        String texto = reader.getText().trim();
                        if (!texto.isEmpty() && "precio".equals(etiquetaActual)) {
                            System.out.println("Precio: " + texto + " €");
                        }
                        break;
                    case XMLStreamConstants.END_ELEMENT:
                        etiquetaActual = "";
                        break;
                }
            }
            reader.close();
        } catch (Exception e) {
            System.err.println("Error StAX: " + e.getMessage());
        }
    }
}
```

---

## 🏷️ 4. Manera 4: JAXB (Mapeo Declarativo Objeto-XML)

**JAXB (Jakarta XML Binding)** es el estándar más productivo para aplicaciones de gestión empresarial.
En lugar de manipular nodos o interceptar eventos manualmente, anotamos nuestras clases Java (POJOs) y JAXB se encarga de:
- **Marshalling**: Convertir objetos Java en XML estructurado.
- **Unmarshalling**: Parsear XML y transformarlo directamente en objetos Java.

*(Nota didáctica: Desde Java 11, JAXB se incluye mediante dependencias Maven `jakarta.xml.bind:jakarta.xml.bind-api` y `org.glassfish.jaxb:jaxb-runtime`).*

### 4.1 Definición del Modelo de Datos Anotado
```java
import jakarta.xml.bind.annotation.*;
import java.util.ArrayList;
import java.util.List;

@XmlRootElement(name = "concesionario")
@XmlAccessorType(XmlAccessType.FIELD)
public class ConcesionarioXML {

    @XmlElement(name = "vehiculo")
    private List<VehiculoXML> vehiculos = new ArrayList<>();

    public List<VehiculoXML> getVehiculos() { return vehiculos; }
    public void setVehiculos(List<VehiculoXML> v) { this.vehiculos = v; }
}

@XmlAccessorType(XmlAccessType.FIELD)
class VehiculoXML {
    @XmlAttribute(name = "matricula")
    private String matricula;

    @XmlElement
    private String marca;

    @XmlElement
    private String modelo;

    @XmlElement
    private double precio;

    // Constructores y Getters/Setters obligatorios
    public VehiculoXML() {}
    public VehiculoXML(String matricula, String marca, String modelo, double precio) {
        this.matricula = matricula;
        this.marca = marca;
        this.modelo = modelo;
        this.precio = precio;
    }
}
```

### 4.2 Marshaller y Unmarshaller en Acción
```java
import jakarta.xml.bind.JAXBContext;
import jakarta.xml.bind.Marshaller;
import jakarta.xml.bind.Unmarshaller;
import java.io.File;

public class GestorJAXB {

    public static void guardar(File destino, ConcesionarioXML datos) throws Exception {
        JAXBContext context = JAXBContext.newInstance(ConcesionarioXML.class);
        Marshaller marshaller = context.createMarshaller();
        marshaller.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true); // Formato legible con sangría
        marshaller.marshal(datos, destino);
    }

    public static ConcesionarioXML cargar(File origen) throws Exception {
        JAXBContext context = JAXBContext.newInstance(ConcesionarioXML.class);
        Unmarshaller unmarshaller = context.createUnmarshaller();
        return (ConcesionarioXML) unmarshaller.unmarshal(origen);
    }
}
```

---

## 📊 5. Tabla Comparativa Definitiva para Exámenes

| Criterio | DOM | SAX | StAX | JAXB |
| :--- | :--- | :--- | :--- | :--- |
| **Modelo de proceso** | Árbol completo en RAM | Flujo de eventos (*Push*) | Flujo de eventos (*Pull*) | Mapeo Objeto-XML |
| **Consumo de memoria** | Muy alto ($\approx 4\times$ el XML) | Prácticamente nulo ($\sim 0$ KB) | Prácticamente nulo ($\sim 0$ KB) | Moderado (tamaño de los objetos) |
| **Modificación de nodos** | Sencilla y directa | No permite modificar | Permite escribir con Writer | Modificas el objeto Java y re-guardas |
| **Acceso aleatorio (XPath)** | Sí, total y bidireccional | No, solo secuencial hacia adelante | No, secuencial | Sí, navegando por el grafo de objetos |
| **Velocidad en ficheros grandes** | Muy lenta (o `OutOfMemory`) | Ultrarrápida | Ultrarrápida | Buena en datasets normales |
| **Caso de uso recomendado** | Ficheros `< 10` MB que requieren consultas XPath o ediciones frecuentes. | Lectura de volcados masivos (`> 50` MB a gigabytes). | Procesamiento selectivo donde queremos controlar el bucle. | Configuración de aplicaciones y APIs REST/SOAP basadas en POJOs. |
