---
tipo: recurso_externo
modulo: "{{modulo}}"
ud: "{{ud}}"
titulo_recurso: "{{title}}"
formato: maquina_virtual # maquina_virtual | dataset | video | repo_github | iso | zip
tamano_aprox: "4.5 GB"
fecha_subida: "{{date}}"
enlace_onedrive_drive: "https://..."
enlace_moodle_aula: "https://aulavirtual..."
hash_sha256: ""
---

# 📦 Recurso Externo: {{title}}

> **Módulo**: `{{modulo}}` | **Unidad**: `{{ud}}` | **Formato**: `{{formato}}` | **Tamaño**: `{{tamano_aprox}}`

---

## 🔗 Enlaces de Acceso y Descarga
- 📥 **Descarga Directa (Nube del Centro / Drive / OneDrive)**: [Enlace de Descarga]({{enlace_onedrive_drive}})
- 🏫 **Enlace en Aula Virtual (Moodle / Aules)**: [Ficha en Moodle]({{enlace_moodle_aula}})
- 🐙 **Repositorio de Código (si aplica)**: [GitHub / GitLab](https://...)

---

## 📋 Descripción del Recurso
<!-- Describe qué contiene el archivo pesado (ej: Máquina virtual con Debian 12 preconfigurada con Bind9 e ISC DHCP Server) -->

---

## ⚙️ Instrucciones de Instalación / Importación para el Alumnado
1. Descargar el archivo `.ova` / `.zip` desde el enlace superior.
2. Comprobar checksum SHA256 si es necesario.
3. Importar en VirtualBox / VMware Workstation.
4. **Credenciales por defecto**:
   - Usuario: `alumno` / Contraseña: `fp`
   - Superusuario: `root` / Contraseña: `root`
