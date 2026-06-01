# VPNs — Tailscale com outra VPN ativa

## Funcionam juntas?

Na maioria dos casos, **sim** — desde que usem faixas de IP diferentes:

| VPN | Faixa de IP típica |
|---|---|
| Tailscale | `100.x.x.x` |
| VPN corporativa comum | `10.x.x.x` ou `172.x.x.x` |

Como as faixas não se sobrepõem, o tráfego de cada uma não interfere na outra. Você pode ativar as duas simultaneamente sem configuração especial.

---

## Possível conflito

Se a VPN corporativa operar em modo **full tunnel** (roteia todo o tráfego por ela), pode bloquear o Tailscale.

**Sintoma:** Termius não conecta com a VPN do trabalho ativa.

**Solução:** Configure o Tailscale para pausar automaticamente quando a outra VPN estiver ativa, ou use split tunneling na VPN corporativa para excluir a faixa `100.x.x.x`.
