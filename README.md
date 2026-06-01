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

Em qualquer distro baseada em `apt` ou `dnf`:

```bash
git clone https://github.com/seu-usuario/ssh-from-anywhere
cd ssh-from-anywhere
./init.sh
```

O script detecta a distro, instala tudo e sobe o Tailscale automaticamente.

---

## Passo a passo (manual)

1. [Instalação no PC](tutoriais/01-instalacao.md) — OpenSSH, tmux e Tailscale
2. [Configuração no celular](tutoriais/02-celular.md) — Tailscale + Termius
3. [Usando o tmux](tutoriais/03-tmux.md) — sessões persistentes

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