# 🧠 peter-brain

> Tu **segundo cerebro** en Markdown, manejado por agentes de Claude Code.
>
> Sistema operativo personal basado en la metodología **PARA** (Projects, Areas, Resources, Archives) y diseñado para usuarios de [Claude Code](https://docs.claude.com/en/docs/claude-code/overview).

---

## ¿Qué es esto?

Un repo template para armar tu propio "second brain" donde notas, decisiones, tareas, proyectos y agentes ejecutores viven en archivos Markdown locales. Claude Code es la interfaz: capturás, procesás y ejecutás todo desde una terminal con comandos slash.

**¿Por qué un template y no una app?**

- **Vos sos el dueño**: son archivos Markdown en tu disco. Sin SaaS, sin lock-in, sin precio mensual.
- **Versionado**: cada cambio queda registrado en git.
- **Sincronizable**: poné el repo en Google Drive, iCloud, Dropbox o donde quieras.
- **Extensible**: agregás comandos y agentes propios cuando los necesités.
- **Visual opcional**: si abrís la carpeta con [Obsidian](https://obsidian.md/), tenés un dashboard tipo kanban automático.

---

## ¿Cómo arrancar?

### Pre-requisitos

- [Claude Code](https://docs.claude.com/en/docs/claude-code/setup) instalado.
- (Opcional) [Obsidian](https://obsidian.md/) si querés el dashboard visual.
- (Opcional) Una cuenta de Google si vas a usar los MCPs de Gmail/Calendar/Drive.

### Instalación

```bash
# 1. Cloná el template (o usá "Use this template" en GitHub)
git clone https://github.com/[tu-usuario]/peter-brain.git mi-peter-brain
cd mi-peter-brain

# 2. Abrí Claude Code en la raíz
claude

# 3. Pegá esto y seguí los pasos:
> Leé bootstrap.md y guiame para personalizar mi peter-brain.
```

El `bootstrap.md` te va a preguntar tu nombre, qué áreas iniciales querés crear (opcional), y deja el sistema listo en 5 minutos.

---

## Estructura

```
peter-brain/
├── .claude/                  # Config de Claude Code: CLAUDE.md, commands, agents
│   ├── CLAUDE.md             # Instrucciones globales para Claude
│   ├── commands/             # 9 slash commands listos para usar
│   └── agents/               # 3 sub-agentes (research, writer, executor)
├── PARA/
│   ├── projects/             # Trabajo activo con outcome y deadline
│   ├── areas/                # Responsabilidades permanentes (trabajo, salud, etc.)
│   ├── resources/            # Material de referencia
│   └── archives/             # Proyectos cerrados o pausados
├── inbox/backlog.md          # Captura rápida sin clasificar
├── recurring/                # Tareas que se repiten en cadencia fija
├── skills/                   # Skills opcionales (ej: debrief)
├── mission-control.md        # Dashboard kanban (requiere Obsidian + Dataview)
└── bootstrap.md              # Setup guiado (corré una vez al instalar)
```

Cada proyecto/área tiene la **trinidad**: `knowledge.md` (decisiones acumuladas) + `todo.md` (tareas) + `log.md` (bitácora de sesiones).

---

## Comandos disponibles

| Comando | Para qué |
|---|---|
| `/capture "idea"` | Captura rápida al inbox, sin clasificar |
| `/process-inbox` | Procesa items del inbox y los rutea a su lugar |
| `/debrief [name]` | Cierre de sesión: resumen + actualizar knowledge/todo/log |
| `/show-tasks [filter]` | Lista pendientes filtrados |
| `/run-task [id]` | Dispara el sub-agente que corresponde |
| `/review-recurring` | Revisa qué recurrentes ejecutar hoy |
| `/start-project "name + desc"` | Crea un proyecto/área nuevo con la trinidad |
| `/read-meeting-notes [src]` | Procesa notas de meetings y rutea tareas |
| `/para-init [scan]` | Audita la estructura PARA y propone gaps |

---

## Personalización avanzada

### Roles activables (modo "X")

Si querés activar contextos específicos (ej: "modo estratega", "modo coach"), seguí el patrón **SSOT + wrappers** documentado en `.claude/CLAUDE.md` sección "Convención para roles activables". TL;DR:

1. Definí el rol en `PARA/areas/[name]/role/[rol].md` (la fuente única de verdad).
2. Creá un wrapper fino en `.claude/commands/[rol].md` que apunte al SSOT.

### MCPs

`mcp-config.json` viene con Gmail, Calendar y Drive configurados como referencia. Necesitás regenerar credenciales propias en `~/.config/peter-brain/` (la guía oficial está en la doc de cada MCP).

### Sub-agentes

Los 3 sub-agentes que vienen:
- **research-agent**: investigación web. Read-only.
- **writer-agent**: drafts (emails, posts). No envía.
- **executor-agent**: ejecuta acciones reales vía MCPs. Siempre pide confirmación antes de algo irreversible.

Podés agregar los tuyos en `.claude/agents/`.

---

## Inspiración

- **PARA Method** (Tiago Forte) — la arquitectura base.
- **AI second brain** de Meta — el concepto de "knowledge worker + agentes".
- **Dotfiles culture** — versionar tu setup personal en git.

---

## Licencia

MIT. Usalo, modificalo, vendelo, lo que quieras. Si te resulta útil, una mención al repo me alegra el día.

---

## Contribuir

PRs y issues bienvenidos. Si armaste un command o agente que te resultó útil, mandalo — la comunidad lo agradece.
