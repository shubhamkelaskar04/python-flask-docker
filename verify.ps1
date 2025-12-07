# verify.ps1 - calls / and /health and prints results
try {
    Write-Host "Calling http://localhost:5000/"
    $root = Invoke-RestMethod http://localhost:5000/ -ErrorAction Stop
    Write-Host "Root response:`n" $root
} catch {
    Write-Host "Failed to call root endpoint:`n" $_.Exception.Message
}

try {
    Write-Host "Calling http://localhost:5000/health"
    $health = Invoke-RestMethod http://localhost:5000/health -ErrorAction Stop
    Write-Host "Health response:`n" ($health | ConvertTo-Json)
} catch {
    Write-Host "Failed to call health endpoint:`n" $_.Exception.Message
}