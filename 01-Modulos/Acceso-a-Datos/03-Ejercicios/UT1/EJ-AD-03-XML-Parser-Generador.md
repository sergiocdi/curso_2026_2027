---
tipo: ejercicio
modulo: "Acceso a Datos"
ud: "UD01"
ra_asociados: ["RA1"]
ce_asociados: ["CE1.d", "CE1.e"]
tipo_actividad: reto
dificultad: media
tiempo_estimado_min: 75
rubrica: "[[Rubrica-Practicas-Programacion]]"
---

# 💻 Ejercicio Guiado: Parser y Generador XML con DOM

> **Módulo**: [[MOC-Acceso-a-Datos|Acceso a Datos]] | **UD**: [[UD01-Manejo-de-Ficheros|UD01 / UT1]] | **RAs**: `RA1 (CE1.d, CE1.e)` | **Tiempo**: `75 min`

---

## 📋 Enunciado

Desarrollar una pequeña herramienta Java para la gestión de un inventario de hardware en formato XML utilizando la API estándar **DOM (Document Object Model)**:

1. **Lectura y Consulta**:
   - Leer un fichero `inventario.xml` que contiene etiquetas `<dispositivo id="...">` con nodos hijos `<tipo>`, `<marca>`, `<modelo>` y `<precio>`.
   - Mostrar por consola el listado completo y calcular el valor total del inventario (suma de precios).
2. **Manipulación y Escritura**:
   - Incrementar en memoria un 10% el precio de los dispositivos de una marca determinada (por ejemplo, `"Dell"`).
   - Añadir un nuevo elemento `<dispositivo>` al árbol.
   - Volcar el árbol modificado a un nuevo archivo `inventario_actualizado.xml` con formato legible e indentación de 2 espacios mediante `Transformer`.

---

## 🛠️ Requisitos Técnicos
- Carga de documento con `DocumentBuilderFactory` y normalización del DOM con `doc.getDocumentElement().normalize()`.
- Filtrado estricto por tipo de nodo (`Node.ELEMENT_NODE`).
- Transformación y serialización XML con `TransformerFactory`, activando `OutputKeys.INDENT`.

---

## 🔑 Solución Modelo (Profesor)

> [!NOTE]- Ver Solución Completa DOM (Haz clic para desplegar)
> ```java
> import java.io.File;
> import javax.xml.parsers.DocumentBuilder;
> import javax.xml.parsers.DocumentBuilderFactory;
> import javax.xml.transform.OutputKeys;
> import javax.xml.transform.Transformer;
> import javax.xml.transform.TransformerFactory;
> import javax.xml.transform.dom.DOMSource;
> import javax.xml.transform.stream.StreamResult;
> import org.w3c.dom.*;
> 
> public class GestorInventarioXML {
>     public static void procesarInventario(File entrada, File salida) throws Exception {
>         DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
>         DocumentBuilder builder = factory.newDocumentBuilder();
>         Document doc = builder.parse(entrada);
>         doc.getDocumentElement().normalize();
> 
>         NodeList dispositivos = doc.getElementsByTagName("dispositivo");
>         double valorTotal = 0.0;
> 
>         for (int i = 0; i < dispositivos.getLength(); i++) {
>             Node nodo = dispositivos.item(i);
>             if (nodo.getNodeType() == Node.ELEMENT_NODE) {
>                 Element elem = (Element) nodo;
>                 String marca = elem.getElementsByTagName("marca").item(0).getTextContent();
>                 Element elemPrecio = (Element) elem.getElementsByTagName("precio").item(0);
>                 double precio = Double.parseDouble(elemPrecio.getTextContent());
> 
>                 // Modificación: subir 10% a Dell
>                 if ("Dell".equalsIgnoreCase(marca)) {
>                     precio = precio * 1.10;
>                     elemPrecio.setTextContent(String.format(java.util.Locale.US, "%.2f", precio));
>                 }
>                 valorTotal += precio;
>             }
>         }
>         System.out.printf("Valor total del inventario actualizado: %.2f€%n", valorTotal);
> 
>         // Inserción de nuevo nodo
>         Element nuevo = doc.createElement("dispositivo");
>         nuevo.setAttribute("id", "DEV-99");
>         
>         Element tipo = doc.createElement("tipo");
>         tipo.setTextContent("Monitor");
>         nuevo.appendChild(tipo);
>         
>         Element marca = doc.createElement("marca");
>         marca.setTextContent("LG");
>         nuevo.appendChild(marca);
>         
>         Element precio = doc.createElement("precio");
>         precio.setTextContent("189.50");
>         nuevo.appendChild(precio);
> 
>         doc.getDocumentElement().appendChild(nuevo);
> 
>         // Volcado con Transformer
>         Transformer transformer = TransformerFactory.newInstance().newTransformer();
>         transformer.setOutputProperty(OutputKeys.INDENT, "yes");
>         transformer.setOutputProperty("{http://xml.apache.org/xslt}indent-amount", "2");
>         transformer.transform(new DOMSource(doc), new StreamResult(salida));
>         System.out.println("Fichero guardado en: " + salida.getAbsolutePath());
>     }
> }
> ```
