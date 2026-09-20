# Ferramentas de terminal — keymaps

TUIs instaladas nesta máquina e seus atalhos.
Verificado via `brew list` + `~/go/bin` + `~/.local/bin` em 2026-09-09.

Instaladas: **tmux · vi-mongo · lazygit · lazydocker · lazysql · posting · gdu · fzf · claude · gh**
Referenciadas no `config.fish` mas **não instaladas**: `yazi` (função `y`), `ncspot` (alias `spotify`).

---

## tmux — `~/.config/tmux/tmux.conf`

**Prefixo: `C-t`** (não é o `C-b` padrão). Modo de cópia: **vi**. Mouse: ligado.

### Binds custom
| Tecla | Ação |
|-------|------|
| `C-t` `r` | Recarrega o `tmux.conf` |
| `C-t` `o` | Abre o diretório do painel no Finder |
| `C-t` `e` | Mata todos os painéis menos o atual (repeat) |
| `C-t` `c` | Nova janela na cwd do painel |
| `C-t` `"` | Split horizontal na cwd |
| `C-t` `%` | Split vertical na cwd |
| `C-t` `g` | Popup com **lazygit** (80%×80%, repeat) |
| `C-t` `y` | Popup com **Claude Code** (sessão persistente por projeto, repeat) |
| `C-S-Left` / `C-S-Right` | Move a janela para a esquerda / direita (sem prefixo) |

### Plugin `tmux-pain-control` (navegação estilo vim)
| Tecla | Ação |
|-------|------|
| `C-t` `h` / `j` / `k` / `l` | Vai para o painel à esquerda / baixo / cima / direita |
| `C-t` `H` / `J` / `K` / `L` | Redimensiona o painel (repeat) |
| `C-t` `\|` / `-` | Split vertical / horizontal (mantém cwd) |
| `C-t` `<` / `>` | Move a janela de posição |

Plugins via TPM: `C-t` `I` instala, `C-t` `U` atualiza.

### Binds padrão (não customizados) — tudo com prefixo `C-t`

**Janelas**
| Tecla | Ação |
|-------|------|
| `c` | Nova janela (aqui: custom, abre na cwd do painel) |
| `,` | Renomeia a janela |
| `&` | Fecha a janela (pede confirmação) |
| `n` / `p` | Próxima / anterior janela |
| `0`–`9` | Vai para a janela pelo número |
| `w` | Lista/escolhe janelas num menu |
| `f` | Acha janela por texto |
| `l` | Última janela ativa |
| `.` | Move a janela para outro índice |

**Painéis**
| Tecla | Ação |
|-------|------|
| `%` / `"` | Split vertical / horizontal (aqui: custom, mantém a cwd) |
| `x` | Fecha o painel (pede confirmação) |
| `z` | Zoom no painel (fullscreen; aperta de novo pra voltar) |
| `!` | Transforma o painel em janela própria |
| `space` | Cicla os layouts de painel |
| `{` / `}` | Troca o painel de posição |
| `;` | Vai pro último painel ativo |
| `q` | Mostra os números dos painéis (digite pra pular) |
| `o` | Próximo painel (aqui: custom, abre a pasta no Finder) |

**Sessão / diversos**
| Tecla | Ação |
|-------|------|
| `d` | Detach (sai deixando a sessão rodando) |
| `s` | Lista/troca de sessão |
| `$` | Renomeia a sessão |
| `(` / `)` | Sessão anterior / próxima |
| `t` | Relógio |
| `:` | Linha de comando do tmux |
| `?` | Lista todos os atalhos |
| `]` | Cola o buffer copiado |
| `C-t` | Manda um `C-t` literal pro programa |

### Modo de cópia (vi)
`C-t` `[` entra · `v` inicia seleção · `y` copia · `q`/`Esc` sai · `/` e `?` buscam.

---

## vi-mongo — `~/Library/Application Support/vi-mongo/keybindings.yaml`

