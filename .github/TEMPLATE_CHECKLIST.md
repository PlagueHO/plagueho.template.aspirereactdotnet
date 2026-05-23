---
title: Template Completion Checklist
description: Validation checklist after customizing this template
---

## Identity and Naming

* Project tokens replaced consistently.
* Frontend and backend folder names updated consistently.
* Solution and namespace naming updated consistently.

## Brownfield Gap Assessment

* Target repository classified as Class A, Class B, or Class C before migration.
* Gap assessment completed and saved in the pull request summary.
* Missing required artifact groups identified before applying changes.
* Optional feature gaps identified and explicitly accepted or deferred.

## Required Artifact Presence

* README.md exists and is aligned to template structure guidance.
* TEMPLATE_INSTRUCTIONS.md exists and includes brownfield adoption guidance.
* .github/TEMPLATE_CHECKLIST.md exists and is current.
* .github/copilot-instructions.md exists.
* .github/prompts/template-gap-assessment.prompt.md exists.
* .github/prompts/template-structure-alignment.prompt.md exists.
* .github/prompts/template-migration-pr-summary.prompt.md exists.
* scripts/Rename-TemplateServiceArtifacts.ps1 exists.
* .vscode/tasks.json exists.

## Infrastructure

* Bicep parameters updated.
* Optional infra sections either fully enabled or removed.
* Bicep lint passes.

## Workflows

* Required workflow_dispatch inputs are documented for each deploy, publish, and infra workflow.
* Required workflow_dispatch inputs are provided when running deploy, publish, and infra workflows.
* Optional workflow sections coherent after edits.
* Workflow YAML validates.
* copilot-setup-steps workflow succeeds.

## Required Workflow Presence

* .github/workflows/provision-infrastructure.yml exists.
* .github/workflows/deploy-frontend-app.yml exists.
* .github/workflows/continuous-delivery.yml exists.
* .github/workflows/publish-backend-service.yml exists.
* .github/workflows/lint-and-publish-bicep.yml exists.
* .github/workflows/publish-docs.yml exists.
* .github/workflows/smoke-test.yml exists.
* .github/workflows/deploy-production.yml exists.
* .github/workflows/delete-infrastructure.yml exists.
* .github/workflows/delete-production-infrastructure.yml exists.
* .github/workflows/template-validation.yml exists.
* .github/workflows/post-customization-validation.yml exists.
* .github/workflows/template-conformance.yml exists.

## Optional Feature Decision Record

* OPTIONAL_AI_SERVICES decision is recorded.
* OPTIONAL_BACKGROUND_WORKER decision is recorded.
* OPTIONAL_E2E_PIPELINE decision is recorded.
* OPTIONAL_PRIVATE_NETWORKING decision is recorded.

## Documentation

* Frontmatter present and valid in markdown files.
* README and quickstarts updated for the project.

## Final Validation

* No unresolved required placeholder tokens remain.
* Local build and test commands execute.
* Initial commit prepared.
* Migration pull request includes rollback guidance.

## Command Runbook

1. pwsh ./scripts/Rename-TemplateServiceArtifacts.ps1 -ProjectNamespace Contoso.Catalog
2. pnpm validate:customized
3. pnpm lint:md
4. az bicep lint --file infra/main.bicep
5. dotnet build template-service/Contoso.Catalog.slnx -c Release
