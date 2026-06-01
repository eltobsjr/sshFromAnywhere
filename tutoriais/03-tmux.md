# Tutorial 3 — tmux

## Por que usar

Sem tmux, se a conexão SSH cair (internet fraca, celular travou, app fechou), qualquer processo em execução para imediatamente.

Com tmux, a sessão continua rodando no PC independente da conexão. Você reconecta e tudo está exatamente onde parou.

---

## Comandos essenciais

| Comando | O que faz |
|---|---|
| `tmux` | Abre uma sessão nova |
| `tmux attach` | Reconecta na sessão existente |
| `Ctrl+B` depois `D` | Sai do tmux sem fechar (sessão continua rodando) |
| `Ctrl+B` depois `C` | Cria uma janela nova dentro da sessão |
| `Ctrl+B` depois `N` | Vai para a próxima janela |
| `exit` | Encerra a sessão tmux |

---

## Ciclo de vida da sessão

| Evento | Sessão tmux |
|---|---|
| Conexão SSH cai | Sobrevive |
| Termius fecha | Sobrevive |
| PC reinicia | **Some** — abra uma nova com `tmux` |
| Você digita `exit` | **Some** |

---

## Fluxo recomendado

```bash
# Primeira conexão do dia
tmux

# Conexões seguintes (reconectar sessão existente)
tmux attach
```
