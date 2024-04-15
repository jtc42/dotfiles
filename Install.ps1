# Install packages required for profile

# Install scoop

if ($null -eq (Get-Command "scoop" -ErrorAction SilentlyContinue)) 
{ 
    $confirmation = Read-Host "No installation of scoop found. Install now? (y/n)"
    if ($confirmation -eq 'y') {
        Invoke-RestMethod get.scoop.sh | Invoke-Expression
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
    Write-Output "Installing voidtools.Everything..."
    winget install --id voidtools.Everything --source winget
    Write-Output "Installing PowerToys..."
    winget install Microsoft.PowerToys --source winget
    Write-Output "Installing VSCode..."
    winget install --id Microsoft.VisualStudioCode --source winget
}
