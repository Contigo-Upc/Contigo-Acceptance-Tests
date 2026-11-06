# Repositorio de Acceptance Tests para la startup Contigo

Este repositorio contiene las pruebas de aceptación de **Contigo**, una aplicación que guía paso a paso a adultos mayores y a personas con poca experiencia digital para realizar trámites y pagos en línea (agua, luz, internet, cable y DNI).

Cada archivo `.feature` corresponde a una historia de usuario del Product Backlog y está escrito en **Gherkin** con la estructura *Feature / Scenario / Given / When / Then*, a partir de los criterios de aceptación definidos en el informe del proyecto.

## Épicas

| Épica | Nombre | Historias |
| --- | --- | --- |
| EPIC-01 | Registro, acceso y perfil | US01 - US05 |
| EPIC-02 | Selección y navegación de trámites | US06 - US10 |
| EPIC-03 | Guía paso a paso y apoyo visual | US11 - US15 |
| EPIC-04 | Extracción de información de documentos (OCR) | US16 - US20 |
| EPIC-05 | Asistente de inteligencia artificial | US21 - US25 |
| EPIC-06 | Indicador de progreso y confirmación | US26 - US30 |
| EPIC-07 | Orientación y manejo de errores | US31 - US35 |
| EPIC-08 | Recordatorios y calendario | US36 - US40 |
| EPIC-09 | Accesibilidad y personalización | US41 - US45 |
| EPIC-10 | Historial, ayuda y soporte | US46 - US50 |

## Convenciones

- Un archivo por historia de usuario: `USxx.feature`.
- Palabras clave de Gherkin en inglés; el contenido de los escenarios en español.
- Ramas según GitFlow y commits con Conventional Commits.
