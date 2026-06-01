# Tutorial 2 — Configuração no celular

> Pré-requisito: PC com SSH e Tailscale configurados ([Tutorial 1](01-instalacao.md)).

---

## Apps necessários

| App | Onde baixar |
|---|---|
| **Tailscale** | [Play Store](https://play.google.com/store/apps/details?id=com.tailscale.ipn.android) / [App Store](https://apps.apple.com/app/tailscale/id1470499037) |
| **Termius** | [Play Store](https://play.google.com/store/apps/details?id=com.server.auditor.ssh.client) / [App Store](https://apps.apple.com/app/termius-ssh-sftp-client/id549039908) |

---

## Configuração do Tailscale

1. Instala o app e faz login com a **mesma conta** usada no PC
2. Ativa a VPN — seu PC aparece na lista de dispositivos
3. Anote o IP `100.x.x.x` do PC (ou consulte rodando `tailscale ip` no terminal)

---

## Configuração do Termius

1. Abre o Termius → toca em **"New Host"**
2. Preenche:
   - **Hostname:** IP Tailscale do PC (`100.x.x.x`)
   - **Port:** `22`
   - **Username:** seu usuário Linux
   - **Password:** sua senha do PC
3. Salva e conecta

---

## Verificando que funciona

Após conectar, você deve ver o terminal do seu PC. Teste:

```bash
tmux
```

Se abrir uma sessão tmux, está tudo certo.
