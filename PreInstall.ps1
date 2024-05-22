# Install essential winget packages
winget install --id Git.Git --source winget
winget install --id Microsoft.Powershell --source winget
winget install --id Starship.Starship --source winget
winget install --id Microsoft.WindowsTerminal --source winget

# Enable essential features
Add-WindowsCapability -Online -Name OpenSSH.Client~~~~0.0.1.0
