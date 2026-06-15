---
name: para-init
description: Audita la estructura PARA actual, detecta gaps (archivos faltantes, proyectos sin actividad) y propone acciones de mantenimiento. Disparador: "auditá el sistema", "cómo está el PARA", "para-init", "revisá la estructura".
---

# 🧭 Skill: PARA Init / Audit

Audita la estructura PARA y propone acciones de mantenimiento.

## Modos
- Sin argumento → audita estructura actual
- `scan` → además consulta MCPs (Gmail, Calendar, Drive) para inferir nuevos proyectos/áreas

## Flujo
1. Listá `PARA/projects/`, `PARA/areas/`, `PARA/resources/`, `PARA/archives/`.
2. Para cada proyecto/área verificá que tenga la trinidad: `knowledge.md`, `todo.md`, `log.md`.
3. Detectá proyectos sin actividad en el log en 30+ días → proponer archivar.
4. Mostrá reporte estructurado:

```
🧭 Auditoría PARA — [fecha]

ESTRUCTURA ACTUAL:
- projects/: N proyectos
- areas/: N áreas

GAPS DETECTADOS:
- [proyecto X] no tiene log.md
- [proyecto Y] sin actividad en 45 días → ¿archivar?

PROPUESTA DE ACCIÓN:
1. ...
```

5. Esperá confirmación antes de crear, mover o modificar cualquier cosa.

## Reglas
- Solo lectura por defecto.
- No eliminar archives, solo mover a `PARA/archives/`.
- No crear proyectos/áreas sin aprobación explícita por item.
