---
title: Contributing
description: Contribution guidelines for the template repository
---

## Before You Start

Thank you for contributing to this template repository.

Use these defaults when setting up your environment:

* Node.js 22 LTS
* pnpm 10+
* .NET 10 SDK
* Docker Desktop

## Local Setup

1. Fork and clone the repository.
1. Install frontend dependencies.
1. Restore backend dependencies.

```powershell
cd template-app
pnpm install

cd ..\template-service
dotnet restore *.slnx
```

## Development Workflows

Run the full stack locally with Aspire:

```powershell
cd template-service
dotnet run --project src/Orchestration/AppHost/Contoso.Catalog.AppHost.csproj
```

Run frontend-only development:

```powershell
cd template-app
pnpm dev
```

## Quality Gates

Before opening a pull request, run the same core checks used in CI:

```powershell
# Frontend
cd template-app
pnpm lint
pnpm test

# Backend
cd ..\template-service
dotnet format *.slnx --verify-no-changes
dotnet test --solution *.slnx --filter TestCategory=Unit

# Markdown
cd ..
pnpm lint:md
```

## Template Expectations

In addition to general code quality checks:

* Keep placeholder naming consistent.
* Keep workflows valid YAML after template updates.
* Keep docs frontmatter valid and complete.
* Do not commit generated artifacts.

## Pull Requests

When submitting a pull request:

* Keep changes scoped to one problem.
* Include tests or explain why tests are not needed.
* Update documentation when behavior changes.
* Use the pull request template and reference related issues.

## Pull Request Checklist

* Confirm no unresolved {{TOKEN}} placeholders remain unless intentionally deferred.
* Confirm markdown lint passes.
* Confirm Bicep lint passes for infra files.
* Confirm template instructions reflect every customizable file.

## Reporting Bugs and Requesting Features

Use GitHub issue templates for:

* Bug reports
* Feature requests
* Maintenance chores

Include clear reproduction steps and expected behavior.

## Code Style

Follow repository conventions defined in:

* AGENTS.md
* .github/copilot-instructions.md
* .github/instructions/*.instructions.md
