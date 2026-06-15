# /debrief

Debriefs the current work session: extracts conclusions, decisions, insights and next steps, then persists them to the project/area files. Despite the name, the session itself doesn't have to end — the topic can continue afterwards.

## Usage
`/debrief [project-or-area-name]`

Examples:
- `/debrief trabajo`
- `/debrief personal-os`

## Flow

1. **Identify the project or area**: if the user doesn't specify, ask which one. Look in both `PARA/projects/` and `PARA/areas/`.

2. **Analyze the current conversation** and extract:
   - **Focus**: main topic worked on.
   - **Conclusions**: concrete ideas or answers reached.
   - **Decisions**: choices made (with brief reasoning if relevant).
   - **Next steps**: concrete future actions, with inferred priority and deadline if applicable.
   - **Insights**: learnings worth saving permanently.

3. **Generate structured draft** with this exact format and show it to the user (in Spanish):

```
## Resumen de sesión — [proyecto] — [fecha YYYY-MM-DD]

**Foco**: [una línea]

**Conclusiones**:
- [bullet 1]
- [bullet 2]

**Decisiones tomadas**:
- [decisión + razonamiento breve]
  (o "Ninguna" si no hubo)

**Insights para knowledge**:
- [insight relevante]
  (o "Ninguno" si no hay)

**Next steps detectados**:
- [ ] [tarea] | prioridad: [alta/media/baja] | deadline: [fecha o —] | agente: [research/writer/executor/manual]
- [ ] [tarea] | ...
```

4. **Ask for explicit validation**: "¿Confirmás que escriba esto? Podés ajustar prioridades, agregar/quitar tareas, o cambiar el agente asignado."

5. **Wait for the user's response**. Apply requested changes.

6. **Once confirmed**, write to the corresponding files (path depends on whether it's a project or area):
   - `PARA/projects/[name]/log.md` or `PARA/areas/[name]/log.md`: append a new entry at the end.
   - `knowledge.md`: if there are new decisions, add them under "Decisiones tomadas". If insights, add them under "Aprendizajes".
   - `todo.md`: insert new tasks under the matching priority section, generating auto-incremental ids (check existing ids to avoid duplicates).

7. **Git commit**:
   ```bash
   git add PARA/[projects|areas]/[name]/
   git commit -m "[name] cierre de sesión [fecha]"
   ```

8. **Confirm to the user**: "Listo. Actualicé knowledge.md, todo.md y log.md de [name]. Commit [hash corto] hecho. Tareas creadas: [ids]."

## Rules

- NEVER write files without the validation in step 5.
- If the user doesn't mention a clear decision, write "Ninguna" — don't invent decisions.
- If the conversation was very short or has no relevant material, say so: "La sesión fue breve, no veo material para guardar. ¿Querés guardar algo específico igual?"
- If the user corrects part of the draft, don't ask for full re-confirmation: apply the correction and proceed.
