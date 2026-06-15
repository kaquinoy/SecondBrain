---
name: process-inbox
description: Procesa los items acumulados en inbox/backlog.md y los clasifica a su destino (todo, knowledge, resources o descartar). Complemento de capture. Disparador: "procesá el inbox", "vaciá el inbox", "clasificá el backlog".
---

# 🗂️ Skill: Process Inbox

Lee `inbox/backlog.md` y clasifica cada item uno por uno de forma interactiva.

## Flujo
1. Leé `inbox/backlog.md` completo. Si está vacío: "Inbox vacío. Nada que procesar."
2. Por cada item, proponé clasificación:

```
📥 Item 1 de N
[**fecha** — texto del item]

Clasificación sugerida: [Tarea | Idea | Insight | Recurso | Decisión | Descartar]
Destino sugerido: [PARA/projects/X/todo.md | knowledge.md | resources/ | descartar]

(a) Aplicar sugerencia
(b) Cambiar destino
(c) Editar texto antes de mover
(d) Descartar
(e) Saltar (dejar en backlog)
```

3. Para cada item confirmado, ejecutá la acción correspondiente.
4. Al final mostrá resumen y hacé commit: `[inbox] procesamiento del [fecha] — N items`.

## Reglas
- Procesá de a uno, no en batch.
- No procesar items capturados hace menos de 1 hora.
- Si el item es ambiguo, proponé crear un proyecto nuevo o mover a archives.
