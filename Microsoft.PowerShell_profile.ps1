# Imports
Import-Module PSColor

# Increase history
$MaximumHistoryCount = 10000

# Show selection menu for tab
Set-PSReadlineKeyHandler -Chord Tab -Function MenuComplete

# Useful aliases
Set-Alias $ wsl.exe -Option AllScope

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