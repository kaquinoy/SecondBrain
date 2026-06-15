# /start-project

Bootstraps a new project (or area) in the PARA structure. Generates the standard trio (`knowledge.md`, `todo.md`, `log.md`) plus a per-project `CLAUDE.md`. Inspired by Meta's `/start-project`.

## Usage
`/start-project "name and short description"`

Examples:
- `/start-project "ai-newsletter — newsletter semanal sobre AI para PMs"`
- `/start-project "marathon-training — entrenamiento para maratón 2026"` (would go to areas if it has no fixed end date)

## Flow

1. **Parse the user's input** to extract:
   - Folder name (kebab-case if the user doesn't specify).
   - Free description.

2. **Decide projects vs areas** and validate with the user:
   - If has clear outcome and deadline → `PARA/projects/`
   - If is permanent responsibility without end → `PARA/areas/`
   - Ask the user if it's not obvious.

3. **Optional: deep search** (if the user mentions it in the description, e.g., "investigá competidores antes"):
   - Query Drive, Gmail, Calendar via MCPs for recent context related to the topic.
   - Bring relevant findings to feed the initial `knowledge.md`.

4. **Propose initial structure to the user** (in Spanish, before creating files):

```
📁 Nuevo [proyecto|área]: [name]
Ubicación: PARA/[projects|areas]/[name]/

Voy a crear:
- knowledge.md con contexto inicial inferido
- todo.md vacío con secciones de prioridad
- log.md vacío
- CLAUDE.md específico del [proyecto|área]

CONTEXTO INICIAL PROPUESTO PARA knowledge.md:
[draft del bloque "Contexto"]

¿Confirmás?
```

5. **Wait for confirmation**. Apply requested adjustments.

6. **Create files** with the standard templates (see formats in global CLAUDE.md).

7. **Per-project CLAUDE.md template**:
```markdown
# [Name] — Contexto para Claude

## Qué es
[2-3 líneas]

## Stakeholders y referentes
[Personas clave o "—"]

## Decisiones vigentes
Ver `knowledge.md` > Decisiones tomadas

## Convenciones específicas
[Reglas de tono, formato, herramientas — o "—"]

## Archivos clave
- knowledge.md
- todo.md
- log.md
```

8. **Git commit**: `[name] inicialización del [proyecto|área]`.

9. **Confirm to the user**: "Listo. Creado en PARA/[projects|areas]/[name]/ con la trinidad + CLAUDE.md. Commit [hash]."

## Rules

- Don't write files without the validation in step 5.
- If the name already exists in projects/ or areas/, alert the user and ask if it's a continuation or different.
- Default to projects/ if in doubt — easier to move to archives/ later than to areas/ retroactively.
