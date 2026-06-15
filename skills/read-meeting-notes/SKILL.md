---
name: read-meeting-notes
description: Procesa notas o transcripciones de reuniones y rutea decisiones, action items e insights al proyecto/área correspondiente. Disparador: "procesá estas notas", "leé esta transcripción", "read meeting notes", "cargá las notas de la reunión".
---

# 📝 Skill: Read Meeting Notes

Procesa notas de reunión y rutea el contenido al proyecto/área correcto.

## Fuentes soportadas
- Texto pegado directamente en el chat
- Referencia a archivo en Drive (`drive:[nombre]`)

## Flujo
1. Obtené el contenido fuente.
2. Extraé: participantes, tema/contexto, decisiones clave, action items, insights.
3. Detectá el proyecto/área de destino por keywords. Si hay ambigüedad, proponé split.
4. Mostrá propuesta estructurada antes de escribir:

```
📝 Procesado: [reunión] — [fecha]
Routing: [proyecto|área]

DECISIONES: ...
ACTION ITEMS: ...
INSIGHTS PARA knowledge: ...

VOY A ESCRIBIR EN:
- log.md (entrada nueva)
- todo.md (action items)
- knowledge.md (insights y decisiones)
¿Confirmás?
```

5. Esperá confirmación. Escribí y hacé commit.

## Reglas
- NUNCA escribir sin confirmación.
- Action items de terceros (no del usuario) van solo al log, no al todo.md.
- Transcripciones >2000 líneas: avisá del costo en tokens y proponé resumir primero.
