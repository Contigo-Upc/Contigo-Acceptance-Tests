# Cómo contribuir: Contigo - Acceptance Tests

Esta guía explica cómo usar el proyecto y cómo trabajar en él con Git y GitHub.

## 1. Qué tenemos

| Qué | Link |
|---|---|
| Repositorio de los Acceptance Tests | https://github.com/Contigo-Upc/Contigo-Acceptance-Tests |
| Repositorio del Landing Page | https://github.com/Contigo-Upc/Contigo-Landing-Page |
| Landing Page publicado | https://contigo-upc.github.io/Contigo-Landing-Page/ |

Este repositorio tiene las pruebas de aceptación de las 50 historias de usuario de Contigo, escritas en **Gherkin**.

## 2. Lo que necesitas

- [Git](https://git-scm.com/downloads)
- [Visual Studio Code](https://code.visualstudio.com/)
- Opcional: la extensión **Cucumber (Gherkin) Full Support** de VS Code, para ver los archivos con colores
- Tu cuenta de GitHub (ya tienes acceso al repositorio)

## 3. Cómo usar el proyecto

### Descargar y abrir

```bash
git clone https://github.com/Contigo-Upc/Contigo-Acceptance-Tests.git
cd Contigo-Acceptance-Tests
code .
```

### Cómo están organizados los archivos

- Hay **un archivo por historia de usuario**: de `US01.feature` a `US50.feature`.
- Cada épica agrupa 5 historias. Por ejemplo, la EPIC-01 va de `US01` a `US05`. La tabla completa está en el `README.md`.
- Cada archivo sale de los criterios de aceptación del informe.

### Cómo es un archivo `.feature`

```gherkin
Feature: US-01 - Registro con datos básicos
  Como usuario nuevo
  Deseo registrarme con mi nombre, edad y celular
  Para empezar a usar CONTIGO de forma personalizada

Scenario: Registro exitoso

    Given el usuario abre la app por primera vez
    When completa el formulario con datos válidos
    Then el sistema crea la cuenta y muestra un mensaje de bienvenida
```

- `Feature`: la historia de usuario (Como / Deseo / Para).
- `Scenario`: un caso de prueba.
- `Given`: la situación inicial.
- `When`: lo que hace el usuario.
- `Then`: lo que debe pasar.
- Opcional: `Examples`, una tabla con datos de prueba.

## 4. Cómo trabajamos: ramas

Usamos **GitFlow**. Estas son las ramas:

| Rama | Para qué sirve | ¿Se puede trabajar directo ahí? |
|---|---|---|
| `main` | La versión oficial | **No** |
| `develop` | Junta el trabajo terminado de todos | **No** |
| `feature/...` | Tu tarea | **Sí**, una rama por tarea |
| `release/...` | Preparar una versión nueva | Solo los admins |
| `hotfix/...` | Arreglar un error urgente en `main` | Solo los admins |

**Reglas:**
- Nunca hagas commit directo en `main` ni en `develop`.
- Nunca borres una rama, ni siquiera después de fusionarla.

## 5. Cómo hacer tu tarea, paso a paso

### 1. Actualiza `develop`

```bash
git checkout develop
git pull
```

### 2. Crea tu rama

```bash
git checkout -b feature/nombre-de-tu-tarea
```

El nombre va en **inglés**, en minúsculas y con guiones. Ejemplos: `feature/epic-01-examples`, `feature/us12-new-scenario`.

### 3. Haz tus cambios y guárdalos (commit)

Agrega **solo los archivos que cambiaste**, no todo con `git add .`:

```bash
git add US01.feature US02.feature
git commit -m "test: add examples to US01 and US02"
```

Puedes hacer varios commits en tu rama, uno por cada cambio.

### 4. Sube tu rama

```bash
git push -u origin feature/nombre-de-tu-tarea
```

### 5. Abre un Pull Request (PR)

1. Entra al repositorio en GitHub. Aparecerá un botón **Compare & pull request**.
2. Revisa que diga **base: `develop`** ← **compare: tu rama**. Nunca hacia `main`.
3. **Título:** igual que tu commit principal.
4. **Descripción:** qué historias cambiaste y por qué.
5. Toca **Create pull request**.

### 6. Revisión y merge

- Un admin revisa tu PR: **MauricioAlonso28**, **GFabi12** o **ccjemayorga-lang**.
- Si todo está bien, lo fusiona con **Create a merge commit**.
- **No** toques **Delete branch** después del merge.

## 6. Cómo escribir los commits

Formato: `tipo: qué hiciste`, en **inglés** y en minúsculas.

| Tipo | Cuándo usarlo | Ejemplo |
|---|---|---|
| `test` | Agregas o cambias pruebas | `test: add examples to US01 scenarios` |
| `fix` | Corriges un error en una prueba | `fix: correct expected message in US03` |
| `docs` | Cambias documentación | `docs: update epic table in readme` |

## 7. Reglas de las pruebas

- Un archivo por historia de usuario. No juntes dos historias en un archivo.
- Las palabras clave van en **inglés** (`Feature`, `Scenario`, `Given`, `When`, `Then`, `And`, `Examples`). El contenido va en **español**.
- Cada escenario tiene que poder comprobarse: el `Then` dice exactamente qué debe ver el usuario.
- Si cambias una prueba, revisa que siga diciendo lo mismo que el criterio de aceptación del informe.

## 8. Si algo sale mal

| Problema | Qué hacer |
|---|---|
| `git push` dice que no tienes permiso | Avisa a Mauricio para revisar tu acceso |
| Tu PR dice que hay **conflictos** | En tu rama ejecuta `git pull origin develop`, arregla los archivos marcados, haz commit y vuelve a hacer push |
| Hiciste commit en `develop` por error | No hagas push. Avisa en el grupo antes de hacer cualquier cosa |

## 9. Resumen rápido

```bash
git checkout develop
git pull
git checkout -b feature/mi-tarea
git add US01.feature
git commit -m "test: describe what you did"
git push -u origin feature/mi-tarea
```

Luego abre el PR hacia `develop` en GitHub y espera la revisión de un admin.
