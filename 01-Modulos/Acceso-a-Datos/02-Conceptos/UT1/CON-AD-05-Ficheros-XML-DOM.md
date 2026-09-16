---
tipo: concepto
modulo: "Acceso a Datos"
ud: "UD01"
ra_asociados: ["RA1"]
tags: [concepto, java, xml, dom, transformer, sax]
dificultad: media
estado: revisado
---

# 💡 Concepto: Lectura y Escritura de Ficheros XML con DOM y SAX

> **Módulo**: [[MOC-Acceso-a-Datos|Acceso a Datos]] | **UD**: [[UD01-Manejo-de-Ficheros|UD01 / UT1]] | **RA**: [[RA01-Manejo-Ficheros|RA1]]

---

## 📌 1. Procesamiento de XML en Java: Enfoques Principales

Para interactuar con documentos XML estructurados desde Java existen dos modelos clásicos estándar en el paquete `javax.xml`:

1. **DOM (Document Object Model)**:
   - Carga el documento XML **completo en memoria RAM** en forma de árbol jerárquico de nodos (`Document`, `Element`, `Attr`, `Text`).
   - **Ventajas**: Permite acceso aleatorio, navegación bidireccional (padres, hijos, hermanos), edición, inserción y eliminación de nodos.
   - **Desventajas**: Elevado consumo de memoria; no apto para ficheros gigantescos (>50-100 MB).

2. **SAX (Simple API for XML)**:
   - Procesador basado en **flujos y eventos** secuenciales hacia adelante (*push parser*).
   - Lee línea por línea disparando callbacks (`startDocument`, `startElement`, `characters`, `endElement`) mediante un `DefaultHandler`.
   - **Ventajas**: Consumo de memoria mínimo e independiente del tamaño del archivo.
   - **Desventajas**: Solo lectura secuencial, no permite modificar ni volver atrás.

---

## 💻 2. Lectura y Parseo con DOM (`DocumentBuilder`)

El proceso de lectura carga el archivo físico y construye la instancia de `org.w3c.dom.Document`:

```java
import java.io.File;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

public class LectorXMLDOM {
    public static void parsearCatalogo(File archivoXml) throws Exception {
        // 1. Crear la factoría y el constructor
        DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
        DocumentBuilder builder = factory.newDocumentBuilder();

        // 2. Parsear el archivo al árbol DOM
        Document doc = builder.parse(archivoXml);
        doc.getDocumentElement().normalize(); // Elimina nodos de texto vacíos adyacentes

        System.out.println("Elemento raíz: " + doc.getDocumentElement().getNodeName());

        // 3. Obtener los nodos por etiqueta
        NodeList listaLibros = doc.getElementsByTagName("libro");

        for (int i = 0; i < listaLibros.getLength(); i++) {
            Node nodo = listaLibros.item(i);
            if (nodo.getNodeType() == Node.ELEMENT_NODE) {
                Element elem = (Element) nodo;
                String isbn = elem.getAttribute("isbn");
                String titulo = elem.getElementsByTagName("titulo").item(0).getTextContent();
                double precio = Double.parseDouble(elem.getElementsByTagName("precio").item(0).getTextContent());

                System.out.printf("ISBN: %s | Título: %s | Precio: %.2f€%n", isbn, titulo, precio);
            }
        }
    }
}
```

---

## ✍️ 3. Creación y Escritura de XML con DOM y `Transformer`

Para crear un XML en memoria y volcarlo a disco, generamos los elementos con el `Document` y empleamos `Transformer` para serializarlo:

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

public class GeneradorXMLDOM {
    public static void guardarProducto(File destino, String id, String nombre, double precio) throws Exception {
        DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
        DocumentBuilder builder = factory.newDocumentBuilder();
        Document doc = builder.newDocument();

        // Elemento raíz
        Element raiz = doc.createElement("almacen");
        doc.appendChild(raiz);

        // Elemento hijo con atributo y contenido
        Element prod = doc.createElement("producto");
        prod.setAttribute("id", id);
        
        Element elemNombre = doc.createElement("nombre");
        elemNombre.setTextContent(nombre);
        prod.appendChild(elemNombre);

        Element elemPrecio = doc.createElement("precio");
        elemPrecio.setTextContent(String.valueOf(precio));
        prod.appendChild(elemPrecio);

        raiz.appendChild(prod);

        // Transformación del árbol DOM a archivo XML con indentación
        TransformerFactory tf = TransformerFactory.newInstance();
        Transformer transformer = tf.newTransformer();
        transformer.setOutputProperty(OutputKeys.INDENT, "yes");
        transformer.setOutputProperty("{http://xml.apache.org/xslt}indent-amount", "2");

        DOMSource source = new DOMSource(doc);
        StreamResult result = new StreamResult(destino);
        transformer.transform(source, result);
    }
}
```

---

## ⚠️ Buenas Prácticas y Errores Habituales
- **Nodos de texto whitespace (#text)**: Los saltos de línea y tabuladores en el XML se leen como nodos hijos de tipo texto. Para evitar errores, verificar siempre `nodo.getNodeType() == Node.ELEMENT_NODE` o llamar a `doc.getDocumentElement().normalize()`.
- **Excepciones de validación**: Capturar adecuadamente `ParserConfigurationException`, `SAXException` e `IOException`.
- **Elección adecuada**: Usar DOM para XMLs de configuración y datasets medianos; recurrir a SAX o StAX si el fichero supera decenas de megabytes.
