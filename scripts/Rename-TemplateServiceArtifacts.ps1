param(
    [string]$ProjectNamespace,
    [switch]$WhatIf
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

if ([string]::IsNullOrWhiteSpace($ProjectNamespace)) {
    throw 'ProjectNamespace is required.'
}

if ($ProjectNamespace -notmatch '^[A-Za-z][A-Za-z0-9]*(\.[A-Za-z][A-Za-z0-9]*)*$') {
    throw 'ProjectNamespace must use dot-delimited PascalCase segments, for example: Contoso.Catalog'
}

$token = '{{PROJECT_NAMESPACE}}'
$templateServiceRoot = Join-Path -Path (Split-Path -Parent $PSScriptRoot) -ChildPath 'template-service'

if (-not (Test-Path -Path $templateServiceRoot)) {
    throw "Template service root was not found: $templateServiceRoot"
}

$files = Get-ChildItem -Path $templateServiceRoot -File -Recurse

foreach ($file in $files) {
    $content = Get-Content -Path $file.FullName -Raw
    if ($content.Contains($token)) {
        $updated = $content.Replace($token, $ProjectNamespace)
        if ($WhatIf) {
            Write-Host "[WhatIf] Update tokenized content in $($file.FullName)"
        }
        else {
            Set-Content -Path $file.FullName -Value $updated -NoNewline
        }
    }
}

$tokenizedFiles = Get-ChildItem -Path $templateServiceRoot -File -Recurse | Where-Object {
    $_.Name.Contains($token)
} | Sort-Object -Property FullName -Descending

foreach ($file in $tokenizedFiles) {
    $newName = $file.Name.Replace($token, $ProjectNamespace)
    if ($WhatIf) {
        Write-Host "[WhatIf] Rename $($file.FullName) to $newName"
    }
    else {
        Rename-Item -Path $file.FullName -NewName $newName
    }
}

Write-Host "Completed token replacement for template-service using namespace '$ProjectNamespace'."
