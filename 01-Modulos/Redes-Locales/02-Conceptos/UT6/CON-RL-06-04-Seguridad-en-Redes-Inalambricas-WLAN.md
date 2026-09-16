---
tipo: concepto
modulo: "Redes Locales"
ud: "UD06"
ra_asociados: ["RA3"]
tags: [concepto, redes, seguridad-wifi, wpa2, wpa3, psk, 8021x, radius, aes]
dificultad: intermedia
estado: revisado
---

# 💡 Concepto: Seguridad en Redes Inalámbricas WLAN

> **Módulo**: [[MOC-Redes-Locales|Redes Locales]] | **UD**: [[UD06-Redes-Inalambricas-Mixtas|UD06]] | **RA**: [[RA03-Configuracion-Conmutadores-Routers|RA3]]

---

## 📌 1. Concepto Fundamental
En una red cableada tradicional, la seguridad física del edificio (puertas cerradas, tomas controladas) limita enormemente el acceso de intrusos al medio de transmisión. En las redes inalámbricas, **las ondas electromagnéticas atraviesan paredes y ventanas**, alcanzando aceras, aparcamientos y edificios colindantes. Cualquier persona con un portátil o móvil dentro del radio de cobertura puede interceptar tramas o intentar asociarse.

Por ello, la seguridad en redes WLAN debe basarse en mecanismos criptográficos robustos de **autenticación** (verificar la identidad de la estación) y **cifrado** (proteger la confidencialidad e integridad de la carga útil).

---

## 🛡️ 2. Evolución de los Protocolos de Cifrado y Autenticación

| Protocolo | Año | Cifrado | Integridad | Nivel de Seguridad Actual |
| :--- | :---: | :---: | :---: | :--- |
| **WEP (Wired Equivalent Privacy)** | 1999 | RC4 (clave fija de 64/128 bits) | CRC-32 | **TOTALMENTE INSEGURO Y OBSOLETO**. Vulnerable por vectores de inicialización (IV) repetidos; se descifra en segundos. |
| **WPA (Wi-Fi Protected Access)** | 2003 | RC4 dinámico con TKIP | MIC (Michael) | **OBSOLETO**. Parche temporal para actualizar hardware WEP antiguo; TKIP demostró vulnerabilidades. |
| **WPA2 (IEEE 802.11i)** | 2004 | **AES (CCMP - 128 bits)** | CBC-MAC | **ESTÁNDAR GENERALIZADO ROBUSTO**. Cifrado de bloque simétrico militar; vulnerable a ataques de fuerza bruta si la clave PSK es débil o mediante KRACK si no está parcheado. |
| **WPA3** | 2018 | AES-GCM (128/192 bits) | GMAC | **MÁXIMA SEGURIDAD ACTUAL**. Obliga a cifrado de tramas de gestión (PMF), elimina WEP/TKIP e introduce autenticación SAE. |

---

## 🔑 3. Modos de Autenticación: Personal frente a Enterprise

### 1. Modo Personal (WPA2 / WPA3-Personal - PSK)
- Basado en una **Clave Precompartida (Pre-Shared Key - PSK)**: Todos los usuarios y dispositivos utilizan exactamente la misma contraseña para conectarse.
- **En WPA2**: El protocolo realiza el saludo de 4 vías (**4-Way Handshake**). Si un atacante captura este saludo en el aire, puede lanzar un ataque de diccionario fuera de línea (*offline brute-force*) sin interactuar con el router.
- **En WPA3**: Se sustituye el PSK por **SAE (Simultaneous Authentication of Equals)**: Protege contra ataques de diccionario fuera de línea y ofrece confidencialidad directa (*forward secrecy*).

### 2. Modo Corporativo (WPA2 / WPA3-Enterprise - 802.1X)
- Cada usuario se autentica con sus **propias credenciales individuales** (usuario y contraseña de Active Directory/LDAP o certificado digital).
- **Arquitectura de 3 elementos**:
  1. **Suplicante (Supplicant)**: Proceso cliente en el equipo o móvil del usuario.
  2. **Autenticador (Authenticator)**: El Punto de Acceso (AP) o switch. Bloquea todo el tráfico de datos hasta que el usuario se autentica.
  3. **Servidor de Autenticación**: Servidor centralizado **RADIUS** (ej. FreeRADIUS, Microsoft NPS), que valida las credenciales contra la base de datos corporativa.

---

## 🚫 4. Técnicas Ineficaces de "Falsa Seguridad"

1. **Filtrado por dirección MAC**: Crear una lista blanca de direcciones MAC permitidas en el AP. **Ineficaz**: Las direcciones MAC de los clientes legítimos viajan en texto plano por el aire sin cifrar en cada trama; cualquier atacante puede clonar una MAC autorizada (*MAC spoofing*) en 10 segundos.
2. **Ocultar el SSID (SSID Cloaking)**: Como se vio en la UT anterior, el nombre de la red se transmite en claro en tramas de asociación.
3. **Desactivar el DHCP**: Obligar a configurar IP fija sólo retrasa unos segundos a quien monitorice el tráfico con Wireshark y deduzca la subred activa.

---

## ⚠️ Errores Comunes y Puntos Clave en Taller
- **Vulnerabilidad de WPS (Wi-Fi Protected Setup)**: El sistema del botón físico o PIN de 8 dígitos para conectar impresoras o móviles fácilmente debe **desactivarse siempre en entornos profesionales**. Su diseño permite ataques de fuerza bruta que extraen la contraseña WPA2 en pocas horas.
- **Aislamiento de Clientes (Client Isolation / AP Isolation)**: Función vital en redes Wi-Fi públicas o de invitados que impide que dos clientes conectados a la misma red inalámbrica puedan verse, escanearse o atacarse entre sí.
