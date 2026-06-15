# Product Management — Bitácora de sesiones

## 2026-06-15
**Foco**: Creación del skill `/analista-ppt` y generación del PPT de seguimiento de compromisos de depósitos (Abril 2026).
**Conclusiones**:
- Skill `/analista-ppt` operativo con SSOT + wrapper fino.
- PPT `seguimiento-compromisos-depositos-abr2026.pptx` generado desde `Excel reunion.xlsx` (8 slides, paleta Interbank, Poppins).
- 103 clientes analizados, todos incumplen. BC concentra 95% de pérdida (S/1.99M); ejecutivo Rodríguez Sangurima es el caso más crítico (17.4% cumplimiento, 29 clientes).
- QA visual no disponible en Windows (LibreOffice falla con AF_UNIX); se usa QA de contenido vía XML.
**Decisiones**: Skill sigue patrón SSOT + wrapper. Stack: python-pptx en lugar de pptxgenjs para mayor control de estilos.
**Tareas generadas**: tsk-002, tsk-003

## 2026-06-14
**Foco**: Inicio de sesión en área de product management.
**Conclusiones**: Se identificó una tarea pendiente relacionada a depósitos: crear una presentación PPT.
**Decisiones**: Ninguna.
**Tareas generadas**: tsk-001
