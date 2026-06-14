# /para-init

Bootstraps or audits the PARA workspace structure. Inspired by Meta's `/para-init`: scans current state, infers projects/areas, and proposes structure.

## Usage
- `/para-init` → audit current PARA structure and suggest gaps to fill
- `/para-init scan` → also scan recent activity (Drive, Gmail, Calendar via MCPs) to infer new projects/areas worth creating

## Flow

1. **Read current PARA state**:
   - List `PARA/projects/`, `PARA/areas/`, `PARA/resources/`, `PARA/archives/`.
   - For each existing project/area, check it has the trio: `knowledge.md`, `todo.md`, `log.md`.

2. **Audit**:
   - Report which projects/areas are missing files.
   - Report which projects in `PARA/projects/` look stale (no log entries in 30+ days) — propose moving to `PARA/archives/`.
   - Report which projects don't have a per-project `CLAUDE.md` yet (Phase 2 of PARA migration).

3. **If `scan` argument**: query MCPs (Gmail recent threads, Calendar upcoming events, Drive recent docs) and infer if there are recurring topics that suggest a new project or area not yet captured. Propose them to the user, don't create automatically.

4. **Show structured report to the user** (in Spanish):

```
🧭 Auditoría PARA — [fecha]

ESTRUCTURA ACTUAL:
- projects/: [N proyectos] → [ejemplos]
- areas/: [N áreas] → [ejemplos]
- resources/: [vacío | X archivos]
- archives/: [vacío | X items]

GAPS DETECTADOS:
- [proyecto X] no tiene log.md
- [proyecto Y] sin actividad en 45 días → ¿archivar?
- [N proyectos] sin CLAUDE.md propio (Fase 2 pendiente)

INFERENCIAS DE ACTIVIDAD RECIENTE (solo si `scan`):
- Detecté [N] menciones recurrentes sobre "[tema]" en Gmail/Drive — ¿crear proyecto/área nuevo?

PROPUESTA DE ACCIÓN:
1. ...
2. ...
```

5. **Wait for the user's confirmation** before creating, archiving or modifying anything.

## Rules

- Read-only by default. Only modifies after the user confirms.
- Does NOT delete archives — only moves to `PARA/archives/`.
- Does NOT create new projects/areas without explicit approval per item.
