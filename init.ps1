# init.ps1 — Requer PowerShell como Administrador

#Requires -RunAsAdministrator

Write-Host "==> Instalando OpenSSH Server..."
Add-WindowsCapability -Online -Name OpenSSH.Server~~~~0.0.1.0

Write-Host "==> Habilitando sshd..."
Start-Service sshd
Set-Service -Name sshd -StartupType Automatic

Write-Host "==> Instalando Tailscale via winget..."
winget install Tailscale.Tailscale

Write-Host ""
Write-Host "==> Tudo pronto!"
Write-Host "    Abra o Tailscale na bandeja, faca login e rode: tailscale ip"
Write-Host "    Use esse IP no Termius (porta 22, usuario: $env:USERNAME)"
