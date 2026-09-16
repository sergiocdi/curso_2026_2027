---
tipo: concepto
modulo: "Redes Locales"
ud: "UD05"
ra_asociados: ["RA4"]
tags: [concepto, redes, vlsm, subnetting, mascara-variable, wan, punto-a-punto]
dificultad: avanzada
estado: revisado
---

# 💡 Concepto: Subnetting VLSM (Máscara de Longitud Variable)

> **Módulo**: [[MOC-Redes-Locales|Redes Locales]] | **UD**: [[UD05-Protocolo-IP-Configuracion-Interfaces|UD05]] | **RA**: [[RA04-Direccionamiento-IPv4-IPv6|RA4]]

---

## 📌 1. Concepto Fundamental
En un diseño con FLSM, todas las subredes reciben el mismo tamaño. Esto genera un grave problema de desperdicio: si una subred aloja a 50 equipos comerciales y otra subred es un simple enlace serie punto a punto entre dos routers (que sólo necesita 2 IPs), asignar una subred de 62 hosts al enlace punto a punto desperdicia 60 direcciones útiles.

**VLSM (Variable Length Subnet Masking - Máscara de Subred de Longitud Variable)** resuelve este problema permitiendo que **cada subred tenga su propia máscara personalizada e individualizada** adaptada con precisión a la cantidad exacta de equipos que necesita alojar, optimizando al máximo el espacio de direcciones IP.

---

## 📐 2. Regla de Oro para el Diseño con VLSM

> [!IMPORTANT]
> **REGLA FUNDAMENTAL DE ORDENACIÓN**:
> Para calcular un direccionamiento VLSM sin solapamientos ni errores, **las subredes DEBEN ordenarse SIEMPRE de MAYOR a MENOR número de hosts requeridos**.

### Enlaces Punto a Punto entre Routers (Máscara /30)
Para unir dos interfaces de routers en un enlace dedicado se utiliza habitualmente una máscara **/30** (`255.255.255.252`):
- Bits de host: \(m = 32 - 30 = 2\) bits.
- Total IPs: \(2^2 = 4\) (1 red + 2 hosts útiles + 1 broadcast).
- Desperdicio cero: exactamente 2 direcciones de host utilizables (una para cada extremo del cable).

---

## 📝 3. Caso Práctico de Diseño VLSM

**Escenario**: Disponemos de la red `192.168.1.0/24` y debemos dimensionar los siguientes 4 segmentos:
- Subred A (Aulas): 100 hosts
- Subred B (Administración): 50 hosts
- Subred C (Servidores): 25 hosts
- Enlace WAN (Router 1 - Router 2): 2 hosts

### Paso 1: Ordenar de mayor a menor y calcular bits de host (\(2^m - 2 \ge \text{requeridos}\))
1. **Subred A (100 hosts)**: \(2^7 - 2 = 126 \ge 100 \implies m = 7\) bits de host.
   - Máscara: \(32 - 7 = \mathbf{/25}\) (`255.255.255.128`). Salto: 128.
2. **Subred B (50 hosts)**: \(2^6 - 2 = 62 \ge 50 \implies m = 6\) bits de host.
   - Máscara: \(32 - 6 = \mathbf{/26}\) (`255.255.255.192`). Salto: 64.
3. **Subred C (25 hosts)**: \(2^5 - 2 = 30 \ge 25 \implies m = 5\) bits de host.
   - Máscara: \(32 - 5 = \mathbf{/27}\) (`255.255.255.224`). Salto: 32.
4. **Enlace WAN (2 hosts)**: \(2^2 - 2 = 2 \ge 2 \implies m = 2\) bits de host.
   - Máscara: \(32 - 2 = \mathbf{/30}\) (`255.255.255.252`). Salto: 4.

### Paso 2: Asignación Continua de Direcciones
| Subred | Requeridos | Red | Máscara | Rango de Hosts Útiles | Broadcast |
| :--- | :---: | :--- | :---: | :--- | :--- |
| **A (Aulas)** | 100 | `192.168.1.0` | `/25` | `192.168.1.1` - `192.168.1.126` | `192.168.1.127` |
| **B (Admin)** | 50 | `192.168.1.128` | `/26` | `192.168.1.129` - `192.168.1.190` | `192.168.1.191` |
| **C (Serv)** | 25 | `192.168.1.192` | `/27` | `192.168.1.193` - `192.168.1.222` | `192.168.1.223` |
| **WAN** | 2 | `192.168.1.224` | `/30` | `192.168.1.225` - `192.168.1.226` | `192.168.1.227` |
| *Espacio Libre* | — | `192.168.1.228` | `/30 ...` | *(Disponible para futuras expansiones)* | `192.168.1.255` |

---

## ⚠️ Errores Comunes y Puntos Clave en Taller
- **No ordenar de mayor a menor**: Si se calcula primero una subred pequeña (ej. de 2 hosts en `192.168.1.0/30`), la red de 100 hosts no cabrá a continuación porque sus bits de red violarán la frontera natural de potencias de 2 (alineación de subredes).
- **Protocolos que soportan VLSM**: Los protocolos de enrutamiento antiguos con clase (como RIPv1) no transportan la máscara de subred y no soportan VLSM; se requiere obligatoriamente protocolos sin clase (*classless*) como RIPv2, OSPF o rutas estáticas.
