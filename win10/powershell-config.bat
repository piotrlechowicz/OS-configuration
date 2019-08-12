:: configures power shell 
:: run it within new instance of power shell

:: disables bell when backspace is clicked
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
if (!(Test-Path -Path "$Profile")) {New-Item -ItemType File -Path "$Profile" -Force}
Add-Content -Value "Set-PSReadlineOption -BellStyle None" -Path "$Profile"