---
tipo: concepto
modulo: "Redes Locales"
ud: "UD05"
ra_asociados: ["RA4"]
tags: [concepto, redes, ipv6, direccionamiento, hexadecimal, link-local, slaac]
dificultad: intermedia
estado: revisado
---

# 💡 Concepto: Fundamentos del Protocolo IPv6

> **Módulo**: [[MOC-Redes-Locales|Redes Locales]] | **UD**: [[UD05-Protocolo-IP-Configuracion-Interfaces|UD05]] | **RA**: [[RA04-Direccionamiento-IPv4-IPv6|RA4]]

---

## 📌 1. Concepto Fundamental
El protocolo IPv4 dispone de un espacio finito de \(2^{32} \approx 4.300\) millones de direcciones. El crecimiento exponencial de Internet, los teléfonos móviles y el Internet de las Cosas (IoT) provocó el agotamiento oficial del registro central de direcciones IPv4 por la IANA en febrero de 2011.

**IPv6 (especificado en la RFC 8200)** es el estándar sucesor diseñado para proporcionar un espacio prácticamente ilimitado:
- Utiliza direcciones de **128 bits** de longitud (frente a los 32 bits de IPv4).
- Espacio total de direcciones: \(2^{128} \approx 3,4 \times 10^{38}\) direcciones únicas (aproximadamente \(6,7 \times 10^{23}\) direcciones por cada metro cuadrado de la superficie de la Tierra).
- Elimina la necesidad de NAT, restableciendo la comunicación extremo a extremo (*end-to-end*).
- Autoconfiguración automática de direcciones sin servidor (**SLAAC - Stateless Address Autoconfiguration**).
- Cabecera simplificada de tamaño fijo (40 bytes) para un procesamiento más rápido en routers.
- **Sin transmisiones de difusión (Broadcast)**: IPv6 elimina el broadcast por completo; en su lugar utiliza **Multicast** y **Anycast**.

---

## ✍️ 2. Formato y Reglas de Abreviación

Una dirección IPv6 se escribe como **8 grupos de 4 dígitos hexadecimales** (denominados *hextetos* o palabras de 16 bits) separados por dos puntos:
```text
2001:0db8:0000:0000:0000:ff00:0042:8329
```

### Reglas Oficiales de Simplificación
1. **Regla 1: Omisión de ceros a la izquierda**: En cualquier hexteto, los ceros que se encuentren a la izquierda pueden suprimirse:
   - `0db8` \(\implies\) `db8`
   - `0000` \(\implies\) `0`
   - `0042` \(\implies\) `42`
   - Aplicando la Regla 1: `2001:db8:0:0:0:ff00:42:8329`
2. **Regla 2: Compresión de ceros contiguos mediante doble dos puntos (`::`)**:
   - Cualquier secuencia contigua de uno o más hextetos compuestos exclusivamente por ceros (`:0:0:0:`) puede reemplazarse por `::`.
   - **Restricción estricta**: El símbolo `::` sólo puede utilizarse **UNA ÚNICA VEZ** dentro de una misma dirección IPv6 (para evitar ambigüedad sobre cuántos ceros se comprimieron).
   - Aplicando la Regla 2: `2001:db8::ff00:42:8329`

---

## 🌐 3. Tipos Principales de Direcciones IPv6

| Tipo de Dirección | Prefijo / Rango | Descripción y Ámbito |
| :--- | :--- | :--- |
| **Global Unicast (GUA)** | `2000::/3` (comienzan por 2 o 3) | Equivalente a las IPs públicas enrutables en Internet. |
| **Link-Local (Enlace Local)** | `fe80::/10` | Obligatoria en cada interfaz activa. Sólo tiene validez dentro del mismo cable/segmento local; los routers no la enrutan. Utilizada para protocolos de vecino (NDP), enrutamiento y SLAAC. |
| **Unique Local (ULA)** | `fc00::/7` (habitualmente `fd00::/8`) | Equivalente a los rangos privados RFC 1918 de IPv4; para redes internas corporativas no enrutables en Internet. |
| **Loopback (Bucle local)** | `::1/128` | Equivalente al `127.0.0.1` de IPv4. |
| **Dirección no especificada** | `::/128` | Todos los bits a 0 (equivalente a `0.0.0.0`). |
| **Multicast** | `ff00::/8` | Para grupos de destino (ej. `ff02::1` = todos los nodos locales; `ff02::2` = todos los routers). |

---

## ⚠️ Errores Comunes y Puntos Clave en Taller
- **Usar `::` dos veces**: Una dirección como `2001:db8::1::2` es sintácticamente **INVÁLIDA** porque ningún software puede saber cuántos octetos de ceros faltan en cada lado.
- **Borrar ceros de la derecha**: En el bloque `ff00`, los dos ceros están a la derecha; no pueden eliminarse (quedaría `ff`, que equivale a `00ff`, un valor matemático totalmente distinto).
