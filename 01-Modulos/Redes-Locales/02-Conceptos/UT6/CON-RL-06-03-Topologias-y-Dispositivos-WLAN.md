---
tipo: concepto
modulo: "Redes Locales"
ud: "UD06"
ra_asociados: ["RA3"]
tags: [concepto, redes, wlan, ap, bss, ess, ssid, bssid, ad-hoc]
dificultad: basica
estado: revisado
---

# 💡 Concepto: Topologías y Dispositivos en Redes WLAN (BSS, ESS, SSID)

> **Módulo**: [[MOC-Redes-Locales|Redes Locales]] | **UD**: [[UD06-Redes-Inalambricas-Mixtas|UD06]] | **RA**: [[RA03-Configuracion-Conmutadores-Routers|RA3]]

---

## 📌 1. Concepto Fundamental
Las redes de área local inalámbricas (WLAN) organizan sus dispositivos y enlaces lógicos en dos modos arquitectónicos estandarizados por IEEE 802.11:

### 1. Modo Ad-Hoc (IBSS - Independent Basic Service Set)
- Red entre iguales (*peer-to-peer*) sin punto de acceso central.
- Los ordenadores y móviles con adaptadores Wi-Fi se comunican directamente unos con otros dentro de su alcance mutuo.
- Útil para transferencias puntuales directas (ej. AirDrop, Wi-Fi Direct).

### 2. Modo Infraestructura (BSS / ESS)
- Modo estándar corporativo y doméstico. Todos los clientes inalámbricos (**STA - Stations**) se asocian y comunican exclusivamente a través de un dispositivo central denominado **Punto de Acceso (AP - Access Point)**.
- Dos clientes no pueden hablar directamente entre sí: el tráfico viaja siempre de la estación al AP y el AP lo retransmite al destinatario.

---

## 🏗️ 2. Estructura Jerárquica: BSS, ESS y Sistema de Distribución (DS)

```text
[ Celda BSS 1 ]                             [ Celda BSS 2 ]
(Canal 1 - SSID: CIFP-WiFi)                  (Canal 6 - SSID: CIFP-WiFi)
      PC1 ──► [ AP 1 ]                             PC2 ──► [ AP 2 ]
                 │                                            │
                 └──────► [ Sistema de Distribución (DS) ] ◄──┘
                            (Switch Ethernet Cableado)
```

1. **BSS (Basic Service Set)**:
   - Conjunto formado por un único Punto de Acceso y todos los clientes inalámbricos asociados a él bajo su área de cobertura física (**BSA - Basic Service Area** o celda).
   - Identificado por el **BSSID (Basic Service Set Identifier)**: Es la dirección física **MAC de 48 bits** de la radio del punto de acceso.
2. **DS (Distribution System)**:
   - Medio físico de interconexión (generalmente la red cableada Ethernet mediante switches) que une varios puntos de acceso entre sí.
3. **ESS (Extended Service Set)**:
   - Unión lógica de dos o más celdas BSS interconectadas a través de un DS común compartiendo el mismo nombre de red (**SSID**).
   - Permite a los usuarios desplazarse libremente por un edificio de varias plantas o un campus entero manteniendo la conexión activa de forma ininterrumpida (**Roaming o Itinerancia**).
4. **SSID (Service Set Identifier)**:
   - Nombre alfanumérico visible de la red inalámbrica (hasta 32 caracteres, sensible a mayúsculas y minúsculas).
   - Los APs emiten periódicamente tramas de baliza (**Beacon Frames**) anunciando su SSID, salvo que el administrador active la opción de ocultarlo (*SSID broadcast disabled*).

---

## 🖲️ 3. Dispositivos Activos Inalámbricos

- **Punto de Acceso Autónomo (Standalone / Fat AP)**: Equipo que incluye toda la lógica de gestión, VLANs, filtrado y seguridad en su propio software local. Típico de pequeñas instalaciones.
- **Punto de Acceso Gestionado por Controladora (Lightweight / Thin AP)**: Los APs son equipos ligeros de radio que se configuran y coordinan centralizadamente desde una controladora hardware o en la nube (**WLC - Wireless LAN Controller**). Estándar en centros educativos y empresas.
- **Repetidor / Extensor de Rango (Range Extender)**: Recibe la señal Wi-Fi de un AP y la retransmite en la misma frecuencia para llegar más lejos. **Inconveniente**: Reduce a la mitad el rendimiento disponible en la celda repetida.
- **Redes Mesh (Wi-Fi en Malla)**: Varios nodos inalámbricos inteligentes conectados entre sí mediante un canal de retorno dedicado (*backhaul*), optimizando las rutas de salto dinámicamente.

---

## ⚠️ Errores Comunes y Puntos Clave en Taller
- **Creer que ocultar el SSID hace la red "invisible e invulnerable"**: Ocultar el SSID sólo evita que aparezca en el menú desplegable del móvil del usuario común. Cualquier escáner de redes básico o analizador Wireshark revela el SSID oculto en cuanto un cliente legítimo se asocia o envía una trama de prueba (*Probe Request*).
- **Roaming deficiente por falta de solapamiento**: Para que el *roaming* funcione con fluidez, las celdas contiguas deben solaparse físicamente entre un **15% y un 20%** de su cobertura.
