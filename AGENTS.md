---
title: Agent Guidance
description: Guidance for AI coding agents customizing this template repository
---

## Purpose

This repository is a template. Agents should optimize for reusable scaffolding, not business logic.

## Required Behavior

* Ask and record answers to the questionnaire in TEMPLATE_INSTRUCTIONS.md.
* Replace all required placeholders consistently.
* Use commented OPTIONAL sections for feature switches.
* Keep naming parallelism strict across files and settings.

## Architecture Defaults

* Frontend folder: {{PROJECT_NAME}}-app
* Backend folder: {{PROJECT_NAME}}-service
* Deployment: Azure Developer CLI with Bicep
* Local orchestration: .NET Aspire AppHost

## Validation Rules

* Ensure all workflow references map to documented secrets or variables.
* Ensure docs have required frontmatter.
* Ensure solution and project naming follows token rules.
