---
description: Generate a pull request description for template-structure migration using gap and alignment outputs
argument-hint: "gapReportPath=.copilot-tracking/template-gap-report.md alignmentSummaryPath=.copilot-tracking/template-alignment-summary.md [outputPath=.copilot-tracking/template-migration-pr-summary.md]"
---

# Template Migration PR Summary

## Inputs

* ${input:gapReportPath:.copilot-tracking/template-gap-report.md}: (Optional) Gap report from template-gap-assessment.prompt.md.
* ${input:alignmentSummaryPath:.copilot-tracking/template-alignment-summary.md}: (Optional) Alignment summary from template-structure-alignment.prompt.md.
* ${input:outputPath:.copilot-tracking/template-migration-pr-summary.md}: (Optional) Output path for pull request summary.

## Requirements

1. Read ${input:gapReportPath} and ${input:alignmentSummaryPath}.
2. Produce a pull request description focused on structural migration outcomes.
3. Clearly separate completed work, deferred work, and known risks.
4. Include validation outcomes and any failed checks that were remediated.
5. Include rollback guidance for high-impact changes.
6. Avoid implementation speculation not supported by the source artifacts.
7. Write the final pull request summary to ${input:outputPath}.

## Required Output Sections

The pull request summary must include these sections in order:

1. Summary.
2. Migration scope.
3. Structural changes applied.
4. Validation results.
5. Deferred items.
6. Risks and mitigations.
7. Rollback guidance.