Cliente TUI de MongoDB. Bindings conforme o config atual (customizado).

### Global
| Tecla | Ação |
|-------|------|
| `q` / `Ctrl+c` | Fecha o app |
| `?` | Ajuda em tela cheia |
| `Ctrl+o` | Página de conexões |
| `Ctrl+t` | Modal de troca de estilo/tema |
| `t` | Expande/recolhe o header |

### Tela principal
| Tecla | Ação |
|-------|------|
| `Ctrl+l` / `Tab` | Próximo componente |
| `Ctrl+h` / `Backtab` | Componente anterior |
| `Ctrl+n` | Esconde o painel de databases |
| `Alt+a` | Prompt de AI query |
| `Ctrl+s` | Info do servidor |

### Conexões
| Tecla | Ação |
|-------|------|
| `Ctrl+s` | Salva conexão (no form) |
| `Ctrl+h` / `Ctrl+Left` | Foca a lista |
| `Ctrl+l` / `Ctrl+Right` | Foca o form |
| `Enter` / `Space` | Seleciona conexão |
| `E` | Edita conexão |
| `Ctrl+d` | Apaga conexão |

### Databases / coleções
| Tecla | Ação |
|-------|------|
| `/` | Barra de filtro |
| `Ctrl+u` | Limpa o filtro |
| `E` / `W` | Expande tudo / recolhe tudo |
| `A` | Adiciona coleção |
| `R` | Renomeia coleção |
| `Ctrl+d` | Apaga coleção |

### Conteúdo (documentos)
| Tecla | Ação |
|-------|------|
| `v` | Troca a visão |
| `Enter` / `o` | Peek do documento |
| `O` | Peek em página cheia |
| `A` | Novo documento |
| `e` / `E` | Edição inline / completa |
| `D` | Duplica (`Alt+D` sem confirmação) |
| `Ctrl+d` | Apaga (`Alt+d` sem confirmação) |
| `c` / `C` | Copia valor destacado / documento inteiro |
| `Ctrl+r` | Refresh |
| `/` | Barra de query |
| `s` / `S` | Barra de sort / ordena pela coluna |
| `H` | Esconde coluna (`Ctrl+r` reseta) |
| `[` / `]` | Documento anterior / próximo |
| `b` / `n` | Página anterior / próxima |
| `V` | Seleção múltipla (`Esc` limpa) |
| `Alt+o` | Opções de query |

### Peeker
`g` / `G` topo / fim · `c` copia destaque · `C` copia só o valor · `F` tela cheia · `p`/`P` sai.

### Query bar
`Ctrl+y` histórico · `Ctrl+u` limpa · `Ctrl+v` cola.

### Aggregation (pipeline)
| Tecla | Ação |
|-------|------|
| `a` / `e` | Adiciona / edita stage |
| `Ctrl+d` | Apaga stage |
| `R` | Roda o pipeline |
| `C` | Limpa todos os stages |
| `J` / `K` | Move o stage para baixo / cima |
| `Ctrl+j` | Alterna foco stages ↔ resultados |

### Index
`A` adiciona · `Ctrl+d` apaga · `Esc` sai do modal.

---

## lazygit — `<Leader>gg` no nvim / `C-t g` no tmux

Bindings padrão. `?` em qualquer painel mostra **todos** os atalhos daquele contexto.
No popup do tmux o prefixo continua `C-t` (ex: `C-t d` fecha o popup).

