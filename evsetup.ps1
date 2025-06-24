# Run PowerShell as Administrator

# Set execution policy (if needed)
Set-ExecutionPolicy Bypass -Scope Process -Force

# Function to install Visual Studio 2022 Community Edition
function Install-VisualStudio {
    Write-Host "Installing Visual Studio 2022 Community Edition..."

    $vsInstallerUrl = "https://aka.ms/vs/17/release/vs_community.exe"
    $vsInstallerPath = "$env:TEMP\vs_community.exe"

    Invoke-WebRequest -Uri $vsInstallerUrl -OutFile $vsInstallerPath

    Start-Process -FilePath $vsInstallerPath -ArgumentList `
        "--add Microsoft.VisualStudio.Workload.ManagedDesktop", `
        "--add Microsoft.VisualStudio.Workload.NativeDesktop", `
        "--includeRecommended", `
        "--quiet", "--wait", "--norestart" -NoNewWindow -Wait

    Write-Host "Visual Studio installation completed."
}

# Function to install Node.js (LTS)
function Install-NodeJS {
    Write-Host "Installing Node.js LTS..."

    $nodeInstallerUrl = "https://nodejs.org/dist/v20.12.2/node-v20.12.2-x64.msi"
    $nodeInstallerPath = "$env:TEMP\node-lts.msi"

    Invoke-WebRequest -Uri $nodeInstallerUrl -OutFile $nodeInstallerPath
    Start-Process -FilePath "msiexec.exe" -ArgumentList "/i", $nodeInstallerPath, "/quiet", "/norestart" -Wait

    Write-Host "Node.js installation completed."
}

# Function to install Python (latest 3.x version from official source)
function Install-Python {
    Write-Host "Installing Python 3.x..."

    $pythonInstallerUrl = "https://www.python.org/ftp/python/3.12.3/python-3.12.3-amd64.exe"
    $pythonInstallerPath = "$env:TEMP\python-installer.exe"

    Invoke-WebRequest -Uri $pythonInstallerUrl -OutFile $pythonInstallerPath
    Start-Process -FilePath $pythonInstallerPath -ArgumentList "/quiet InstallAllUsers=1 PrependPath=1" -Wait

    Write-Host "Python installation completed."
}

# Run all install functions
Install-VisualStudio
Install-NodeJS
Install-Python

Write-Host "✅ All tools installed successfully."
