Write-Output "Configuring execution policy..."
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser

$profileDestination = $profile ? $profile : "~\Documents\PowerShell\Microsoft.PowerShell_profile.ps1"

Write-Output "Linking profile to ${profileDestination}..."
New-Item -Path $profileDestination -ItemType SymbolicLink -Value (Get-Item ".\Microsoft.PowerShell_profile.ps1").FullName
