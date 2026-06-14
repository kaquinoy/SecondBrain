# 🎯 Mission Control

> Snapshot de pendientes en todo el sistema. Fuente: `PARA/projects/*/todo.md` y `PARA/areas/*/todo.md`.
>
> Requiere [Obsidian](https://obsidian.md/) + plugin **Dataview** habilitado.

---

## 🚦 Kanban por prioridad

```dataviewjs
const allTasks = dv.pages('"PARA"').file.tasks.where(t => !t.completed);
const dateRe = /📅\s*(\d{4}-\d{2}-\d{2})/;
const idRe = /id:(\S+)/;
const cleanText = (s) => s.replace(/⏫|🔼|🔽|📅\s*\d{4}-\d{2}-\d{2}|🤖\s*\S+|id:\S+|#\S+/g, "").trim();
const areaOf = (path) => {
  // path ej: "PARA/areas/trabajo/todo.md" o "PARA/projects/lanzamiento/todo.md"
  const parts = path.split("/");
  return parts.length > 2 ? parts[2] : "otros";
};

// Filtros dinámicos: derivar de las áreas/proyectos existentes
const uniqueAreas = [...new Set(allTasks.array().map(t => areaOf(t.path)))].filter(Boolean).sort();
const areaFilters = [
  { id: "all", label: "Todas" },
  ...uniqueAreas.map(a => ({ id: a, label: a.charAt(0).toUpperCase() + a.slice(1).replace(/-/g, " ") }))
];

let currentFilter = "all";

const wrapper = dv.el("div", "", { cls: "kanban-wrapper" });

// Filter bar
const filterBar = wrapper.createDiv({ cls: "kanban-filters" });
const filterButtons = {};
areaFilters.forEach(f => {
  const btn = filterBar.createEl("button", { text: f.label, cls: "kanban-filter-btn" });
  if (f.id === "all") btn.classList.add("active");
  btn.dataset.area = f.id;
  btn.addEventListener("click", () => {
    currentFilter = f.id;
    Object.values(filterButtons).forEach(b => b.classList.remove("active"));
    btn.classList.add("active");
    renderBoard();
  });
  filterButtons[f.id] = btn;
});

// Board container
const board = wrapper.createDiv({ cls: "kanban-board" });

const columns = [
  { label: "🔴 Alta", marker: "⏫", cls: "col-alta" },
  { label: "🟡 Media", marker: "🔼", cls: "col-media" },
  { label: "🟢 Baja", marker: "🔽", cls: "col-baja" }
];

function renderBoard() {
  board.empty();
  const filtered = currentFilter === "all"
    ? allTasks
    : allTasks.where(t => t.path.includes(`/${currentFilter}/`));

  columns.forEach(c => {
    const colEl = board.createDiv({ cls: `kanban-column ${c.cls}` });
    colEl.createEl("h4", { text: c.label, cls: "kanban-col-title" });
    const colTasks = filtered.where(t => t.text.includes(c.marker));
    if (colTasks.length === 0) {
      colEl.createDiv({ text: "—", cls: "kanban-empty" });
    } else {
      const sorted = colTasks.array().sort((a, b) => {
        const ma = a.text.match(dateRe);
        const mb = b.text.match(dateRe);
        if (!ma && !mb) return 0;
        if (!ma) return 1;
        if (!mb) return -1;
        return ma[1].localeCompare(mb[1]);
      });
      for (const t of sorted) {
        renderCard(colEl, t);
      }
    }
  });
}

function renderCard(col, t) {
  const card = col.createDiv({ cls: "kanban-card" });
  const area = areaOf(t.path);
  const dueMatch = t.text.match(dateRe);
  const idMatch = t.text.match(idRe);

  card.createSpan({ text: area, cls: `kanban-badge area-${area}` });

  if (dueMatch) {
    const due = dv.date(dueMatch[1]);
    const overdue = due < dv.date("today");
    card.createDiv({
      text: (overdue ? "⚠️ " : "📅 ") + due.toFormat("dd/MM"),
      cls: overdue ? "kanban-due overdue" : "kanban-due"
    });
  }

  card.createDiv({ text: cleanText(t.text), cls: "kanban-text" });
  if (idMatch) card.createDiv({ text: idMatch[1], cls: "kanban-id" });
}

renderBoard();
```

---

## 📥 Inbox

```dataview
TASK
FROM "inbox"
WHERE !completed
```
