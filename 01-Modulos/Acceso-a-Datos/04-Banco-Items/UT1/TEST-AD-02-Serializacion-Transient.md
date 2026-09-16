---
tipo: item_evaluacion
subtipo: test
modulo: "Acceso a Datos"
ud: "UD01"
ra_asociados: ["RA1"]
ce_asociados: ["CE1.d"]
dificultad: media
estado: validada
correcta: "C"
---

# ❓ Test: Modificador transient en Serialización

> **Módulo**: Acceso a Datos | **UD**: UD01 | **RA**: RA1 | **CE**: CE1.d | **Dificultad**: Media

### Enunciado:
En una clase que implementa la interfaz `Serializable`, ¿qué efecto produce marcar un atributo con la palabra reservada `transient`?

### Opciones:
- [ ] A) El atributo se encripta con algoritmo AES antes de escribirse en el flujo binario.
- [ ] B) El atributo se convierte en una constante de solo lectura inmutable.
- [x] C) El valor de dicho atributo es omitido durante la serialización y no se persiste en el flujo de salida. *(Correcta)*
- [ ] D) Provoca una excepción `NotSerializableException` en tiempo de compilación.

---

### 💡 Justificación:
- **Opción C correcta**: Los campos marcados como `transient` se ignoran en el guardado de estado del objeto (útil para contraseñas, punteros a recursos del SO, sockets o claves de sesión).
