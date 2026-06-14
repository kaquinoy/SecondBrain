# /show-tasks

Lists pending tasks filtered by project/area, priority, deadline or agent.

## Usage
- `/show-tasks` → all projects and areas, grouped by priority
- `/show-tasks [name]` → only that project or area
- `/show-tasks today` → only tasks with deadline today
- `/show-tasks this-week` → tasks with deadline in the next 7 days
- `/show-tasks overdue` → tasks with past deadline, not completed
- `/show-tasks agent:research` → tasks assigned to a specific agent

## Flow

1. **Identify the filter** from the arguments.

2. **Read ONLY the necessary `todo.md` files** (token efficiency):
   - If the user asked for a specific name, look in both `PARA/projects/[name]/todo.md` and `PARA/areas/[name]/todo.md`.
   - If the user asked for "all", read all `todo.md` files in `PARA/projects/*/` and `PARA/areas/*/`.
   - DO NOT read knowledge.md or log.md here.

3. **Parse tasks** and apply the requested filter.

4. **Show result** in compact format (Spanish):

```
📋 Pendientes — [filtro aplicado]

🔴 ALTA
- [tsk-001] @trabajo — Definir pricing del producto `📅 2026-05-08` `🤖 research`
- [tsk-007] @finanzas — Responder propuesta `📅 2026-05-03` `🤖 writer`

🟡 MEDIA
- [tsk-003] @trabajo — Investigar competidores `🤖 research`

🟢 BAJA / sin deadline
- [tsk-012] @personal-os — Leer paper sobre AI agents

⚠️ VENCIDAS (si las hay)
- [tsk-005] @salud — Turno con médico `📅 2026-04-28`
```

5. **Footer summary**: "Total: X pendientes (Y altas, Z medias, W bajas, V vencidas)."

6. If the user has overdue tasks, briefly suggest: "¿Querés repriorizar las vencidas?"

## Rules

- Read-only. Don't modify files in this command.
- If a `todo.md` doesn't exist (project/area without tasks yet), skip silently.
- Always show `id:tsk-XXX` so the user can reference tasks in other commands.
