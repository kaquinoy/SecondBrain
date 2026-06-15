---
name: start-project
description: Crea un proyecto o área nueva en la estructura PARA con la trinidad de archivos (knowledge.md, todo.md, log.md) y un CLAUDE.md específico. Disparador: "iniciá un proyecto", "creá un área nueva", "nuevo proyecto", "start project".
---

# 🚀 Skill: Start Project

Bootstrapea un nuevo proyecto o área en PARA con todos los archivos estándar.

## Flujo
1. Parseá el input para extraer: nombre en kebab-case + descripción libre.
2. Decidí projects vs areas:
   - Outcome concreto + deadline → `PARA/projects/`
   - Responsabilidad permanente sin fin → `PARA/areas/`
   - Si no es obvio, preguntale al usuario.
3. Mostrá propuesta antes de crear (con contexto inicial para knowledge.md).
4. Esperá confirmación.
5. Creá: `knowledge.md`, `todo.md`, `log.md`, `CLAUDE.md` propio del proyecto.
6. Commit: `[nombre] inicialización del proyecto/área`.

## Reglas
- NUNCA crear archivos sin la validación del paso 4.
- Si el nombre ya existe, alertar al usuario.
- Default a projects/ si hay duda.
