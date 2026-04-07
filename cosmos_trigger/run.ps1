param($InputDocuments, $TriggerMetadata)

if ($InputDocuments -and $InputDocuments.Count -gt 0) {
    Write-Host "Documents modified: $($InputDocuments.Count)"
    Write-Host "First document Id: $($InputDocuments[0].id)"
}
