---
tipo: concepto
modulo: "Redes Locales"
ud: "UD07"
ra_asociados: ["RA3"]
tags: [concepto, redes, cisco, seguridad, switch, svi, contrasenas, banner]
dificultad: intermedia
estado: revisado
---

# 💡 Concepto: Configuración de Seguridad Básica y Gestión en Switches Cisco

> **Módulo**: [[MOC-Redes-Locales|Redes Locales]] | **UD**: [[UD07-Interconexion-Configuracion-Equipos-Redes-Locales|UD07]] | **RA**: [[RA03-Configuracion-Conmutadores-Routers|RA3]]

---

## 📌 1. Concepto Fundamental
Un conmutador recién sacado de su embalaje o restaurado de fábrica carece de contraseñas de protección, no tiene nombre distintivo y no dispone de dirección IP para ser administrado de forma remota a través de la red.

El protocolo de aseguramiento inicial de cualquier dispositivo Cisco exige aplicar una plantilla estándar de configuración que incluya: identificación, protección de accesos locales y remotos, cifrado de claves en texto plano, aviso legal y una **interfaz virtual de switch (SVI)** para gestión por red.

---

## 💻 2. Guion Completo de Configuración Paso a Paso

### 1. Nombre del Dispositivo (Hostname)
```text
Switch> enable
Switch# configure terminal
Switch(config)# hostname SW-AULA-102
SW-AULA-102(config)#
```

### 2. Proteger el Acceso al Modo Privilegiado (Enable Secret)
```text
:: Utilizar siempre 'secret' (aplica hash criptográfico MD5/SHA-256), NUNCA 'password'
SW-AULA-102(config)# enable secret cisco123
```

### 3. Proteger la Consola Física (Puerto Serie/USB)
```text
SW-AULA-102(config)# line console 0
SW-AULA-102(config-line)# password ciscoconsole
SW-AULA-102(config-line)# login
:: Evitar que los mensajes de log corten lo que estás escribiendo
SW-AULA-102(config-line)# logging synchronous
SW-AULA-102(config-line)# exit
```

### 4. Proteger las Líneas de Acceso Remoto VTY (Telnet / SSH)
```text
SW-AULA-102(config)# line vty 0 15
SW-AULA-102(config-line)# password ciscovty
SW-AULA-102(config-line)# login
SW-AULA-102(config-line)# logging synchronous
SW-AULA-102(config-line)# exit
```

### 5. Cifrado Global de Contraseñas Débiles y Mensaje Legal (Banner)
```text
:: Cifra las contraseñas de consola y vty para que no se lean en texto plano al hacer 'show run'
SW-AULA-102(config)# service password-encryption

:: Mensaje legal disuasorio obligatorio en auditorías de seguridad
SW-AULA-102(config)# banner motd # ACCESO RESTRINGIDO EXCLUSIVAMENTE A PERSONAL AUTORIZADO DEL CIFP #
```

### 6. Configurar la IP de Gestión (SVI) y Puerta de Enlace
Para poder acceder al switch por red mediante SSH/Telnet o responder a pings de diagnóstico, se asigna una IP lógica a una interfaz virtual:
```text
SW-AULA-102(config)# interface vlan 1
SW-AULA-102(config-if)# ip address 192.168.1.2 255.255.255.0
SW-AULA-102(config-if)# no shutdown
SW-AULA-102(config-if)# exit

:: Configurar el router por el que el switch puede ser alcanzado desde fuera de su subred
SW-AULA-102(config)# ip default-gateway 192.168.1.1
```

---

## 💾 3. Guardado Persistente en Memoria NVRAM

Toda la configuración introducida vive en la memoria **RAM volátil (`running-config`)**. Si el switch se apaga o sufre un corte eléctrico, **se perderá todo**.
Para hacer los cambios definitivos guardándolos en la **NVRAM no volátil (`startup-config`)**:

```text
SW-AULA-102# copy running-config startup-config
Destination filename [startup-config]? <ENTER>
[OK]

:: O el comando clásico equivalente más rápido:
SW-AULA-102# write
Building configuration...
[OK]
```

---

## ⚠️ Errores Comunes y Puntos Clave en Taller
- **Olvidar guardar antes de apagar**: Es la queja más frecuente en el taller de redes: montar una práctica de 2 horas, apagar el rack y descubrir al día siguiente que el switch vuelve a llamarse `Switch>`. ¡Ejecutar siempre `write` al terminar!
- **Diferencia entre `enable password` y `enable secret`**: `enable password` almacena la clave en claro; `enable secret` la cifra mediante un algoritmo hash irreversible. Si ambas están configuradas, IOS siempre da prioridad a `enable secret`.
