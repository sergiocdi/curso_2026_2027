# Claude Code Instructions (CLAUDE.md)

This project follows the universal AI agent rules defined in `AGENTS.md`.

## Mandatory Starting Context
At the beginning of any conversation or task, you MUST inspect and read the main Map of Content (MOC):
- File: `00-Mapa-de-Contenido-Principal.md`

This file outlines the entire vault architecture, including modules (`01-Modulos/`), operational groups (`02-Grupos/`), syllabi, and question banks.

## Mandatory Maintenance Rule
- Keep `00-Mapa-de-Contenido-Principal.md` strictly up to date whenever modules, groups, units, or key documents are added, renamed, moved, or deleted.
- Update the frontmatter YAML date field (`actualizado: YYYY-MM-DD`) on every change to the MOC.

## Mandatory Terminology: Concepts vs Apuntes
- Modular curriculum units store atomic **conceptos** (`02-Conceptos/`, `tipo: concepto`, `CON-` prefix).
- Full instructional notes for students are **apuntes** and MUST be created exclusively using the skill in `.agents/skills/generar-apuntes/SKILL.md` (HTML to PDF).

For complete rules and SSOT principles, refer to `AGENTS.md`.

