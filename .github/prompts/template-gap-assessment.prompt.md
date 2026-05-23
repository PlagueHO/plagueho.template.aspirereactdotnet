---
description: Generate a structural gap assessment report for aligning a repository to this template baseline
argument-hint: "sourceTemplatePath=... [targetRepositoryPath=.] [outputPath=.copilot-tracking/template-gap-report.md]"
---

# Template Gap Assessment

## Inputs

- ${input:sourceTemplatePath}: (Required) Path or URL to the baseline template repository.
- ${input:targetRepositoryPath:.}: (Optional) Path to the target repository.
- ${input:outputPath:.copilot-tracking/template-gap-report.md}: (Optional) Report output path.

## Requirements

1. Assess the target repository structure against the baseline template structure.
2. Focus on structural alignment only and do not modify business logic.
3. Classify migration complexity as Class A, Class B, or Class C.
4. Identify required missing artifacts.
5. Identify optional feature differences and mark each as adopt, defer, or skip.
6. Identify workflow input contract differences and naming mismatches.
7. Provide risk flags for high-impact changes:
   1. Namespace or solution identity changes.
   2. Workflow input contract changes.
   3. Environment naming changes.
   4. Infrastructure naming changes.
8. Generate a phased migration plan with validation checkpoints after each phase.
9. Write the report to ${input:outputPath}.

## Required Output Sections

The report must include these sections in order:

1. Executive summary.
2. Migration class and rationale.
3. Required artifact gaps.
4. Optional feature gaps.
5. Workflow and automation gaps.
6. Risk flags.
7. Recommended phased plan.
8. Validation commands.
9. Rollback strategy.
