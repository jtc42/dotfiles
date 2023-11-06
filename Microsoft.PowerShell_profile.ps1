# Imports
Import-Module PSColor

# Increase history
$MaximumHistoryCount = 10000

# Show selection menu for tab
Set-PSReadlineKeyHandler -Chord Tab -Function MenuComplete

# Useful aliases

## WSL
Set-Alias $ wsl.exe -Option AllScope

## Python environments
function New-Venv {
    & 'python3' '-m' 'venv' './.venv'
}

function Set-Venv {
    & ./.venv/Scripts/Activate.ps1
}

Set-Alias ve New-Venv
Set-Alias va Set-Venv

# HELPER FUNCTIONS
# Pkill
function pkill($name) {
    Get-Process $name -ErrorAction SilentlyContinue | killy
}

# Reload profile (and thus path)
function Update-Profile {
	& $profile
}

# Merge machine and user paths explicitally
$Env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")

# Add local user Scripts directory to the path
$Env:Path += ";$($env:USERPROFILE)\Scripts"

# Invoke Starship prompt
Invoke-Expression (&starship init powershell)