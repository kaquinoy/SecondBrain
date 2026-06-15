# /capture

Quick capture of any input (tasks, ideas, notes, links, tentative decisions) into the inbox without classification. Friction-zero buffer to avoid losing things in the moment.

## Usage
`/capture "text of the input"`

Or in natural language: "capturá: [input]" / "capture this: [input]"

## What can be captured

Anything raw that hasn't been classified yet:
- Tasks ("Llamar a X la semana que viene")
- Ideas ("Idea de curso: PM para founders no técnicos")
- Notes / insights ("El competidor Y bajó el precio a USD 200")
- Links / resources ("https://... — leer después, parece útil para [área-ejemplo]")
- Tentative decisions ("Tal vez convenga mover el lanzamiento a julio")

The philosophy: at capture time you DO NOT decide what type it is. Just save it. Classification happens later via `/process-inbox`.

## Flow

1. Take the text the user passed.
2. Append it to `inbox/backlog.md` with timestamp.
3. DO NOT ask for validation — this is intentional fast capture.
4. Brief confirmation: "Capturado."

## Format in backlog.md

Append at end of file:

```markdown
- **YYYY-MM-DD HH:MM** — [literal text of the input]
```

## Rules

- Don't classify by project at capture time — speed is the point of the inbox.
- Don't commit per individual capture (Git noise). Batch commit at end of day or when the user asks.
- For processing/classification later, use `/process-inbox`.
