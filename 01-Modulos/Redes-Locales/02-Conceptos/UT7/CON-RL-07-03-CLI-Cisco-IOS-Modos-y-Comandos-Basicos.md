---
tipo: concepto
modulo: "Redes Locales"
ud: "UD07"
ra_asociados: ["RA3"]
tags: [concepto, redes, cisco, ios, cli, comandos, modos]
dificultad: basica
estado: revisado
---

# 💡 Concepto: CLI de Cisco IOS. Modos de Operación y Comandos Esenciales

> **Módulo**: [[MOC-Redes-Locales|Redes Locales]] | **UD**: [[UD07-Interconexion-Configuracion-Equipos-Redes-Locales|UD07]] | **RA**: [[RA03-Configuracion-Conmutadores-Routers|RA3]]

---

## 📌 1. Concepto Fundamental
El sistema operativo de los conmutadores y encaminadores de Cisco se denomina **Cisco IOS (Internetwork Operating System)**. Su administración profesional se lleva a cabo mediante una interfaz de línea de comandos (**CLI - Command Line Interface**) estructurada en una estricta jerarquía de modos de acceso.

Cada modo se reconoce por el **símbolo del indicador de comandos (prompt)** y desbloquea un conjunto específico de comandos y privilegios.

---

## 🪜 2. Jerarquía de Modos de Cisco IOS

```text
Modo Usuario:           Switch>
                           │  (comando: enable)
                           ▼
Modo Privilegiado:      Switch#
                           │  (comando: configure terminal)
                           ▼
Configuración Global:   Switch(config)#
                           ├── interface f0/1  ──► Switch(config-if)#       (Modo Interfaz)
                           ├── line console 0  ──► Switch(config-line)#     (Modo Línea)
                           ├── vlan 10         ──► Switch(config-vlan)#     (Modo VLAN)
                           └── router ospf 1   ──► Switch(config-router)#   (Modo Enrutador)
```

| Modo de Operación | Prompt Típico | Cómo Entrar | Cómo Salir | Qué se puede hacer |
| :--- | :--- | :--- | :--- | :--- |
| **Usuario EXEC** | `Switch>` | Al conectar por consola o Telnet/SSH | `exit` | Consultas muy básicas, pruebas de ping. No permite modificar nada. |
| **Privilegiado EXEC (Enable)** | `Switch#` | `enable` (pide contraseña) | `disable` o `exit` | Ver la configuración completa (`show`), reiniciar (`reload`), guardar (`write`, `copy`). |
| **Configuración Global** | `Switch(config)#` | `configure terminal` | `exit` o `end` / `Ctrl+Z` | Cambiar parámetros globales del equipo (nombre, banners, crear VLANs). |
| **Configuración de Interfaz** | `Switch(config-if)#` | `interface <nombre>` | `exit` | Asignar IP, velocidad, modo trunk/access o encender puertos (`no shutdown`). |
| **Configuración de Línea** | `Switch(config-line)#` | `line console 0` o `line vty 0 4` | `exit` | Configurar contraseñas y accesos a la consola física o sesiones remotas. |

---

## ⌨️ 3. Teclas Rápidas y Comandos de Consulta

### Teclas Especiales en la Consola IOS
- **`?` (Interrogación)**: Ayuda contextual en tiempo real. Muestra todos los comandos disponibles en el modo actual o los parámetros que pueden seguir a una palabra.
- **Tabulador (`Tab`)**: Autocompleta el comando tras escribir los primeros caracteres unívocos.
- **Flechas Arriba / Abajo**: Navega por el historial de comandos ejecutados en la sesión.
- **`Ctrl + C` o `Ctrl + Z` / comando `end`**: Vuelve de inmediato al Modo Privilegiado `Switch#` desde cualquier submodo de configuración profunda.

### Comandos de Diagnóstico y Consulta Más Usados
```text
:: Ver la configuración activa actual en memoria RAM
Switch# show running-config

:: Ver la configuración persistente guardada en memoria NVRAM
Switch# show startup-config

:: Resumen rápido del estado y direcciones IP de todas las interfaces
Switch# show ip interface brief

:: Ver las VLANs existentes y qué puertos tienen asignados
Switch# show vlan brief

:: Ver la tabla de direcciones MAC aprendidas
Switch# show mac address-table

:: Ver el estado de las interfaces troncales
Switch# show interfaces trunk
```

---

## ⚠️ Errores Comunes y Puntos Clave en Taller
- **Diferencia entre `exit` y `end`**: `exit` retrocede un único nivel hacia atrás en el árbol jerárquico; `end` (o `Ctrl+Z`) salta directamente al modo privilegiado `#`.
- **Escribir comandos `show` dentro de modos de configuración**: En `Switch(config-if)#`, si escribes `show ip interface brief`, dará error de sintaxis; debes anteponer la palabra **`do`** (ejemplo: `do show ip interface brief`).
