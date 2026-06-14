# /read-meeting-notes

Processes meeting notes/transcripts and routes content (decisions, actions, insights) to the relevant project/area. Inspired by Meta's `/read-meeting-notes`, adapted to handle Drive transcriptions, chat captures, manual notes.

## Usage
- `/read-meeting-notes` → ask the user for the source
- `/read-meeting-notes drive:[file-id-or-name]` → fetch transcript from Drive
- `/read-meeting-notes "raw text pasted here"` → process inline text

## Flow

1. **Get source content**:
   - If the user pasted text inline, use that.
   - If reference to Drive file, fetch via Drive MCP.
   - If no source, ask the user to paste text or pass the reference.

2. **Analyze and extract**:
   - **Participants** (if mentioned).
   - **Topic / context** (1 line).
   - **Key decisions** (with whose decision if it's clear).
   - **Action items** (who, what, deadline if mentioned).
   - **Insights / unexpected info** (worth saving).

3. **Route to the relevant project/area**:
   - Infer based on keywords and content.
   - If matches multiple projects, propose split.
   - If no match, propose creating a new project (link to `/start-project`) or saving to `inbox/backlog.md`.

4. **Show structured proposal to the user** (in Spanish):

```
📝 Procesado: [reunión / nota] — [fecha si la hay]
Routing sugerido: [proyecto|área]

DECISIONES:
- [decisión 1]

ACTION ITEMS DETECTADOS:
- [ ] [tarea] | dueño: [persona o "yo"] | deadline: [fecha o —] | prioridad: [alta/media/baja]

INSIGHTS PARA knowledge:
- [insight relevante]

VOY A ESCRIBIR EN:
- PARA/[projects|areas]/[name]/log.md (entrada nueva tipo "Nota externa: [topic]")
- PARA/[projects|areas]/[name]/todo.md (action items)
- PARA/[projects|areas]/[name]/knowledge.md (insights y decisiones)

¿Confirmás?
```

5. **Wait for confirmation**. Apply adjustments.

6. **Write changes** and commit: `[name] proceso de notas externas [fecha]`.

## Rules

- NEVER write files without confirmation.
- If transcript is very long (>2000 lines), warn the user about token cost and propose summarizing first.
- For meetings with action items only for OTHERS (not the user), don't create todos in the user's todo.md — only log the decision.
- If the source comes from a sensitive channel (financial, legal), flag it and ask the user if it's OK to write to filesystem.
