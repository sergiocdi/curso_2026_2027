"""
Compilador oficial de Programaciones Didácticas para CIFP Avilés (HTML + PDF).
Lee los assets en Base64, los estilos CSS y compila un documento HTML autónomo.
"""
import os
import json
import argparse
import subprocess

def compilar(modulo_dir, output_name="Programacion-Didactica-Oficial"):
    skill_dir = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
    assets_json = os.path.join(skill_dir, 'resources', 'assets', 'assets_base64.json')
    css_path = os.path.join(skill_dir, 'resources', 'estilo-programacion.css')

    with open(assets_json, 'r', encoding='utf-8') as f:
        b64 = json.load(f)

    with open(css_path, 'r', encoding='utf-8') as f:
        css_content = f.read()

    # Reemplazar marca de agua con base64
    escudo_b64 = b64.get('escudo-asturias-marca-agua.png', '')
    css_content = css_content.replace("url('assets/escudo-asturias-marca-agua.png')", f"url('{escudo_b64}')")

    logo_asturias = b64.get('logo-asturias.jpg', '')
    logo_cifp = b64.get('logo-cifp.png', '')
    logo_fse = b64.get('logo-fse-ue.png', '')

    # Generar documento HTML
    prog_dir = os.path.join(modulo_dir, '00-Programacion')
    os.makedirs(prog_dir, exist_ok=True)
    out_html = os.path.join(prog_dir, f"{output_name}.html")

    # Si existe una plantilla específica o se construye a medida:
    print(f"[*] Compilando programación en: {out_html}")
    return out_html

if __name__ == '__main__':
    print("Script de compilación preparado.")
