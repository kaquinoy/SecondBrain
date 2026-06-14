# Bootstrap — Personalización inicial de peter-brain

> Este archivo te guía para personalizar el template en menos de 5 minutos.
> **Cómo usarlo**: abrí Claude Code en la raíz del repo y pegá:
> *"Leé bootstrap.md y guiame para personalizar mi peter-brain."*
>
> Cuando termines, Claude moverá este archivo a `PARA/archives/bootstrap-completed.md`.

---

## Instrucciones para Claude

Sos el asistente de bootstrap. Tu rol es personalizar este template para el usuario en una sesión guiada.

### Flujo

**Paso 1 — Datos básicos**

Hacé una sola `AskUserQuestion` (o preguntas en lenguaje natural si no hay tool disponible) con:

- **Nombre del usuario**: para reemplazar referencias genéricas.
- **Idioma de trabajo**: español (default) / inglés. Si elige inglés, traducí `.claude/CLAUDE.md` y los archivos plantilla. Si elige español, no hagas nada.

**Paso 2 — Áreas iniciales (opcional)**

Preguntá:

> "¿Querés crear áreas iniciales ahora? Las áreas son responsabilidades permanentes sin deadline (ej: trabajo, salud, finanzas, aprendizaje). Podés saltar este paso y crearlas después con `/start-project`."
>
> Opciones:
> - **Sí, crear áreas**: el usuario ingresa nombres separados por comas (ej: "trabajo, salud, side-project").
> - **Saltar**: pasa al paso 3.

Si elige crear, por cada nombre:
1. Creá la carpeta `PARA/areas/[nombre-kebab-case]/`.
2. Creá `knowledge.md`, `todo.md`, `log.md` con los templates de `.claude/CLAUDE.md` (sección "Formato del knowledge.md", etc.). Dejá los placeholders `[Descripción permanente...]` etc. vacíos para que el usuario los llene después.

**Paso 3 — Proyectos iniciales (opcional)**

Mismo flujo que áreas pero en `PARA/projects/`. Aclaración al usuario: "Los proyectos tienen outcome y deadline concreto; cuando los terminás, se mueven a `archives/`."

**Paso 4 — Personalizar CLAUDE.md**

Editá `.claude/CLAUDE.md`:
- Si el usuario dio nombre, reemplazá las menciones de "el usuario" por su nombre (o mantenelo genérico si prefiere).
- Eliminá la "Nota inicial" que apunta a este bootstrap (ya no es necesaria).

**Paso 5 — Init de git (opcional)**

Si el repo no tiene `.git` aún, preguntá si querés correr `git init` y hacer un commit inicial. Si sí:
```bash
git init
git add .
git commit -m "Initial commit: peter-brain personalizado"
```

**Paso 6 — Limpieza**

- Movel este archivo (`bootstrap.md`) a `PARA/archives/bootstrap-completed-YYYY-MM-DD.md`.
- Mostrale al usuario un resumen: áreas creadas, proyectos creados, próximos pasos sugeridos.

### Próximos pasos sugeridos para el usuario

Después del bootstrap, mostrale esta lista corta:

```
✅ Tu peter-brain está listo. Para empezar:

1. Capturá tu primera idea: /capture "lo que tengas en la cabeza ahora"
2. Procesá el inbox cuando tengas 5 min: /process-inbox
3. Para ver tus pendientes: /show-tasks
4. Al cerrar la sesión: /debrief

📚 Referencia completa en .claude/CLAUDE.md
🎯 Dashboard visual: abrí mission-control.md con Obsidian + plugin Dataview
```

### Reglas importantes

- **No inventes contenido** dentro de los `knowledge.md`/`todo.md` de las áreas que crees. Dejalos con la estructura vacía. El contenido lo aporta el usuario.
- **No corras `git push`** — el repo es local.
- **No instales dependencias** (npm, brew, etc.) — el sistema es solo archivos markdown.
- Si algo falla, no rompas el repo: parate y avisale al usuario.
