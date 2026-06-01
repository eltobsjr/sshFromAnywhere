# Tutorial 1 — Instalação no PC

> Pré-requisito: Linux com `apt` (Ubuntu, Pop!_OS, Debian) ou `dnf` (Fedora).  
> Se quiser pular tudo isso, use o [`init.sh`](../init.sh) na raiz do projeto.

---

## 1. OpenSSH + tmux

**Fedora:**
```bash
sudo dnf install -y openssh-server tmux
sudo systemctl enable --now sshd
```

**Ubuntu / Pop!_OS:**
```bash
sudo apt install -y openssh-server tmux
sudo systemctl enable --now ssh
```

O SSH agora sobe automaticamente toda vez que o PC ligar.

---

## 2. Tailscale

O mesmo script funciona em qualquer distro:

```bash
curl -fsSL https://tailscale.com/install.sh | sh
sudo tailscale up
```

O comando `tailscale up` exibe um link — abre no navegador e faz login com Google, GitHub ou e-mail.

Após o login, anote o IP do seu PC:

```bash
tailscale ip
```

Você vai usar esse IP para configurar o Termius no celular.

---

## Resultado esperado

- SSH escutando na porta `22` e habilitado no boot
- Tailscale rodando e habilitado no boot
- PC acessível de qualquer rede pelo IP `100.x.x.x`
