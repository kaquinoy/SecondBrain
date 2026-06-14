# /process-inbox

Processes accumulated items in `inbox/backlog.md` and classifies each into its destination (project todo, knowledge, resources, archives, or discard). Complement of `/capture`.

## Usage
`/process-inbox`

## Flow

1. **Read `inbox/backlog.md`** completely.
2. If empty, tell the user: "Inbox vacío. Nada que procesar."

3. **For each item in the inbox**, propose classification one by one (interactive):

```
📥 Item 1 de N
[**2026-05-12 09:30** — texto del item]

Clasificación sugerida: [Tarea | Idea | Insight | Recurso | Decisión | Descartar]
Destino sugerido: [PARA/projects/X/todo.md | PARA/projects/X/knowledge.md | PARA/resources/ | descartar]

Acciones:
(a) Aplicar sugerencia
(b) Cambiar destino → [pasar otro destino]
(c) Editar texto antes de mover
(d) Descartar
(e) Saltar (dejar en backlog para otra ronda)
```

4. **For each item the user confirms**, perform the action:
   - **Tarea** → append to corresponding `todo.md` with new id, in suggested priority section.
   - **Insight/Decisión** → append to corresponding `knowledge.md`.
   - **Recurso** → write file in `PARA/resources/[name].md` with content + source.
   - **Descartar** → remove from backlog, no destination.

5. **At end**, show summary:

```
✅ Inbox procesado:
- N items procesados
- M items movidos a [resumen por destino]
- K items descartados
- L items saltados (siguen en backlog)
```

6. **Git commit**: `[inbox] procesamiento del [fecha] — N items`.

## Rules

- Process one at a time — don't dump batch to the user.
- If the user says "no" or "saltar", leave the item in the backlog without modification.
- If an item is ambiguous or has no clear destination, propose creating a new project (`/start-project`) or move to `archives/` for "no decidido todavía".
- Don't process items captured less than 1 hour ago (they may still need context).
