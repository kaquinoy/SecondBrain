# Product Management — Knowledge base

## Contexto
Responsabilidad permanente como Product Manager en Interbank. Cubre la gestión continua de roadmap, discovery de usuarios, coordinación con engineering y diseño, y delivery de features del producto digital. No tiene deadline: es un rol en curso.

## Decisiones tomadas
- **2026-06-15**: Skill `analista-ppt` usa patrón SSOT + wrapper fino (mismo que otros roles del sistema). Stack de construcción: `python-pptx` sobre `pptxgenjs` — más control sobre paleta y estilos.

## Conclusiones acumuladas
- Depósitos Abril 2026: 103 clientes monitoreados, todos incumpliendo (38.6% prom.). BC concentra 95% de ganancia perdida (S/1.99M); BC GRUPO 2 es el foco crítico.

## Aprendizajes / insights
- `python-pptx` v1.0.2 disponible en Windows. LibreOffice falla en Windows con `AF_UNIX` → QA visual no disponible; usar QA de contenido vía desempaquetado XML.
- Para PPTs de datos en python-pptx: construir tablas con `rect()` + `txbox()` es más confiable que charts nativos.
