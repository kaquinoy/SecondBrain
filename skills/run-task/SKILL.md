---
name: run-task
description: Ejecuta una tarea del sistema delegándola al sub-agente correspondiente (research, writer o executor). Disparador: "ejecutá la tarea tsk-XXX", "corré esta tarea", "run task".
---

# ⚡ Skill: Run Task

Busca una tarea por ID o descripción y la delega al sub-agente asignado.

## Flujo
1. Encontrá la tarea por id (`tsk-XXX`) o descripción aproximada en los `todo.md`.
2. Identificá el agente asignado (`🤖 research`, `🤖 writer`, `🤖 executor`, `🤖 manual`).
   - Si es `manual`: avisá que es para hacer manualmente, no se puede delegar.
3. Cargá contexto mínimo del `knowledge.md` del proyecto si hace falta.
4. Invocá el sub-agente con la tarea + contexto.
5. Mostrá resultado y pedí validación:
   - research/writer: "¿Te sirve? ¿Ajusto algo?"
   - executor: "Voy a ejecutar [acción]. ¿Confirmás?" — esperá "sí" explícito.
6. Si se confirma: marcá la tarea como completada en `todo.md` y hacé commit.

## Reglas críticas
- Acciones irreversibles requieren "sí" o "confirmá" explícito.
- Datos financieros, contraseñas o permisos → acción manual obligatoria.
- Si el agente falla, NO marcar la tarea como completada.
