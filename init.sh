#!/usr/bin/env bash
set -euo pipefail

# --- detecta OS e gerenciador de pacotes ---
OS=$(uname -s)

if [ "$OS" = "Darwin" ]; then
    echo "==> macOS detectado"

    if ! command -v brew &>/dev/null; then
        echo "==> Instalando Homebrew..."
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    fi

    echo "==> Instalando tmux..."
    brew install tmux

    echo "==> Habilitando SSH (Remote Login)..."
    sudo systemsetup -setremotelogin on

    echo "==> Instalando Tailscale..."
    brew install --cask tailscale

    echo ""
    echo "==> Tudo pronto!"
    echo "    Abra o Tailscale na barra de menus e faça login."
    echo "    Depois rode: tailscale ip"
    echo "    Usuário SSH: $USER"
    exit 0
fi

# --- Linux: detecta gerenciador de pacotes ---
if command -v dnf &>/dev/null; then
    PKG="dnf"
    SSH_SERVICE="sshd"
elif command -v apt &>/dev/null; then
    PKG="apt"
    SSH_SERVICE="ssh"
else
    echo "Distro não suportada (esperado apt, dnf ou macOS)." >&2
    exit 1
fi

echo "==> Distro detectada: $PKG | serviço SSH: $SSH_SERVICE"

# --- openssh + tmux ---
echo "==> Instalando openssh-server e tmux..."
sudo $PKG install -y openssh-server tmux

# --- habilita SSH ---
echo "==> Habilitando $SSH_SERVICE..."
sudo systemctl enable --now "$SSH_SERVICE"

# --- tailscale ---
echo "==> Instalando Tailscale..."
curl -fsSL https://tailscale.com/install.sh | sh

echo "==> Subindo Tailscale (abrirá link para login)..."
sudo tailscale up

echo ""
echo "==> Tudo pronto!"
echo "    IP Tailscale: $(tailscale ip 2>/dev/null || echo 'rode: tailscale ip')"
echo "    Usuário SSH:  $USER"
