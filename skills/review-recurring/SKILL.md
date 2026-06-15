---
name: review-recurring
description: Revisa qué tareas recurrentes corresponde ejecutar hoy según su frecuencia y propone dispararlas. Disparador: "revisá las recurrentes", "qué recurrentes tocan hoy", "review recurring".
---

# 🔁 Skill: Review Recurring

Revisa `recurring/tasks.md` y `recurring/runs/` para determinar qué tareas periódicas corresponden hoy.

## Flujo
1. Leé `recurring/tasks.md` (definiciones).
2. Leé `recurring/runs/` para ver la última ejecución de cada una.
3. Calculá cuáles corresponden hoy según su frecuencia.
4. Mostrá la lista con propuesta:

```
🔁 Tareas recurrentes para hoy [fecha]:

1. [rec-001] Nombre
   Última ejecución: hace X días ✓ corresponde
   Agente: research

¿Disparo las N? ¿Solo una? ¿Ninguna?
```

5. Para cada aprobada, ejecutá el flujo del agente correspondiente.
6. Logueá la ejecución en `recurring/runs/YYYY-MM-DD-rec-XXX.md`.
7. Commit: `[recurring] ejecuciones del [fecha]`.

## Reglas
- NUNCA ejecutar sin confirmación del usuario.
