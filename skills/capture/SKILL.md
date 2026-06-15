---
name: capture
description: Captura rápida de cualquier idea, tarea, nota o link al inbox sin clasificar. Úsalo cuando querés guardar algo al vuelo sin decidir dónde va todavía. Disparador: "capturá", "guardá esto", "capture".
---

# 📥 Skill: Capture

Captura cualquier input en `inbox/backlog.md` sin clasificar. Velocidad máxima, cero fricción.

## Qué puede capturarse
- Tareas ("Llamar a X la semana que viene")
- Ideas ("Idea de curso: PM para founders no técnicos")
- Notas / insights ("El competidor Y bajó el precio")
- Links ("https://... — leer después")
- Decisiones tentativas ("Tal vez convenga mover el lanzamiento a julio")

## Flujo
1. Tomá el texto que el usuario pasó.
2. Añadilo a `inbox/backlog.md` con timestamp: `- **YYYY-MM-DD HH:MM** — [texto]`
3. NO pidas validación — la captura rápida es intencional.
4. Confirmá brevemente: "Capturado."

## Reglas
- No clasificar al momento de capturar — la clasificación es para `/process-inbox`.
- No hacer commit por cada captura individual. Commit al final del día o cuando el usuario lo pida.
