# This script is designed to be run at startup and performs the following actions:
# need to open visual studio code with the current directory
$currentDirectory = Get-Location
Start-Process "code" -ArgumentList $currentDirectory

# Wait a few seconds to let VS Code launch
Start-Sleep -Seconds 2

# and open the browser last history tab
# to open the last history tab in the browser
$shell = New-Object -ComObject Shell.Application
$ie = $shell.Windows() | Where-Object { $_.Name -eq "Windows Internet Explorer" }
if ($ie) {
    $ie.Navigate("javascript:history.go(-1)")
} else {
    # If IE is not open, try with default browser using Chrome-style command
    Start-Process "chrome" -ArgumentList "--restore-last-session"
}




# and open the browser last history tab
# to open the last history tab in the browser
