---
tipo: recurso_externo
modulo: "Acceso a Datos"
ud: "UD02"
titulo_recurso: "Máquina Virtual Ubuntu Server con PostgreSQL 16 y Docker"
formato: maquina_virtual
tamano_aprox: "4.8 GB"
fecha_subida: "2026-09-01"
enlace_onedrive_drive: "https://onedrive.live.com/?id=DAM2_ACCESO_DATOS_MV_POSTGRES_V1.ova"
enlace_moodle_aula: "https://aulavirtual.centro.edu/mod/resource/view.php?id=8042"
hash_sha256: "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
---

# 📦 Recurso Pesado: Máquina Virtual para Prácticas de BBDD

> **Módulo**: [[MOC-Acceso-a-Datos\|Acceso a Datos]] | **UD**: [[UD02-Conectores-BBDD-Relacionales\|UD02]] | **Formato**: OVA | **Tamaño**: 4.8 GB

---

## 🔗 Enlaces de Acceso y Descarga
- 📥 **Nube del Centro (OneDrive / Google Drive)**: [Descargar Imagen OVA (4.8 GB)](https://onedrive.live.com/?id=DAM2_ACCESO_DATOS_MV_POSTGRES_V1.ova)
- 🏫 **Ficha en el Aula Virtual Moodle**: [Acceso en Moodle (Matriculados)](https://aulavirtual.centro.edu/mod/resource/view.php?id=8042)

---

## 📋 Software Preinstalado en la Imagen
- **SO**: Ubuntu Server 24.04 LTS (sin entorno gráfico para máximo rendimiento y bajo consumo de RAM).
- **PostgreSQL 16**: Escuchando en el puerto `5432` con usuario `dam2_user` (clave: `dam2_pass`) y base de datos preconfigurada `empresa_db`.
- **Docker & Docker Compose**: Configurado para levantar instancias instantáneas de MongoDB y Redis con un comando `docker compose up -d`.

---

## ⚙️ Instrucciones de Importación (VirtualBox / VMware)
1. Descargar el archivo `DAM2_ACCESO_DATOS_MV_POSTGRES_V1.ova`.
2. En VirtualBox: Menú **Archivo -> Importar servicio virtualizado**.
3. Asignar mínimo **2 GB de RAM** y 2 núcleos CPU.
4. Tipo de red: **Adaptador Puente (Bridge)** o **Red NAT con reenvío de puertos**:
   - Host `5432` -> Guest `5432` (PostgreSQL)
   - Host `27017` -> Guest `27017` (MongoDB)
   - Host `2222` -> Guest `22` (SSH)
5. Credenciales de la máquina:
   - Usuario: `alumno`
   - Contraseña: `fp`
   - Clave sudo: `fp`