### Global / navegação
| Tecla | Ação |
|-------|------|
| `1`–`5` | Vai pro painel: status · files · branches · commits · stash |
| `Tab` / `` ` `` | Próximo painel / painel por número |
| `[` / `]` | Aba anterior / próxima dentro do painel (ex: Files ↔ Worktrees) |
| `h` / `l` | Painel à esquerda / direita |
| `j` / `k` / `↑` `↓` | Move na lista |
| `/` | Filtra a lista atual |
| `?` | Menu de atalhos do contexto · `x` menu de ações |
| `+` / `_` | Aumenta / diminui o painel de contexto (diff) |
| `@` | Command log · `P` (maiúsculo em nenhum) |
| `q` / `<esc>` | Sai / volta · `Q` sai sem perguntar |
| `<c-r>` | Troca de repo recente |
| `R` | Refresh |

### Files (painel 2)
| Tecla | Ação |
|-------|------|
| `<space>` | Stage / unstage o arquivo (ou a linha/hunk se estiver dentro) |
| `a` | Stage / unstage **tudo** |
| `<enter>` | Entra no arquivo pra stage por **linha/hunk** |
| `d` | Descarta as alterações (menu) · `D` reset/nuke (menu com opções) |
| `c` | **Commit** · `C` commit com editor · `A` amend no último commit |
| `<c-a>` | Escreve a mensagem de commit com IA (se configurado) |
| `w` | Commit sem hook (`--no-verify`) |
| `e` | Edita o arquivo · `o` abre no editor · `i` adiciona ao `.gitignore` |
| `s` | Stash (menu) · `S` opções de stash |
| `f` | Fetch |
| `M` | Abre `git mergetool` |

### Dentro do diff (staging por linha)
| Tecla | Ação |
|-------|------|
| `<space>` | Stage / unstage a linha |
| `v` | Modo seleção (aí `<space>` opera no range) |
| `<left>` / `<right>` | Hunk anterior / próximo |
| `a` | Stage / unstage o hunk inteiro |
| `<esc>` | Volta pra lista de arquivos |

### Branches (painel 3)
| Tecla | Ação |
|-------|------|
| `<space>` | Checkout na branch |
| `n` | Nova branch a partir daqui |
| `d` | Deleta a branch (menu: local/remote/force) |
| `r` | Rebase a branch atual **em cima** da selecionada |
| `M` | Merge a selecionada na atual |
| `f` | Fast-forward sem checkout |
| `p` / `P` | Pull / push (`P` oferece `--force-with-lease` se preciso) |
| `o` | Abre PR no navegador · `O` opções de PR (escolhe a base) |
| `<c-y>` | Copia o nome da branch |
| `R` | Renomeia a branch |
| `g` | Ver opções de reset pra esse ref |

### Commits (painel 4)
| Tecla | Ação |
|-------|------|
| `<enter>` | Abre os arquivos do commit |
| `<space>` | Checkout no commit |
| `d` | Drop do commit (num rebase interativo) |
| `e` | Edita (marca `edit` no rebase) · `r` reword a mensagem |
| `s` | Squash com o de baixo · `f` fixup com o de baixo |
| `p` | Pick · `S` split · `A` amend nesse commit |
| `t` | Reverte o commit |
| `<c-j>` / `<c-k>` | Move o commit pra baixo / cima |
| `B` | Marca commit base pra rebase parcial |
| `C` | Cherry-pick (copia) · `V` cola os cherry-picked |
| `g` | Menu de reset (soft / mixed / hard) até esse commit |

### Stash (painel 5)
| Tecla | Ação |
|-------|------|
| `<space>` / `g` | Aplica o stash |
| `<enter>` | Ver os arquivos do stash |
| `d` | Dropa o stash · `n` cria branch a partir do stash |
| `r` | Renomeia o stash |

### Custom commands / menu
`x` abre o menu de ações do contexto · `:` executa um comando shell · `<c-p>` edita as custom patch options.

---

## lazydocker — `<Leader>ld` no nvim

| Tecla | Ação |
|-------|------|
| `Tab` / `<[` `]>` | Alterna painéis (containers, images, volumes, networks, config) |
| `<enter>` | Foca o painel de detalhes |
| `d` | Remove container/image/volume |
| `r` | Restart · `s` stop · `<c-c>` kill |
| `a` | Attach ao container |
| `E` | Exec shell no container |
| `m` | Ver logs / métricas |
| `b` | Ações em massa (bulk) |
| `+` / `-` | Próxima / tela de log anterior |
| `?` | Menu de ajuda · `q` sai |

---

## lazysql — TUI de SQL

| Tecla | Ação |
|-------|------|
| `Ctrl+e` | Nova aba de query / editor SQL |
| `Ctrl+s` (no editor) | Executa a query |
| `Space` | Executa a query sob o cursor |
| `Tab` / `Backtab` | Próximo / anterior painel |
| `L` / `H` | Próxima / anterior aba |
| `[` / `]` | Página anterior / próxima de resultados |
| `/` | Filtro nas colunas |
| `c` | Edita célula · `d` deleta linha · `o` nova linha |
| `Ctrl+w` | Fecha a aba |
| `q` | Sai · `?` ajuda |

Movimento estilo vim (`h/j/k/l`, `g/G`) nas tabelas.

---

## posting — cliente HTTP TUI (`~/.config/posting/config.yaml` se existir)

| Tecla | Ação |
|-------|------|
| `Ctrl+j` | **Envia a request** |
| `Ctrl+p` | Paleta de comandos |
| `Ctrl+n` | Abre/salva na coleção |
| `Ctrl+s` | Salva a request |
| `Ctrl+t` | Foca o seletor de método |
| `Ctrl+l` | Foca a barra de URL |
| `Ctrl+o` | Modo "jump" (navega por atalho de tecla) |
| `Tab` / `Shift+Tab` | Navega entre campos |
| `d` | Alterna painel de detalhes da resposta |
| `f1` / `?` | Ajuda |
| `Ctrl+c` | Sai |

---

## gdu — disk usage (`gdu ~`)

| Tecla | Ação |
|-------|------|
| `j` / `k` / `↑` `↓` | Move na lista |
| `Enter` / `l` / `→` | Entra na pasta |
| `h` / `←` | Volta uma pasta |
| `d` | Apaga o item selecionado |
| `e` | Esvazia a pasta selecionada |
| `v` | Mostra/oculta arquivos vs pastas |
| `s` / `c` / `n` / `m` | Ordena por tamanho / contagem de itens / nome / mtime |
| `a` | Alterna tamanho aparente vs em disco |
| `r` | Rescan · `?` ajuda · `q` sai |

---

## fzf — atalhos no shell (fish, via `fzf --fish`)

| Tecla | Contexto | Ação |
|-------|----------|------|
| `Ctrl+t` | qualquer prompt | Insere arquivo/pasta via fuzzy finder |
| `Ctrl+r` | qualquer prompt | Busca no histórico de comandos |
| `Alt+c` | qualquer prompt | `cd` para subpasta via fuzzy finder |

Dentro do fzf: `Ctrl+j`/`Ctrl+k` move · `Tab` marca (multi) · `Enter` confirma · `Esc` cancela.
`zoxide` também ativo: `z <parte-do-path>` pula, `zi` abre com fzf.

---

## Claude Code — `C-t y` no tmux (popup) / `<Leader>ai` no nvim

Popup do tmux (`C-t y`) faz **attach** numa sessão `claude-<hash-do-projeto>` — persiste por
projeto. Pra sair deixando rodando: `C-t d` (detach). O prefixo dentro do popup ainda é `C-t`.

### Prompt — teclas
| Tecla | Ação |
|-------|------|
| `Enter` | Envia |
| `\` + `Enter` / `Option+Enter` / `Ctrl+J` | Quebra de linha (multiline) |
| `Esc` | Interrompe a geração / limpa o input |
| `Esc` `Esc` | Edita/rebobina uma mensagem anterior (rewind) |
| `↑` / `↓` | Histórico de prompts |
| `Ctrl+C` | Cancela o input (2× seguidas: sai) |
| `Ctrl+D` | Sai da sessão |
| `Ctrl+L` | Limpa a tela |
| `Ctrl+R` | Alterna saída **verbosa** (mostra tool output inteiro) |
| `Ctrl+B` | Manda um comando pro background / terminal em background |
| `Ctrl+V` | Cola imagem do clipboard |
| `Shift+Tab` | Cicla o modo: normal → auto-aceitar edições → **plan mode** |
| `Tab` | Liga/desliga o "thinking" estendido |
| `Ctrl+A` / `Ctrl+E` | Início / fim da linha (readline) · `Ctrl+W` apaga palavra · `Ctrl+U` apaga linha |

### Prefixos no input
| Prefixo | Faz |
|---------|-----|
| `/` | Slash command (`/help` lista tudo do teu build) |
| `!` | Modo bash — roda o comando e injeta a saída no contexto |
| `@` | Menciona arquivo/pasta (autocompleta caminho) |
| `#` | Adiciona a linha à memória (`CLAUDE.md` do projeto ou global) |

