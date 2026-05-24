param(
    [ValidateSet('Template', 'Customized')]
    [string]$Mode = 'Template'
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

$root = Split-Path -Parent $PSScriptRoot
$excluded = @(
    '.git',
    'node_modules',
    '.pnpm-store',
    'dist',
    'coverage',
    'bin',
    'obj'
)

$files = Get-ChildItem -Path $root -Recurse -File | Where-Object {
    $full = $_.FullName
    -not ($excluded | ForEach-Object { $full -like "*$([IO.Path]::DirectorySeparatorChar)$_$([IO.Path]::DirectorySeparatorChar)*" } | Where-Object { $_ })
}

$tokenRegex = [regex]'(?<!\$)\{\{[A-Z0-9_]+\}\}'
$anyDoubleBrace = [regex]'(?<!\$)\{\{.*?\}\}'

$hits = @()
foreach ($file in $files) {
    $content = Get-Content -Path $file.FullName -Raw
    if ($anyDoubleBrace.IsMatch($content)) {
        $matches = $tokenRegex.Matches($content) | ForEach-Object { $_.Value } | Sort-Object -Unique
        $hits += [pscustomobject]@{
            File   = $file.FullName.Replace($root + [IO.Path]::DirectorySeparatorChar, '')
            Tokens = if (@($matches).Count -gt 0) { (@($matches) -join ', ') } else { 'NON_STANDARD_DOUBLE_BRACE_TOKEN' }
        }
    }
}

if ($Mode -eq 'Template') {
    if (@($hits).Count -eq 0) {
        throw 'Template validation failed: no template tokens were found.'
    }

    $invalid = $hits | Where-Object { $_.Tokens -eq 'NON_STANDARD_DOUBLE_BRACE_TOKEN' }
    if (@($invalid).Count -gt 0) {
        $invalid | Format-Table -AutoSize | Out-String | Write-Host
        throw 'Template validation failed: found non-standard double-brace token patterns.'
    }

    Write-Host "Template validation passed. Found tokenized files: $(@($hits).Count)"
    exit 0
}

if ($Mode -eq 'Customized') {
    if (@($hits).Count -gt 0) {
        $hits | Format-Table -AutoSize | Out-String | Write-Host
        "status=uncustomized" >> $env:GITHUB_OUTPUT
        Write-Host 'Customization check: template tokens found. Build will be skipped.'
        exit 0
    }

    "status=customized" >> $env:GITHUB_OUTPUT
    Write-Host 'Customization check passed. No template tokens remain. Build will proceed.'
    exit 0
}
