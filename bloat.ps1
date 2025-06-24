# Run this script as Administrator
Write-Output "Starting bloatware removal..."

# List of apps to remove (safe for most users)
$apps = @(
    "Microsoft.3DBuilder",
    "Microsoft.XboxApp",
    "Microsoft.XboxGameOverlay",
    "Microsoft.XboxGamingOverlay",
    "Microsoft.XboxSpeechToTextOverlay",
    "Microsoft.Xbox.TCUI",
    "Microsoft.XboxIdentityProvider",
    "Microsoft.ZuneMusic",           # Groove Music
    "Microsoft.ZuneVideo",           # Movies & TV
    "Microsoft.GetHelp",
    "Microsoft.Getstarted",
    "Microsoft.BingWeather",
    "Microsoft.MicrosoftOfficeHub",
    "Microsoft.SkypeApp",
    "Microsoft.MicrosoftSolitaireCollection",
    "Microsoft.People",
    "Microsoft.MixedReality.Portal",
    "Microsoft.Microsoft3DViewer",
    "Microsoft.WindowsAlarms",
    "Microsoft.WindowsCamera",
    "Microsoft.WindowsMaps",
    "Microsoft.OneConnect",
    "Microsoft.MicrosoftStickyNotes",
    "Microsoft.YourPhone",
    "Microsoft.Todos",
    "Microsoft.PowerAutomateDesktop"
)

foreach ($app in $apps) {
    Write-Output "Trying to remove $app..."
    Get-AppxPackage -Name $app -AllUsers | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxProvisionedPackage -Online | Where-Object {$_.DisplayName -eq $app} | Remove-AppxProvisionedPackage -Online -ErrorAction SilentlyContinue
}

Write-Output "Removing pre-installed third-party apps like Candy Crush, etc."
# Remove all third-party provisioned apps (optional)
Get-AppxPackage -AllUsers | Where-Object {$_.Name -like "*king.com*" -or $_.Name -like "*EclipseManager*" -or $_.Name -like "*duolingo*"} | Remove-AppxPackage

Write-Output "Cleaning up preinstalled services..."
# Disable Cortana (optional)
Get-AppxPackage -allusers Microsoft.549981C3F5F10 | Remove-AppxPackage

Write-Output "Bloatware removal completed!"
