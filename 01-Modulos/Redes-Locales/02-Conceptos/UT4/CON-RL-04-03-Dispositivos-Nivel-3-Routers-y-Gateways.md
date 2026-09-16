---
tipo: concepto
modulo: "Redes Locales"
ud: "UD04"
ra_asociados: ["RA1", "RA3"]
tags: [concepto, redes, nivel-3, router, gateway, enrutamiento, nat]
dificultad: intermedia
estado: revisado
---

# 💡 Concepto: Dispositivos de Nivel 3. Enrutadores (Routers) y Pasarelas

> **Módulo**: [[MOC-Redes-Locales|Redes Locales]] | **UD**: [[UD04-Adaptadores-Dispositivos-Interconexion-Simulacion|UD04]] | **RA**: [[RA01-Arquitectura-Redes|RA1]], [[RA03-Configuracion-Conmutadores-Routers|RA3]]

---

## 📌 1. Concepto Fundamental
Un **Enrutador o Router** es un dispositivo de **Nivel 3 (Capa de Red)** encargado de interconectar dos o más redes lógicas diferentes e independientes (por ejemplo, la subred del aula con Internet, o la red de administración con la de alumnos).

A diferencia del switch (que conmuta dentro de una misma subred mediante direcciones MAC), el router examina la dirección **IP de destino** contenida en la cabecera de los paquetes y determina la mejor ruta de salida consultando su **Tabla de Enrutamiento (Routing Table)**.

---

## 🧭 2. Funciones Clave del Router

1. **Determinación de Rutas (Routing)**:
   - Consulta su tabla de enrutamiento para decidir a través de qué interfaz física y hacia qué "siguiente salto" (*next hop*) debe reenviar cada paquete.
   - Las rutas pueden ser **Directamente Conectadas** (las interfaces locales del propio router), **Estáticas** (configuradas manualmente por el administrador) o **Dinámicas** (aprendidas mediante protocolos de encaminamiento como OSPF, RIP o BGP).
2. **Reenvío de Paquetes (Packet Forwarding)**:
   - Recibe la trama por una interfaz física, elimina la cabecera/cola de enlace (desencapsula de Capa 2), comprueba la IP de destino en Capa 3, decrementa el **TTL (Time to Live)** en 1 (descartándolo si llega a 0 para evitar bucles infinitos), y vuelve a encapsular el paquete en una **nueva trama** adaptada al siguiente medio de transmisión.
3. **Aislamiento de Dominios de Difusión (Broadcast)**:
   - **Regla de oro de redes**: Los routers **NUNCA propagan paquetes de difusión (broadcast)** por defecto. Separan físicamente los dominios de difusión.
4. **Traducción de Direcciones de Red (NAT / PAT)**:
   - Permite que cientos de equipos con direcciones IP privadas (ej. `192.168.1.0/24`) compartan una única dirección IP pública enrutable en Internet.
5. **Puerta de Enlace Predeterminada (Default Gateway)**:
   - Es la dirección IP de la interfaz del router a la que un equipo final envía todo el tráfico destinado a cualquier red que no pertenezca a su propia subred local.

---

## 🔀 3. Conmutador de Capa 3 (Switch Multicapa)
En grandes redes corporativas, la función de enrutamiento a alta velocidad se realiza mediante **Switches de Capa 3**:
- Combinan la velocidad de conmutación de tramas por hardware ASIC con la capacidad de enrutar paquetes IP entre distintas VLANs internas sin necesidad de enviar el tráfico a un router externo.

---

## ⚠️ Errores Comunes y Puntos Clave en Taller
- **Confundir la IP del router con la IP del Gateway del PC**: La puerta de enlace de un PC debe ser obligatoriamente una dirección IP que pertenezca a **su misma subred** (la IP de la interfaz del router que mira hacia ese switch).
- **El router de casa (dispositivo "todo en uno")**: El aparato doméstico del operador suele integrar 4 dispositivos en una sola caja: un módem de fibra (ONT), un router de Capa 3, un switch de 4 puertos y un punto de acceso Wi-Fi. En el taller de redes se estudian y configuran como componentes separados e independientes.
