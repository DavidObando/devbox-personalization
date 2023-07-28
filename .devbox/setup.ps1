# dev box customization script

# install oh-my-posh
winget install JanDeDobbeleer.OhMyPosh -s winget

# copy directory .\Cursors to C:\Users\daobando\AppData\Local\Microsoft\Windows
$source = ".\Cursors"
$destination = "C:\Users\daobando\AppData\Local\Microsoft\Windows"
Copy-Item -Path $source -Destination $destination -Recurse -Force

# install required fonts
C:\Users\daobando\AppData\Local\Programs\oh-my-posh\bin\oh-my-posh.exe font install Meslo

# set windows terminal settings
$filePath = ".\terminalsettings.json"
$destination = "C:\Users\daobando\AppData\Local\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json"
Copy-Item -Path $filePath -Destination $destination -Force


# apply registry settings from file Cursor.reg
$filePath = ".\Cursor.reg"
reg import $filePath

# download https://github.com/valinet/ExplorerPatcher/releases/download/22621.1992.56.1_53ff541/ep_setup.exe to temp directory
$url = "https://github.com/valinet/ExplorerPatcher/releases/download/22621.1992.56.1_53ff541/ep_setup.exe"
$filePath = "$env:TEMP\ep_setup.exe"
Invoke-WebRequest -Uri $url -OutFile $filePath

# install ExplorerPatcher
Start-Process -FilePath $filePath -ArgumentList "/S" -Wait

# apply registry settings from file ExplorerPatcher_22621.1555.55.1.reg
$filePath = ".\ExplorerPatcher_22621.1555.55.1.reg"
reg import $filePath

# restart explorer
Stop-Process -Name explorer
# wait 15 seconds
Start-Sleep -Seconds 15
# start explorer
Start-Process -FilePath explorer.exe