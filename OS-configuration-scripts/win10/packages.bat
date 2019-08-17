:: Run in Command Prompt with elevated privileges
:: This script will install both the Chocolatey.exe file and add the choco 
:: command to your Path variable

@powershell -NoProfile -ExecutionPolicy Bypass -Command "iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))" && SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"

:: install all the packages
:: -y confirm yes for any prompt during the install process

:: staff for working
choco install -y firefox
choco install -y notepadplusplus
choco install -y virtualbox
choco install -y totalcommander
choco install -y sandboxie
choco install -y vim
choco install -y atom
choco install -y GoogleChrome
choco install -y winamp
choco install -y filezilla
choco install -y microsoft-windows-terminala
choco install -y googledrive
choco install -y keepassxc
choco install -y winrar

:: Email client
choco install -y mailspring

::screen-casting
choco install -y sharex

:: staff for gaming
choco install -y goggalaxy

:: music
choco install -y spotify

:: enable WSL
Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux	