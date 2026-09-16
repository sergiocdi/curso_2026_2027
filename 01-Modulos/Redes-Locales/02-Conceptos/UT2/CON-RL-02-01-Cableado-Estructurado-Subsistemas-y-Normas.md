---
tipo: concepto
modulo: "Redes Locales"
ud: "UD02"
ra_asociados: ["RA1", "RA2"]
tags: [concepto, redes, cableado-estructurado, normas, tia568, subsistemas]
dificultad: intermedia
estado: revisado
---

# 💡 Concepto: Cableado Estructurado, Subsistemas y Normativa

> **Módulo**: [[MOC-Redes-Locales|Redes Locales]] | **UD**: [[UD02-Elementos-Espacios-Fisicos-Red-Local|UD02]] | **RA**: [[RA02-Medios-Transmision-Cableado|RA2]]

---

## 📌 1. Concepto Fundamental
El **Cableado Estructurado** es una metodología normalizada de diseño e instalación de la infraestructura física de telecomunicaciones en edificios, de manera independiente a las aplicaciones informáticas o telefónicas concretas que soporte. Permite transportar voz, datos, vídeo y señales de control mediante una topología en estrella jerárquica fácilmente ampliable y mantenible.

### Normativa Internacional de Referencia
- **ANSI/TIA-568**: Estándar estadounidense para cableado de telecomunicaciones en edificios comerciales.
- **ISO/IEC 11801**: Estándar internacional para cableado genérico de tecnologías de la información.
- **EN 50173**: Norma europea equivalente para sistemas de cableado.

---

## 🏗️ 2. Los Seis Subsistemas del Cableado Estructurado

```text
[ Entrada de Servicios / Acometida ]
               │
[ Sala de Equipamiento Principal (ER / MDF) ]
               │ (Backbone Vertical / Fibra Óptica)
[ Cuarto de Telecomunicaciones de Planta (TR / IDF) ]
               │ (Cableado Horizontal / UTP máx 90m)
[ Área de Trabajo (Roseta / Keystone RJ-45) ]
               │ (Latiguillo máx 5m)
           [ PC / Host ]
```

1. **Área de Trabajo (Work Area - WA)**: Espacio donde el usuario conecta sus terminales (PCs, teléfonos IP, impresoras). Comprende la toma de pared (roseta keystone RJ-45) y el latiguillo del equipo (**máx. 5 m**).
2. **Cableado Horizontal**: Tendido de cables que va desde el panel de parcheo (*patch panel*) en el cuarto de telecomunicaciones de planta hasta la roseta del área de trabajo. 
   - La distancia máxima del cable horizontal continuo es de **90 metros**.
   - Con los latiguillos en ambos extremos (5 m en el rack + 5 m en el área de trabajo), la longitud total del canal (**Channel**) nunca debe superar los **100 metros**.
3. **Cuarto de Telecomunicaciones (Telecommunications Room - TR / IDF)**: Espacio técnico en cada planta que aloja los armarios rack distribuidores de planta, paneles de parcheo y switches de acceso.
4. **Cableado Troncal o Vertical (Backbone)**: Proporciona las interconexiones entre el cuarto de equipamiento principal, las entradas de servicios y los cuartos de telecomunicaciones de las distintas plantas. Se suele implementar con fibra óptica o cable multipar de alta capacidad.
5. **Sala de Equipamiento Principal (Equipment Room - ER / MDF)**: Sala técnica central donde se ubican los servidores corporativos, matrices de conmutación principales (Core switches), PBX telefónica y routers de salida.
6. **Entrada de Servicios / Instalación de Entrada (Entrance Facility - EF)**: Punto de acometida donde penetran los cables de los operadores públicos de telecomunicaciones y finaliza la responsabilidad de la compañía suministradora.

---

## ⚠️ Errores Comunes y Puntos Clave en Taller
- **Superar los 100 metros en Ethernet de cobre**: Superar 90 m de horizontal o 100 m totales de canal provoca degradación de la señal (*atenuación*) y fallos en la sincronización de trama.
- **Tender cable horizontal empalmando trozos**: En cableado estructurado está terminantemente prohibido empalmar cables. Cada tirada horizontal debe ser un cable continuo e ininterrumpido desde el patch panel hasta la roseta.
- **Radio de curvatura**: Doblar un cable de par trenzado en un ángulo cerrado rompe el trenzado interno y destruye la certificación por diafonía (NEXT).
