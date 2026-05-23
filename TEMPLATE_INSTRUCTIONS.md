---
title: Template Instructions
description: Question-driven instructions for AI agents and maintainers to customize this template
---

## Intake Questionnaire

1. Project identity
   1. Project slug (kebab-case): {{PROJECT_NAME}}
   2. Display name: {{PROJECT_DISPLAY_NAME}}
   3. GitHub owner: {{GITHUB_OWNER}}
   4. Author name and email: {{AUTHOR_NAME}}, {{AUTHOR_EMAIL}}
2. Frontend decisions
   1. State management: Redux Toolkit, Zustand, or Context
   2. UI primitives: Shadcn and Radix, Fluent UI, or custom
   3. Styling: TailwindCSS, CSS Modules, or plain CSS
   4. Auth: Entra ID (MSAL) or none
3. Backend and data decisions
   1. Primary database: Cosmos DB, PostgreSQL, SQL, or none
   2. Worker services required: yes or no
   3. API client SDK required: yes or no
4. Infrastructure decisions
   1. Private networking required: yes or no
   2. Frontend hosting: Static Web App or Container App
   3. Backend hosting: Container Apps or App Service
   4. Optional AI services: Search, OpenAI, Foundry
5. CI and release decisions
   1. Environments: staging and production, or production only
   2. E2E tests in pipeline: yes or no
   3. CodeQL and dependency review enabled: yes or no

## Repository Creation Decisions

Before applying template customization, confirm these repository creation choices:

1. Branch scope
   1. Default branch only is recommended for most consumers.
   2. Include all branches only when branch variants are intentionally curated for different starting points.
2. Marketplace apps
   1. Install required organization Marketplace apps during creation when applicable.
3. Visibility and owner
   1. Confirm owner and visibility at creation time to avoid immediate post-create policy churn.

> [!IMPORTANT]
> Repositories created from template branches can have unrelated histories. Do not expect cross-branch pull requests or merges between those independent lineages.

Optional GitHub CLI path for automation-friendly creation:

```bash
gh repo create <new-repository-name> --template <owner>/<template-repository>
```

## Apply To Existing Repositories

Use this section when aligning a brownfield repository to this template structure.

### Required Structural Baseline

The following artifact groups are required for baseline alignment:

* Root documentation: README.md, TEMPLATE_INSTRUCTIONS.md, .github/TEMPLATE_CHECKLIST.md
* Copilot guidance: .github/copilot-instructions.md and prompt pack in .github/prompts
* Core workflows: deploy, publish, validation, and smoke test workflows under .github/workflows
* Core scripts: scripts/Rename-TemplateServiceArtifacts.ps1
* Core task automation: .vscode/tasks.json

### Optional Structural Baseline

Optional sections should be adopted only when the target repository needs the capability:

* OPTIONAL_AI_SERVICES
* OPTIONAL_BACKGROUND_WORKER
* OPTIONAL_E2E_PIPELINE
* OPTIONAL_PRIVATE_NETWORKING

### Safe Adoption Order

Apply changes in this order to reduce migration risk:

1. Documentation and checklist alignment.
2. Copilot guidance and prompt pack alignment.
3. Workflow and automation alignment.
4. Infrastructure structure alignment.
5. Application structure alignment.
6. Validation and smoke test execution.

### Breaking Change Flags

Treat these changes as high risk and isolate them in dedicated pull requests:

* Namespace or solution identity changes.
* Workflow input contract changes.
* Environment naming changes.
* Infrastructure resource naming changes.

### Rollback Guidance

If a migration phase fails validation:

1. Revert the migration branch to the previous passing commit.
2. Reduce scope and re-apply only one artifact group at a time.
3. Re-run validation commands before continuing.

### Copilot Prompt Workflow

Use prompts in this sequence for brownfield alignment:

1. .github/prompts/template-gap-assessment.prompt.md
2. .github/prompts/template-structure-alignment.prompt.md
3. .github/prompts/template-migration-pr-summary.prompt.md

### Conformance Workflow

Use .github/workflows/template-conformance.yml to detect structural drift in required template artifacts.

## Replacement Map

| Token | Format | Example |
| --- | --- | --- |
| {{PROJECT_NAME}} | kebab-case | contoso-catalog |
| {{PROJECT_DISPLAY_NAME}} | title case | Contoso Catalog |
| {{PROJECT_NAMESPACE}} | PascalCase dot notation | Contoso.Catalog |
| {{GITHUB_OWNER}} | org or user | contoso |
| {{AUTHOR_NAME}} | plain text | Jane Doe |
| {{AUTHOR_EMAIL}} | email | jane_at_contoso_dot_com |
| {{AZURE_LOCATION}} | Azure region | eastus2 |

## Filename Token Policy

Some files intentionally use tokenized names for project and solution identity:

