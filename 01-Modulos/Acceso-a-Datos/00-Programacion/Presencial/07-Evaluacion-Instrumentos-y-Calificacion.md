---
tipo: apartado_programacion
modulo: "Acceso a Datos"
modalidad: "Presencial"
apartado_num: "07"
titulo: "Evaluación, Instrumentos y Criterios de Calificación Presencial"
---

# 7. Evaluación y Calificación Presencial

## 7.1. Estructura de Calificación Final (60% / 40%)

$$\text{Nota Final} = 0.60 \cdot \text{Nota 1ª Evaluación} + 0.40 \cdot \text{Nota 2ª Evaluación}$$

> [!IMPORTANT]
> **Condición indispensable e innegociable de superación**:
> Para aprobar el módulo es **estrictamente obligatorio obtener una calificación igual o superior a 5.0 en AMBAS evaluaciones de forma independiente**:
> $$\text{Nota 1ª Evaluación} \ge 5.0 \quad \text{y} \quad \text{Nota 2ª Evaluación} \ge 5.0$$
> Si alguna parte no alcanza el 5.0, el módulo quedará suspenso y deberá recuperarse la parte suspensa.

---

## 7.2. Instrumentos de Calificación de la 1ª Evaluación (60%)
- **Exámenes Prácticos de Evaluación (100% de la 1ª Eval)**:
  - Pruebas en el ordenador en el aula de informática C210, en entorno controlado y sin acceso a internet ni a herramientas de Inteligencia Artificial.
  - **Enfoque Práctico de los Contenidos**: Los exámenes son de carácter **eminentemente práctico**. No se realizan pruebas memorísticas ni teóricas puras: la teoría es indispensable conocerla y dominarla, pero **se evalúa siempre de manera aplicada** a través de la codificación y resolución de supuestos técnicos reales de acceso a datos en Java (manejo seguro de streams NIO.2, transacciones JDBC con rollback ante fallos, consultas JPQL y operaciones BSON en MongoDB).
  - **Criterios Técnicos**: Código limpio y funcional, gestión robusta de excepciones, cierre eficiente de conexiones/recursos y cumplimiento de patrones arquitectónicos.
- **Prácticas por UT**: Formativas y de afianzamiento (no computan numéricamente; no se recomienda el uso de IA para consolidar la destreza individual).

---

## 7.3. Instrumentos de Calificación de la 2ª Evaluación (40%)
- **Capa de Persistencia y Acceso a Datos del Proyecto Intermodular Individual**:
  - **Arquitectura y Calidad Técnica de Datos (50%)**: Estructura DAO/JPA, transacciones, manejo de excepciones y conexión a motores BBDD.
  - **Funcionalidad CRUD y Persistencia Políglota (30%)**: Operaciones completas SQL + NoSQL y gestión de ficheros.
  - **Repositorio Git, Memoria y Defensa Individual en Aula (20%)**: Justificación oral en directo ante el docente de todas las decisiones técnicas tomadas. El uso de herramientas de IA está permitido durante el desarrollo del proyecto, pero el docente podrá exigir explicaciones exhaustivas o modificaciones en vivo para certificar que el alumno comprende y domina todo el código entregado.
