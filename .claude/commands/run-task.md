# /run-task

Triggers the corresponding sub-agent to execute a task from the to-do.

## Usage
- `/run-task tsk-007` → by id
- `/run-task "Responder propuesta"` → by description (fuzzy search)

## Flow

1. **Find the task**:
   - If the user passes an id, look for it in `todo.md` files under `PARA/projects/*/` and `PARA/areas/*/`.
   - If the user passes a description, do approximate matching. If ambiguous, show matches and ask.

2. **Identify the assigned agent** (`🤖 research`, `🤖 writer`, `🤖 executor`, `🤖 manual`).
   - If `manual`: tell the user this task is for them to do themselves, can't be delegated.

3. **Gather minimal context**:
   - Read the relevant section of `PARA/[projects|areas]/[name]/knowledge.md` only if the task requires it.
   - DO NOT load context from other projects/areas.

4. **Invoke the corresponding sub-agent** with:
   - Task description
   - Minimal project context
   - Agent restrictions (defined in `.claude/agents/[agent].md`)

5. **The sub-agent returns a result** (research, draft, action proposal).

6. **Show result to the user** and ask for validation:
   - For research/writer: "¿Te sirve? ¿Ajusto algo?"
   - For executor: "Voy a ejecutar [acción concreta]. ¿Confirmás?" — wait for explicit YES.

7. **If the user confirms an executor action**:
   - Execute via MCP (Gmail, Calendar, Drive as appropriate).
   - Report result: "Hecho. [detalle del resultado]."

8. **Mark task as completed** in `todo.md`:
   - Move item to "✅ Completadas" section with `✔️ YYYY-MM-DD`.
   - Commit: `[name] completada tsk-XXX`.

## Critical rules

- **Irreversible actions require EXPLICIT confirmation with the word "sí" or "confirmá"**. An ambiguous "ok dale" is NOT enough if the action is serious (e.g., sending email).
- If the task involves sensitive data (financial, passwords, permissions), DO NOT execute — tell the user it's a mandatory manual action.
- If the sub-agent fails or can't complete, do NOT mark the task as done. Report the error and propose alternative.
