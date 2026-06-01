# Tutorial 4 — Instalação no Windows

> Pré-requisito: Windows 10 (build 1809+) ou Windows 11.  
> Todos os comandos rodam no **PowerShell como Administrador**.  
> Se quiser pular tudo isso, use o [`init.ps1`](../init.ps1) na raiz do projeto.

---

## 1. OpenSSH Server

O Windows 10/11 já inclui o OpenSSH — basta habilitar:

```powershell
Add-WindowsCapability -Online -Name OpenSSH.Server~~~~0.0.1.0
Start-Service sshd
Set-Service -Name sshd -StartupType Automatic
```

Confirma que está rodando:

```powershell
Get-Service sshd
```

---

## 2. Tailscale

```powershell
winget install Tailscale.Tailscale
```

Após instalar, o Tailscale abre na bandeja do sistema. Clica em **Log in** e faz login com a mesma conta usada nos outros dispositivos.

Para pegar o IP:

```powershell
tailscale ip
```

---

## 3. tmux (opcional — via WSL)

tmux não existe nativamente no Windows. Opções:

| Opção | Quando usar |
|---|---|
| **Sem tmux** | Conexões rápidas — se cair, reconecta e abre um novo terminal |
| **WSL + tmux** | Se quiser sessões persistentes — instala o WSL e usa `tmux` dentro dele |

Para instalar WSL (caso queira):

```powershell
wsl --install
```

Depois, dentro do WSL:

```bash
sudo apt install -y tmux
```

---

## Resultado esperado

- SSH escutando na porta `22` e iniciando com o Windows
- Tailscale rodando na bandeja e iniciando com o Windows
- PC acessível de qualquer rede pelo IP `100.x.x.x`
