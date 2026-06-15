---
name: show-tasks
description: Lista las tareas pendientes del sistema PARA, con filtros por área/proyecto, prioridad, deadline o agente. Disparador: "qué tengo pendiente", "mostrame las tareas", "show tasks", "tareas de hoy", "tareas vencidas".
---

# 📋 Skill: Show Tasks

Lista pendientes de los `todo.md` del sistema PARA con filtros opcionales.

## Filtros disponibles
- Sin filtro → todos los proyectos y áreas, agrupados por prioridad
- `[nombre]` → solo ese proyecto o área
- `today` → solo con deadline hoy
- `this-week` → deadline en los próximos 7 días
- `overdue` → deadline pasado, no completadas
- `agent:research/writer/executor` → por agente asignado

## Formato de salida
```
📋 Pendientes — [filtro]

🔴 ALTA
- [tsk-001] @área — Descripción 📅 fecha 🤖 agente

🟡 MEDIA
- [tsk-003] @área — Descripción

🟢 BAJA / sin deadline
- [tsk-012] @área — Descripción

⚠️ VENCIDAS
- [tsk-005] @área — Descripción 📅 fecha vencida

Total: X pendientes (Y altas, Z medias, W bajas, V vencidas).
```

## Reglas
- Solo lectura. No modifica archivos.
- Si hay vencidas, sugerí brevemente repriorizar.
- Siempre mostrá el `id:tsk-XXX` para que el usuario pueda referenciarlas.
