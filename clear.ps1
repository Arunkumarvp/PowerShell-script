# Clear Temp and Prefetch folders script
# Run this script as Administrator

# Function to delete all files and folders from a specified path
function Clear-Folder($folderPath) {
    if (Test-Path $folderPath) {
        try {
            Get-ChildItem -Path $folderPath -Recurse -Force -ErrorAction SilentlyContinue | Remove-Item -Recurse -Force -ErrorAction SilentlyContinue
            Write-Host "Cleared: $folderPath" -ForegroundColor Green
        } catch {
            Write-Warning "Failed to clear: $folderPath"
        }
    } else {
        Write-Warning "Path does not exist: $folderPath"
    }
}

# Paths to clear
$tempPath = "$env:TEMP"
$windowsTempPath = "C:\Windows\Temp"
$prefetchPath = "C:\Windows\Prefetch"

# Clear folders
Clear-Folder -folderPath $tempPath
Clear-Folder -folderPath $windowsTempPath
Clear-Folder -folderPath $prefetchPath
