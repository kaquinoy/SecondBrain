# /review-recurring

Reviews which recurring tasks should run today and proposes triggering them.

## Usage
`/review-recurring`

## Flow

1. Read `recurring/tasks.md` (recurring task definitions).
2. Read `recurring/runs/` to see latest runs of each.
3. Calculate which ones should run today based on their frequency.
4. Show list to the user with proposal (Spanish):

```
🔁 Tareas recurrentes para hoy [YYYY-MM-DD]:

1. [rec-001] Resumen semanal de inbox de Gmail
   Última ejecución: hace 7 días ✓ corresponde
   Agente: research → executor

2. [rec-003] Generar draft de post semanal
   Última ejecución: hace 3 días ✓ corresponde (frecuencia: cada 3 días)
   Agente: writer

¿Disparo las 2? ¿Solo una? ¿Ninguna?
```

5. For each approved task, run the corresponding agent flow.
6. Log run in `recurring/runs/YYYY-MM-DD-rec-XXX.md`.
7. Commit: `[recurring] ejecuciones del [fecha]`.

## Format of tasks.md

```markdown
## rec-001: Resumen semanal de inbox
**Frecuencia**: semanal (lunes)
**Agente**: research
**Acción**: Listar emails sin leer de los últimos 7 días, agruparlos por remitente, generar resumen en `inbox/resumen-semanal-YYYY-MM-DD.md`.

## rec-002: Revisión de pendientes vencidos
**Frecuencia**: diaria
**Agente**: manual
**Acción**: Ejecutar `/show-tasks overdue` y proponer repriorización.
```

## Rules

- NEVER run recurring tasks without the user's confirmation (system validation phase, for now).
- If the user wants to fully automate a recurring task later, configure an external cron job that calls Claude Code with a specific prompt.
