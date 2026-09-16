---
tipo: concepto
modulo: "Redes Locales"
ud: "UD05"
ra_asociados: ["RA4"]
tags: [concepto, redes, subnetting, flsm, mascara, cidr, calculo-ip]
dificultad: avanzada
estado: revisado
---

# 💡 Concepto: Subnetting FLSM (Máscara de Longitud Fija) y Cálculo de Subredes

> **Módulo**: [[MOC-Redes-Locales|Redes Locales]] | **UD**: [[UD05-Protocolo-IP-Configuracion-Interfaces|UD05]] | **RA**: [[RA04-Direccionamiento-IPv4-IPv6|RA4]]

---

## 📌 1. Concepto Fundamental
El **Subnetting** es el proceso de división de una red IP física o lógica principal en múltiples redes más pequeñas e independientes denominadas **subredes**.

### ¿Por qué hacemos Subnetting?
1. **Reducción del tráfico de difusión (Broadcast)**: Confinar las tramas broadcast a grupos de trabajo más reducidos.
2. **Seguridad y Aislamiento**: Separar departamentos (Administración, Alumnos, Profesores, Servidores) de forma que el tráfico entre ellos deba ser auditado o filtrado por un router o firewall.
3. **Eficiencia en la asignación**: Evitar el desperdicio masivo de direcciones que ocurría en el modelo histórico de clases fijas.

En **FLSM (Fixed Length Subnet Mask)**, todas las subredes creadas a partir de una red base comparten **exactamente la misma máscara de subred** y, por tanto, disponen de la misma capacidad idéntica de hosts.

---

## 🧮 2. Fórmulas Matemáticas y Mecánica de Cálculo

Para crear subredes, el administrador "pide prestados" \(n\) bits de la porción original de host para sumárselos a la porción de red:

```text
Porción de Red Original ──────► [ RED ] [ RED ] [ RED ]
Bits prestados (n)     ──────►                     [ SUBRED (n bits) ]
Bits restantes de host (m) ───►                                       [ HOST (m bits) ]
```

1. **Número de Subredes creadas**:
   \[
   N_{\text{subredes}} = 2^n \quad (\text{donde } n \text{ es el número de bits prestados})
   \]
2. **Número de Hosts útiles por subred**:
   \[
   N_{\text{hosts útiles}} = 2^m - 2 \quad (\text{donde } m \text{ es el número de bits que quedan para host})
   \]
   *(Se restan siempre 2 porque la primera dirección identifica a la propia red [todos los bits de host a 0] y la última es el broadcast de la subred [todos los bits de host a 1])*.
3. **Número Mágico (Salto entre subredes)**:
   \[
   \text{Salto} = 256 - \text{Valor decimal del octeto modificado en la máscara} = 2^m
   \]

---

## 📝 3. Ejemplo Práctico Paso a Paso

**Enunciado**: Partiendo de la red base `192.168.10.0/24`, necesitamos dividirla en **4 subredes**.

### Paso 1: Determinar bits prestados (\(n\))
Buscamos la potencia de 2 tal que \(2^n \ge 4 \implies n = 2\) bits prestados.

### Paso 2: Calcular la nueva máscara
- Máscara original: `/24` (`11111111.11111111.11111111.00000000`)
- Nueva máscara: \(24 + 2 = \mathbf{/26}\)
- En binario el 4º octeto es: `11000000` \(\implies 128 + 64 = \mathbf{192}\).
- Máscara decimal completa: `255.255.255.192`.

### Paso 3: Calcular hosts por subred y el salto
- Bits de host restantes: \(m = 8 - 2 = 6\) bits.
- Hosts útiles: \(2^6 - 2 = 64 - 2 = \mathbf{62}\) hosts útiles por subred.
- Salto entre subredes: \(256 - 192 = \mathbf{64}\) (o \(2^6 = 64\)).

### Paso 4: Construcción de la Tabla de Subredes
| Subred | Dirección de Red | Primer Host Útil | Último Host Útil | Dirección de Broadcast | Máscara |
| :---: | :--- | :--- | :--- | :--- | :---: |
| **0** | `192.168.10.0` | `192.168.10.1` | `192.168.10.62` | `192.168.10.63` | `/26` (`255.255.255.192`) |
| **1** | `192.168.10.64` | `192.168.10.65` | `192.168.10.126` | `192.168.10.127` | `/26` (`255.255.255.192`) |
| **2** | `192.168.10.128` | `192.168.10.129` | `192.168.10.190` | `192.168.10.191` | `/26` (`255.255.255.192`) |
| **3** | `192.168.10.192` | `192.168.10.193` | `192.168.10.254` | `192.168.10.255` | `/26` (`255.255.255.192`) |

---

## ⚠️ Errores Comunes y Puntos Clave en Taller
- **Asignar la IP de red o de broadcast a un ordenador**: Si intentas configurar en Windows `192.168.10.63` con máscara `255.255.255.192`, el sistema operativo mostrará un mensaje de error impidiendo la configuración por tratarse de la dirección de broadcast de la subred.
- **Olvidar restar 2**: Pregunta típica: *"¿Cuántos ordenadores caben en una red /24?"*. Respuesta técnica correcta: **254** ordenadores (no 256).
