# Prompt
Import-Module posh-git
oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\tokyo.omp.json" | Invoke-Expression

# Terminal Icons
Import-Module Terminal-Icons

# PSReadLine
Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -PredictionViewStyle ListView

# PSFzf
Import-Module PSFzf
Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+f' -PSReadlineChordRevereseHistory 'Ctrl+r'

# Alias
Set-Alias grep findstr
Set-Alias neovim nvim

# Utilities
function which ($command) {
  Get-Command -Name $command -ErrorAction SilentlyContinue | Select-Object -ExpandProperty Path -ErrorAction SilentlyContinue
}

function npm-globals () {
  $counter = 0
  Get-ChildItem -Path "$HOME\AppData\Roaming\npm" -Filter *. | 
  Foreach-Object {
    $package_name = $_.name
    if ("node_modules" -ne $package_name) {
      ++$counter
      echo "[$counter] - $package_name"
    }
  }
}

