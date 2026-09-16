---
tipo: concepto
modulo: "Redes Locales"
ud: "UD01"
ra_asociados: ["RA1"]
tags: [concepto, redes, topologia, estrella, bus, anillo, malla, arbol, mixta]
dificultad: basica
estado: revisado
---

# 💡 Concepto: Topologías de Red Físicas, Lógicas y Mixtas

> **Módulo**: [[MOC-Redes-Locales|Redes Locales]] | **UD**: [[UD01-Introduccion-Redes-Locales-Caracterizacion|UD01]] | **RA**: [[RA01-Arquitectura-Redes|RA1]]

---

## 📌 1. Concepto Fundamental: Topología Física vs Lógica
La topología define la estructura organizativa de los nodos y enlaces de una red:
- **Topología Física**: Disposición espacial geométrica real del cableado y de los dispositivos en el edificio.
- **Topología Lógica**: Camino y método mediante el cual las tramas de datos viajan entre los nodos, con independencia del tendido físico del cable.

---

## 📐 2. Catálogo de Topologías Físicas

### 1. Topología en Estrella (Estándar Absoluto en LAN Actual)
- Todos los puestos de trabajo se conectan de forma radial e independiente a un nodo central de conmutación (**Switch** o **Hub**).
- **Ventajas**:
  - Máxima facilidad de ampliación y mantenimiento: conectar o desconectar un equipo no afecta al resto.
  - Gran tolerancia a fallos de enlace: si un cable se rompe, solo se aísla ese equipo concreto.
  - Sencillez en la detección de averías y monitorización por puerto.
- **Inconvenientes**:
  - Si falla el nodo central (switch), toda la red queda inoperativa (punto único de fallo).
  - Requiere mayor cantidad de cable individual que un bus troncal.

### 2. Topología de Bus
- Todos los equipos se conectan a un único cable troncal compartido continuo (*backbone* coaxial clásico).
- **Ventajas**: Muy bajo coste y sencillez de despliegue inicial.
- **Inconvenientes**:
  - Requiere **terminadores resistivos de 50 $\Omega$** en ambos extremos para absorber las ondas y evitar reflexiones.
  - **Fragilidad extrema**: Una rotura o corte en cualquier punto del cable troncal interrumpe la impedancia y hace caer la red entera.
  - Muy difícil localización de averías y congestión por colisiones.

### 3. Topología en Anillo
- Cada equipo se conecta a otros dos formando un bucle cerrado continuo en círculo. La información circula secuencialmente en un único sentido de nodo en nodo (ej. *Token Ring* de IBM).
- **Ventajas**: Tráfico predecible sin colisiones mediante paso de testigo (*token*).
- **Inconvenientes**: Si un nodo o enlace se desconecta, se interrumpe el anillo completo, a menos que se disponga de un anillo doble redundante (como FDDI).

### 4. Topología en Malla (*Mesh*)
- Cada nodo está interconectado con uno o varios nodos mediante enlaces punto a punto directos.
- **Malla Completa**: Todos los nodos están conectados entre sí. Para $N$ nodos se requieren:
  $$	ext{Número de enlaces} = rac{N(N - 1)}{2}$$
- **Ventajas**: Tolerancia a fallos absoluta y máxima robustez; siempre existen rutas alternativas.
- **Inconvenientes**: Elevadísimo coste de cableado, interfaces físicas y complejidad de configuración. Usada en núcleos troncales (*backbones*) y centros de datos de misión crítica.

### 5. Topología en Árbol (Jerárquica)
- Organización jerárquica ramificada en niveles. La raíz o núcleo central suele ser un switch o router de alta capacidad (*Core*), del que cuelgan switches de distribución y switches de acceso a puestos.
- **Ventajas**: Escalabilidad excelente para centros educativos y empresas multinivel.

### 6. Topologías Mixtas o Híbridas
- Combinación de dos o más topologías diferentes en distintas zonas de la infraestructura (ej. anillo de fibra en el backbone del campus y estrellas de par trenzado en cada aula o planta).

---

## 🔄 3. El Caso Clásico: Estrella Física con Bus Lógico
- **Con Hub (Concentrador antiguo)**: Físicamente los cables van de cada PC al hub en **estrella**. Lógicamente, el circuito interno del hub puentea todos los cables en un **bus compartido**: una trama emitida sale por todos los puertos a la vez y colisiona si dos PCs emiten al unísono.
- **Con Switch (Conmutador moderno)**: Físicamente es en **estrella**. Lógicamente es una **red conmutada punto a punto**: el switch analiza la MAC de destino y conmuta la trama únicamente hacia el puerto del destinatario, eliminando colisiones en enlaces *full-duplex*.

---

## ⚠️ Errores Comunes y Puntos Clave en Taller
- **La canaleta no define la topología**: Que los cables de un aula corran juntos por una canaleta a lo largo de la pared no significa que sea un bus; si cada cable va individualmente al switch del rack, la topología es **estrella**.
- **Cálculo de enlaces en malla**: Pregunta clásica de examen: *"¿Cuántos cables se necesitan para unir 6 routers en malla completa?"* $ightarrow rac{6 	imes 5}{2} = 15$ cables.\n