### Slash commands úteis
`/help` `/clear` (zera contexto) · `/compact` (resume o contexto) · `/model` · `/config` ·
`/vim` (modo vim no prompt) · `/init` (gera `CLAUDE.md`) · `/memory` (edita os `CLAUDE.md`) ·
`/agents` · `/mcp` · `/resume` (retoma outra sessão) · `/export` · `/cost` · `/status` · `/doctor` ·
`/review` (revisa um PR) · `/pr-comments` (puxa os comentários do PR) · `/terminal-setup`.

### CLI (fora do popup)
`claude` abre · `claude -c` continua a última sessão do dir · `claude -r` escolhe qual retomar ·
`claude -p "..."` modo print (não-interativo) · `claude commit` gera a mensagem e commita ·
`claude update` · `claude mcp` gerencia servidores MCP.

> Atalhos e comandos variam por versão (aqui: 2.1.268). `/help` mostra os atuais.

---

## gh — revisão de PR pelo terminal

`gh` (GitHub CLI). Alias configurado: **`gh co` = `gh pr checkout`**.
Não é TUI — são subcomandos. `[n]` = número, URL ou branch; sem `[n]` usa o PR da branch atual.

### Olhar
| Comando | Faz |
|---------|-----|
| `gh pr status` | PRs relevantes (teus, pra revisar, current branch) |
| `gh pr list` | Lista os PRs abertos · `--state all` · `--label bug` · `--author @me` |
| `gh pr list --search "review-requested:@me"` | PRs esperando **tua** review |
| `gh pr view [n]` | Resumo no terminal · `--comments` inclui a discussão · `--web` abre no browser |
| `gh pr diff [n]` | Diff colorido · `--name-only` só os arquivos · `--patch` formato patch |
| `gh pr checks [n]` | Status do CI · `--watch` acompanha até terminar |

