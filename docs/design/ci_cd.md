---
title: CI and CD Design
description: Workflow structure and release promotion guidance for template projects
---

## Pipeline Layers

* CI for build, lint, and tests
* CD for provisioning and deployment
* Optional quality gates such as CodeQL and dependency review

## Environment Strategy

Use staged deployment where required and protect production workflows with approvals.
