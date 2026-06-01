# Tutorial 5 — Instalação no macOS

> Pré-requisito: macOS 12 (Monterey) ou mais recente.  
> Se quiser pular tudo isso, use o [`init.sh`](../init.sh) na raiz — ele detecta o macOS automaticamente.

---

## 1. Homebrew (se não tiver)

O Homebrew é o gerenciador de pacotes do macOS. Se não tiver instalado:

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

---

## 2. tmux

```bash
brew install tmux
```

---

## 3. SSH Server (Remote Login)

O macOS já tem OpenSSH — basta habilitar:

```bash
sudo systemsetup -setremotelogin on
```

O serviço sobe automaticamente com o Mac a partir desse momento.

Confirma que está ativo:

```bash
sudo systemsetup -getremotelogin
```

---

## 4. Tailscale

```bash
brew install --cask tailscale
```

Após instalar, o Tailscale aparece na barra de menus. Clica em **Log in** e faz login com a mesma conta usada nos outros dispositivos.

Para pegar o IP:

```bash
tailscale ip
```

---

## Resultado esperado

- SSH escutando na porta `22` e iniciando com o Mac
- Tailscale rodando na barra de menus e iniciando com o Mac
- Mac acessível de qualquer rede pelo IP `100.x.x.x`
