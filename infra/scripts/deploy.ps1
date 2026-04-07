$output = azd env get-values

foreach ($line in $output) {
    if (!$line.Contains('=')) {
        continue
    }
    $name = $line.Split("=")[0]
    $value = $line.Split("=", 2)[1].Trim('"')
    Set-Item -Path "env:\$name" -Value $value
}

Write-Host "Environment variables set."

$commands = @("az", "func")
foreach ($cmd in $commands) {
    if (!(Get-Command $cmd -ErrorAction SilentlyContinue)) {
        Write-Error "Error: $cmd command is not available, check pre-requisites in README.md"
        exit 1
    }
}

func azure functionapp publish $env:AZURE_FUNCTION_NAME --powershell

Write-Host "Deployed successfully."