### Mexer
| Comando | Faz |
|---------|-----|
| `gh co [n]` / `gh pr checkout [n]` | Faz checkout local da branch do PR |
| `gh pr review [n] --approve -b "msg"` | **Aprova** |
| `gh pr review [n] --comment -b "msg"` | Só comenta (sem aprovar/bloquear) |
| `gh pr review [n] --request-changes -b "msg"` | Pede mudanças |
| `gh pr comment [n] -b "msg"` | Comentário solto na conversa |
| `gh pr merge [n] --squash --delete-branch` | Merge (squash) e apaga a branch · `--merge` · `--rebase` · `--auto` |
| `gh pr ready [n]` | Tira do rascunho |
| `gh pr edit [n] --add-reviewer user --add-label bug` | Edita metadados |
| `gh pr create --fill --web` | Cria PR (usa commits pra título/corpo) · `--draft` rascunho |

### Combos
- Revisar rápido: `gh co 123` → mexe/testa local → `gh pr diff` → `gh pr review --approve -b "LGTM"`.
- Comentário multilinha: `gh pr review 123 --comment -b (printf 'linha1\nlinha2')` (fish) ou `-F arquivo.md`.
- Do nvim: `<Leader>gpc` (Octo checkout) e `<Leader>gpr`/`<Leader>gpa` fazem o mesmo fluxo com UI.