* template-service/{{PROJECT_NAMESPACE}}.slnx
* template-service/src/Api/{{PROJECT_NAMESPACE}}.Api.csproj
* template-service/src/Domain/{{PROJECT_NAMESPACE}}.Domain.csproj
* template-service/src/Infrastructure/{{PROJECT_NAMESPACE}}.Infrastructure.csproj
* template-service/src/Orchestration/AppHost/{{PROJECT_NAMESPACE}}.AppHost.csproj
* template-service/src/Orchestration/ServiceDefaults/{{PROJECT_NAMESPACE}}.ServiceDefaults.csproj

When customizing, rename these files and update all project references in one pass.

Use the automation script to perform namespace token replacement and file renames:

1. pwsh ./scripts/Rename-TemplateServiceArtifacts.ps1 -ProjectNamespace Contoso.Catalog -WhatIf
2. pwsh ./scripts/Rename-TemplateServiceArtifacts.ps1 -ProjectNamespace Contoso.Catalog

## Optional Sections

Optional capabilities are controlled with commented markers.

* OPTIONAL_AI_SERVICES
* OPTIONAL_BACKGROUND_WORKER
* OPTIONAL_E2E_PIPELINE
* OPTIONAL_PRIVATE_NETWORKING

When enabling an optional section, remove surrounding comments and complete all related references. When disabling, remove section cleanly with no dangling refs.

## Secrets and Variables Inventory

| Name | Type | Scope | Required | Used By |
| --- | --- | --- | --- | --- |
| azureClientId | workflow_dispatch input | Workflow run | Required | deploy and publish workflows |
| azureTenantId | workflow_dispatch input | Workflow run | Required | deploy and publish workflows |
| azureSubscriptionId | workflow_dispatch input | Workflow run | Required | deploy and publish workflows |
| azureLocation | workflow_dispatch input | Workflow run | Required | azd-based deploy and infra workflows |
| azdEnvironmentName | workflow_dispatch input | Workflow run | Required | provision-infrastructure, deploy-frontend-app, delete-infrastructure |
| serviceName | workflow_dispatch input | Workflow run | Required | deploy-frontend-app |
| stagingEnvironmentName | workflow_dispatch input | Workflow run | Required | continuous-delivery |
| productionEnvironmentName | workflow_dispatch input | Workflow run | Required | continuous-delivery, deploy-production, delete-production-infrastructure |
| containerRegistryName | workflow_dispatch input | Workflow run | Required | publish-backend-service |
| imageRepository | workflow_dispatch input | Workflow run | Required | publish-backend-service |
| imageTag | workflow_dispatch input | Workflow run | Required | publish-backend-service |
| artifactName | workflow_dispatch input | Workflow run | Required | lint-and-publish-bicep |

## Workflow to Secret and Variable Mapping

| Workflow | Required Inputs |
| --- | --- |
| .github/workflows/provision-infrastructure.yml | workflow_dispatch inputs: azureClientId, azureTenantId, azureSubscriptionId, azureLocation, azdEnvironmentName |
| .github/workflows/deploy-frontend-app.yml | workflow_dispatch inputs: azureClientId, azureTenantId, azureSubscriptionId, azureLocation, azdEnvironmentName, serviceName |
| .github/workflows/continuous-delivery.yml | workflow_dispatch inputs: azureClientId, azureTenantId, azureSubscriptionId, azureLocation, stagingEnvironmentName, productionEnvironmentName |
| .github/workflows/publish-backend-service.yml | workflow_dispatch inputs: azureClientId, azureTenantId, azureSubscriptionId, containerRegistryName, imageRepository, imageTag |
| .github/workflows/lint-and-publish-bicep.yml | workflow_dispatch inputs: artifactName |
| .github/workflows/publish-docs.yml | none |
| .github/workflows/smoke-test.yml | none |
| .github/workflows/deploy-production.yml | workflow_dispatch inputs: azureClientId, azureTenantId, azureSubscriptionId, azureLocation, productionEnvironmentName |
| .github/workflows/delete-infrastructure.yml | workflow_dispatch inputs: azureClientId, azureTenantId, azureSubscriptionId, azureLocation, azdEnvironmentName |
| .github/workflows/delete-production-infrastructure.yml | workflow_dispatch inputs: azureClientId, azureTenantId, azureSubscriptionId, azureLocation, productionEnvironmentName |
| .github/workflows/template-validation.yml | none |
| .github/workflows/post-customization-validation.yml | none |

## Agent Procedure

1. Collect answers to the questionnaire.
2. Apply token replacements across all files.
3. Enable or remove optional sections.
4. Validate workflows, docs frontmatter, and Bicep lint.
5. Run checklist in .github/TEMPLATE_CHECKLIST.md.

## Validation Commands

Run these commands after customization:

1. pwsh ./scripts/Rename-TemplateServiceArtifacts.ps1 -ProjectNamespace Contoso.Catalog
2. pnpm validate:customized
3. pnpm lint:md
4. az bicep lint --file infra/main.bicep
5. dotnet build template-service/Contoso.Catalog.slnx -c Release
