---
title: {{PROJECT_DISPLAY_NAME}}
description: Template repository for React, .NET, Azure Bicep, Azure Developer CLI, and .NET Aspire projects
---

## Overview

This repository is a GitHub template starter for OSS projects that use:

* React frontend
* .NET backend services and workers
* Azure Bicep infrastructure
* Azure Developer CLI deployment
* .NET Aspire local orchestration

## Quick Start

1. Click Use this template in GitHub.
2. Create a new repository from this template.
3. Choose whether to include only the default branch or all branches.
4. Install optional Marketplace apps during repository creation if your organization requires them.
5. Follow the questionnaire in TEMPLATE_INSTRUCTIONS.md.
6. Replace all required placeholders.
7. Run validation checks and commit.

## Template Creation Options

When creating a repository from this template, choose branch scope intentionally:

* Use default branch only for most consumers.
* Use include all branches only when branch variants are intentionally curated and documented.

> [!IMPORTANT]
> Repositories created from template branches can have unrelated histories. Do not plan on pull requests or merges between those branch lineages.

You can also create a repository from this template by using GitHub CLI:

```bash
gh repo create <new-repository-name> --template <owner>/<template-repository>
```

If your organization uses required GitHub Marketplace apps, select them during the template creation flow.

## Customization Runbook

1. Complete the intake questionnaire in TEMPLATE_INSTRUCTIONS.md.
2. Run the namespace rename script to update tokenized backend files and references.
3. Enable or remove optional commented sections consistently.
4. Configure and provide required workflow_dispatch inputs when running deployment workflows.
5. Run validation commands before first release commit.

## Apply To Existing Repositories

Use this template as a structural baseline for brownfield repositories that share the same stack.

1. Run a gap assessment prompt to identify missing and divergent structural artifacts.
2. Apply structural changes in phases and preserve product-specific business logic.
3. Run repository validation after each phase.
4. Open a pull request with a clear migration summary and rollback notes.

Prompt pack for brownfield alignment:

* .github/prompts/template-gap-assessment.prompt.md
* .github/prompts/template-structure-alignment.prompt.md
* .github/prompts/template-migration-pr-summary.prompt.md

Conformance automation:

* .github/workflows/template-conformance.yml validates required template artifacts and workflows.

Recommended migration classes:

* Class A: mostly scaffold-compatible repositories with low drift.
* Class B: repositories with moderate workflow or infrastructure divergence.
* Class C: heavily customized repositories where partial adoption is safer than full alignment.

## Validation Commands

1. pwsh ./scripts/Rename-TemplateServiceArtifacts.ps1 -ProjectNamespace Contoso.Catalog
2. pnpm validate:customized
3. pnpm lint:md
4. az bicep lint --file infra/main.bicep
5. dotnet build template-service/Contoso.Catalog.slnx -c Release

## Template Tokens

Replace all required template tokens:

* {{PROJECT_NAME}}
* {{PROJECT_DISPLAY_NAME}}
* {{GITHUB_OWNER}}
* {{AUTHOR_NAME}}
* {{AUTHOR_EMAIL}}
* {{AZURE_LOCATION}}

## Repository Structure

* template-app: React app scaffold
* template-service: .NET service scaffold
* infra: Bicep infrastructure scaffold
* docs: VitePress docs scaffold
* .github: workflows, issue templates, Copilot guidance

## Next Step

Open TEMPLATE_INSTRUCTIONS.md and complete the intake questionnaire.
