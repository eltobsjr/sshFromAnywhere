# ssh-from-anywhere

Acesse seu PC pelo celular de qualquer lugar, usando SSH + Tailscale + Termius — sem abrir portas no roteador, sem IP fixo, sem configuração complicada.

---

## Como funciona

```
Celular → Tailscale (VPN) → PC em casa → SSH → terminal
```

O Tailscale cria uma rede privada entre seus dispositivos. O SSH permite controlar o PC via terminal. O tmux mantém tudo rodando mesmo se a conexão cair.

---

## Instalação rápida

**Linux** (apt ou dnf) — uma linha, sem precisar clonar:
```bash
curl -fsSL https://raw.githubusercontent.com/eltobsjr/sshFromAnywhere/main/init.sh | sh
```

Ou clonando:
```bash
git clone https://github.com/eltobsjr/sshFromAnywhere.git
cd sshFromAnywhere
./init.sh
```

---

**Windows** (PowerShell como Administrador) — uma linha:
```powershell
irm https://raw.githubusercontent.com/eltobsjr/sshFromAnywhere/main/init.ps1 | iex
```

Ou clonando:
```powershell
git clone https://github.com/eltobsjr/sshFromAnywhere.git
cd sshFromAnywhere
.\init.ps1
```

Os scripts detectam o ambiente, instalam tudo e sobem o Tailscale automaticamente.

---

## Passo a passo (manual)

1. [Instalação no Linux](tutoriais/01-instalacao.md) — OpenSSH, tmux e Tailscale
2. [Instalação no Windows](tutoriais/04-windows.md) — OpenSSH, Tailscale e WSL
3. [Configuração no celular](tutoriais/02-celular.md) — Tailscale + Termius
4. [Usando o tmux](tutoriais/03-tmux.md) — sessões persistentes

---

## Uso diário

No celular:
1. Abre o **Tailscale** e ativa a VPN
2. Abre o **Termius** e conecta no host salvo
3. Digita `tmux attach` para voltar onde parou

No PC: não precisa fazer nada — SSH e Tailscale sobem automaticamente no boot.

---

## Glossário

| Termo | O que é |
|---|---|
| **SSH** | Protocolo para acessar o terminal de outro computador com segurança |
| **OpenSSH** | Implementação do SSH — é o servidor que roda no PC e aceita conexões |
| **Tailscale** | VPN peer-to-peer que conecta seus dispositivos sem precisar abrir portas no roteador |
| **IP Tailscale** | Endereço privado (`100.x.x.x`) que o Tailscale atribui ao seu PC — use ele no Termius |
| **tmux** | Multiplexador de terminal — mantém sessões vivas mesmo se a conexão cair |
| **Termius** | App de SSH para celular (Android/iOS) |
| **VPN** | Rede privada virtual — cria um túnel seguro entre dispositivos |
| **systemctl** | Ferramenta do Linux para gerenciar serviços (iniciar, parar, habilitar no boot) |