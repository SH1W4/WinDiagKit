# Orbit-DevOps: Environment Snapshot
# Exports installed packages (Winget) to a JSON stack file

param (
    [string]$OutputPath = ".\dev-stack.json"
)

Write-Host "🪐 Orbit-DevOps: Environment Snapshot" -ForegroundColor Cyan

if (-not (Get-Command winget -ErrorAction SilentlyContinue)) {
    Write-Error "Winget is not installed or not in PATH."
    exit 1
}

Write-Host "Exporting installed packages..." -ForegroundColor Yellow
try {
    winget export -o $OutputPath --include-versions
    Write-Host "Snapshot saved to: $OutputPath" -ForegroundColor Green
    Write-Host "To restore on another machine: winget import -i $OutputPath" -ForegroundColor Gray
} catch {
    Write-Error "Failed to export packages: $_"
}
