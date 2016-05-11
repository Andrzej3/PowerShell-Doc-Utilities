﻿$mdDocumentsFolder = "C:\GIT\PowerShell-Docs\scripting"

$emptyLinePattern = '^\s*$'
$beginEndMatadataBlockPattern = '^---\s*$'
$metadataContentPattern ='^[A-Za-z._]+\s*:[^:]*$'

$newMetadata = @{
"title" = "" 
"description" = "" 
"keywords" = "powershell,cmdlet" 
"author" = "jpjofre" 
"manager" = "dongill" 
"ms.date" = [DateTime]::Now.ToString("yyyy-MM-dd")
"ms.topic" = "article"
"ms.prod" = "powershell"
}

$oldMetadata = @{}
Get-ChildItem -Path $mdDocumentsFolder -Filter "*.md" -Recurse |`
    Where-Object { (-not $_.PSIsContainer) -and ($_.FullName -notlike "*.ignore*") } |`
    ForEach-Object { 