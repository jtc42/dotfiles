echo "Configuring execution policy..."
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser

$profileDestination = $profile ? $profile : "~\Documents\PowerShell\Microsoft.PowerShell_profile.ps1"

echo "Linking profile to ${profileDestination}..."
New-Item -Path $profileDestination -ItemType SymbolicLink -Value (Get-Item ".\Microsoft.PowerShell_profile.ps1").FullName

# Install packages required for profile

# Install scoop

if ((Get-Command "scoop" -ErrorAction SilentlyContinue) -eq $null) 
{ 
    $confirmation = Read-Host "No installation of scoop found. Install now? (y/n)"
    if ($confirmation -eq 'y') {
        irm get.scoop.sh | iex
        scoop config aria2-enabled true
        scoop config aria2-warning-enabled false
    }
}

# Install shell essentials with scoop

$confirmation = Read-Host "Install basic shell utilities with scoop? (y/n)"
if ($confirmation -eq 'y') {
    scoop install sudo curl grep less nano micro sed telnet touch wget which
}

# Install handy extras

$confirmation = Read-Host "Install extra applications and tools? (y/n)"
if ($confirmation -eq 'y') {
    echo "Installing voidtools.Everything..."
    winget install --id voidtools.Everything --source winget
    echo "Installing PowerToys..."
    winget install Microsoft.PowerToys --source winget
    echo "Installing 7zip..."
    winget install --id 7zip.7zip --source winget
    echo "Installing VSCode..."
    winget install --id Microsoft.VisualStudioCode --source winget
}