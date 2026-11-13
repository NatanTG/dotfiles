# Neovim — keymaps (custom + plugins)

Base: **LazyVim**. `<Leader>` = `<Space>`, `<LocalLeader>` = `\`.
Dentro do editor: `<Leader>sk` busca qualquer keymap; segure `<Leader>` que o **which-key** mostra o menu.

Fontes: `lua/config/keymaps.lua` + `lua/plugins/*.lua` + defaults do LazyVim.

- **Vim puro + combos do dia a dia** (movimento, text objects, `:s`, `cgn`, macros, `:g`) → `keymaps-vim`
- **TUIs do terminal** (tmux, lazygit, lazydocker, …) → `keymaps-tools`
- Tudo de uma vez → `keymaps-all`

---

## 1. Custom — `lua/config/keymaps.lua`

### Registradores (não sujam o yank)
| Modo | Tecla | Ação |
|------|-------|------|
| n | `x` | Deleta caractere sem copiar (`"_x`) |
| n | `<Leader>p` / `<Leader>P` | Cola do registrador de yank (`"0`) depois / antes |
| v | `<Leader>p` | Cola do yank por cima da seleção |
| n / v | `<Leader>c` / `<Leader>C` | Change sem copiar |
| n / v | `<Leader>d` / `<Leader>D` | Delete sem copiar |

### Edição / movimento
| Modo | Tecla | Ação |
|------|-------|------|
| n | `+` | Incrementa número |
| n | `_` | Decrementa número |
| n | `dw` | Deleta palavra para trás (`vb"_d`) |
| n | `<C-a>` | Seleciona tudo (`gg<S-v>G`) |
| n | `<Leader>O` | Insere linha acima sem continuar comentário |
| n | `<C-m>` | Pula para frente no jumplist (`<C-i>`) |

> ⚠️ Estes overrides mudam o vim padrão: `dw` deleta pra **trás** (use `de`/`daw` pra frente), `x` não copia, `+`/`_` incrementam (não são "próxima linha"), `s` virou prefixo de janela (use `cl`/`cc`). Lista completa no topo de `keymaps-vim`.

### Tabs
| Tecla | Ação |
|-------|------|
| `te` | `:tabedit` |
| `<Tab>` | Próxima tab *(também BufferLine)* |
| `<S-Tab>` | Tab anterior *(também BufferLine)* |

### Splits / janelas
| Tecla | Ação |
|-------|------|
| `ss` | Split horizontal |
| `sv` | Split vertical |
| `sh` / `sj` / `sk` / `sl` | Vai para janela esquerda / baixo / cima / direita |
| `<C-h>` / `<C-j>` / `<C-k>` / `<C-l>` | Navega entre janelas (inclusive do modo terminal) |
| `<C-w><Left/Right/Up/Down>` | Redimensiona a janela |

### Terminal
| Modo | Tecla | Ação |
|------|-------|------|
| t | `<C-x>` | Sai do modo terminal |
| t | `<C-h/j/k/l>` | Vai para a janela ao lado |

### Diversos
| Tecla | Ação |
|-------|------|
| `<Leader>r` | Troca HEX → HSL sob o cursor (`craftzdog.hsl`) |
| `<Leader>i` | Liga/desliga inlay hints (`craftzdog.lsp`) |
| `:ToggleAutoformat` | Liga/desliga autoformat no salvar |

---

## 2. Arquivos — Oil.nvim (substitui neo-tree)

| Tecla | Ação |
|-------|------|
| `-` | Abre o diretório pai no Oil |
| `<Leader>e` | Oil na cwd |
| `<Leader>o` | Oil em janela flutuante |

Dentro do buffer do Oil:
| Tecla | Ação |
|-------|------|
| `<CR>` | Abre item |
| `<C-s>` / `<C-x>` / `<C-t>` | Abre em split vertical / horizontal / nova tab |
| `<C-p>` | Preview |
| `<C-l>` | Refresh |
| `q` | Fecha |
| `-` / `_` | Diretório pai / abre a cwd |
| `` ` `` / `~` | `cd` para o diretório (global / da tab) |
| `gd` | Alterna detalhes (permissões, tamanho, mtime) |
| `gs` | Muda ordenação |
| `gx` | Abre no app externo |
| `g.` | Alterna arquivos ocultos |
| `g\` | Alterna visão da lixeira |
| `g?` | Ajuda |

> Explorer do LazyVim desativado: `<Leader>e`, `<Leader>E`, `<Leader>fe`, `<Leader>fE` = no-op.

---

## 3. Telescope (config custom + defaults)

Atalhos custom (sem leader):
| Tecla | Ação |
|-------|------|
| `;f` | Arquivos (com ocultos, respeita `.gitignore`) |
| `;r` | Live grep (com ocultos) |
| `;t` | Help tags |
| `;;` | Retoma o último picker |
| `;e` | Diagnósticos (tema ivy) |
| `;s` | Símbolos via Treesitter (funções, variáveis) |
| `;c` | LSP incoming calls da palavra sob o cursor |
| `\\` | Buffers abertos |
| `sf` | File browser na pasta do buffer atual (modo normal) |
| `<Leader>fP` | Acha arquivo de plugin (dentro do repo do LazyVim) |

File browser (modo normal): `N` cria, `h` sobe de pasta, `/` entra no modo insert, `<C-u>`/`<C-d>` pula 10 linhas.

Defaults LazyVim úteis: `<Leader><Space>` arquivos · `<Leader>/` grep no projeto · `<Leader>,` buffers · `<Leader>fr` recentes · `<Leader>sk` keymaps · `<Leader>sh` help.

---

## 4. LSP

| Tecla | Ação |
|-------|------|
| `gd` | Goto definition *(override custom p/ `vim.lsp.buf.definition`)* |
| `gr` / `gI` / `gy` | Referências / implementação / type definition |
| `K` | Hover (com borda) |
| `<Leader>ca` | Code action |
| `<Leader>rn` | Rename incremental (`inc-rename.nvim`) |
| `<Leader>cf` | Formatar (conform.nvim) |
| `<Leader>cd` | Diagnóstico da linha |
| `]d` / `[d` | Próximo / anterior diagnóstico |
| `<Leader>i` | Toggle inlay hints |

`lsp-lens` mostra contagem de referências/implementações inline.
Formatadores (conform): prettierd/prettier (js/ts/css/html/json/yaml/md), stylua (lua), ruff (python), goimports+gofmt (go), terraform_fmt (tf/hcl).

---

## 5. Git

| Tecla | Ação |
|-------|------|
| `<Leader>gg` | Lazygit em terminal flutuante (toggleterm) |
| `<Leader>gb` | Blame window (`git.nvim`) |
| `<Leader>go` | Abre arquivo/pasta no remote do GitHub (`git.nvim`) |
| `<Leader>gb` (gitsigns) | Blame da linha atual — ligado por padrão (virt text no EOL) |
| `]h` / `[h` | Próximo / anterior hunk (gitsigns default) |

### Diffview
| Tecla | Ação |
|-------|------|
| `<Leader>gdo` | Abre Diffview |
| `<Leader>gdc` | Fecha Diffview |
| `<Leader>gdh` | Histórico do arquivo atual |
| `<Leader>gdH` | Histórico de todos os arquivos |

### Octo (GitHub PRs/Issues)
| Tecla | Ação |
|-------|------|
| `<Leader>gpl` / `<Leader>gps` | Lista / busca PRs |
| `<Leader>gpc` | Checkout do PR |
| `<Leader>gpd` | Diff do PR |
| `<Leader>gpr` / `<Leader>gpa` | Inicia / envia review |
| `<Leader>gil` / `<Leader>gic` | Lista / cria issue |

Comandos digitados (`:Octo ...`):
`pr list` · `pr search` · `pr checkout` · `pr diff` · `pr create` · `pr edit <nº>` · `pr merge` · `pr ready` ·
`review start` · `review resume` · `review submit` · `review discard` · `review comments` · `review commit <sha>` ·
`comment add` · `comment delete` · `thread resolve` / `thread unresolve` ·
`issue list` · `issue create` · `issue edit <nº>` · `issue close` · `issue reopen`.

#### Octo — review de diff (keymaps buffer-local, prefixo = `<Leader>`)
| Tecla | Ação |
|-------|------|
| `<Leader>ca` | Adiciona comentário (normal ou visual) |
| `<Leader>sa` | Adiciona sugestão de código (normal ou visual) |
| `<Leader>vs` / `<Leader>vd` | Submete / descarta o review |
| `<Leader>e` / `<Leader>b` | Foca / alterna o painel de arquivos |
| `]t` / `[t` | Próxima / anterior thread |
| `]q` / `[q` | Próximo / anterior arquivo |
| `<Space>` | Marca o arquivo como visto |
| `gf` | Vai para o arquivo real |

Tela de submit: `<C-a>` aprova · `<C-m>` só comenta · `<C-r>` pede mudanças · `<C-c>` cancela.

---

## 6. Buffers / tabs / UI

| Tecla | Ação |
|-------|------|
| `<Tab>` / `<S-Tab>` | Próxima / anterior tab (BufferLine, modo `tabs`) |
| `<Leader>th` | Fecha buffers ocultos (`close-buffers`) |
| `<Leader>tu` | Fecha buffers sem nome |
| `<Leader>z` | Zen mode (largura 120; integra gitsigns + tmux) |
| `:Noice` | Histórico de mensagens (abre em split) |

---

## 7. Terminais flutuantes (toggleterm)

| Tecla | Ação |
|-------|------|
| `<Leader>gg` | Lazygit |
| `<Leader>ld` | Lazydocker |
| `<Leader>tt` | Terminal genérico |
| `<Leader>ai` | Claude Code (sessão persistente) |

Todos em float ~85% da tela. Saia do modo terminal com `<C-x>`.

---

## 8. Autocomplete / IA

**blink.cmp** (menu de completion) — `<C-y>` aceita, `<C-e>` fecha, `<C-Space>` abre, `<Tab>`/`<S-Tab>` navega (defaults LazyVim).

**Supermaven** (ghost text):
| Tecla | Ação |
|-------|------|
| `<Tab>` | Aceita sugestão |
| `<C-j>` | Aceita só a próxima palavra |
| `<C-]>` | Descarta sugestão |

**copilot.lua** (auto_trigger ligado — pode coexistir/competir com Supermaven):
| Tecla | Ação |
|-------|------|
| `<C-l>` | Aceita |
| `<M-l>` / `<M-S-l>` | Aceita palavra / linha |
| `<M-]>` / `<M-[>` | Próxima / anterior sugestão |
| `<C-]>` | Descarta |

---

## 9. Increment/decrement — dial.nvim

| Tecla | Ação |
|-------|------|
| `<C-a>` / `<C-x>` | Incrementa / decrementa (int, hex, datas `%Y/%m/%d`, bool, semver, `let`↔`const`) |

> ⚠️ `<C-a>` também está mapeado no `keymaps.lua` para "selecionar tudo" — o custom carrega depois e tende a vencer. Use `+` / `_` para incrementar/decrementar sem conflito.

---

## 10. Navegação com colchetes — mini.bracketed

`]` / `[` seguido de: `b` buffer · `c` comentário · `d` diagnóstico · `j` jumplist · `l` location list · `q` quickfix · `t` treesitter (com `n`) · `u` undo · `w` window · `y` yank · `x` conflito.

---

## 11. Debug — nvim-dap

| Tecla | Ação |
|-------|------|
| `<Leader>db` | Toggle breakpoint |
| `<Leader>dc` | Continue / inicia |
| `<Leader>do` / `<Leader>di` / `<Leader>dO` | Step over / into / out |
| `<Leader>dt` | Termina sessão |
| `<Leader>du` | Toggle DAP UI |

Adaptadores instalados: `nvim-dap-go`, `nvim-dap-python`, Flutter (via flutter-tools), Rust (via rustaceanvim).

---

## 12. Linguagens

### Flutter / Dart — flutter-tools.nvim (ft=dart)
`:FlutterRun` · `:FlutterDevices` · `:FlutterEmulators` · `:FlutterReload` (hot reload) · `:FlutterRestart` · `:FlutterQuit` · `:FlutterOutlineToggle` · `:FlutterDevTools`.
`dartls` é gerenciado pelo flutter-tools (desativado no lspconfig).

### Rust — rustaceanvim
`:RustLsp` prefixo: `codeAction`, `hover actions`, `expandMacro`, `explainError`, `runnables`, `debuggables`, `openCargo`, `parentModule`. `crates.nvim` ativo em `Cargo.toml`.

### Markdown
| Tecla | Ação |
|-------|------|
| `<Leader>mr` | Toggle preview no navegador (`markdown-preview.nvim`) |

---

## 13. Misc plugins ativos (sem keymap dedicado)

- **mini.ai** — text objects extras (`a`/`i` + `q`, `b`, etc.)
- **mini.pairs** — auto-fecha pares
- **mini.hipatterns** / **nvim-highlight-colors** — realce de cores HEX/HSL/rgb/tailwind
- **nvim-ts-autotag** — fecha tags HTML/JSX
- **todo-comments** — `]t` / `[t` navega TODO/FIX/HACK; `<Leader>st` lista (Telescope); `<Leader>xt` no Trouble
- **trouble.nvim** — `<Leader>xx` diagnósticos do projeto, `<Leader>xX` do buffer
- **persistence.nvim** — `<Leader>qs` restaura sessão, `<Leader>ql` última, `<Leader>qd` desativa
- **venv-selector** — `:VenvSelect` (python)
- **noice** + **nvim-notify** — cmdline/mensagens/notificações
- **incline** — nome do arquivo no topo da janela
- **lualine** / **bufferline** — status/buffer line

---

## 14. Comentários (nativo do Neovim + ts-comments)

| Tecla | Modo | Ação |
|-------|------|------|
| `gcc` | n | Comenta / descomenta a linha atual |
| `gc{motion}` | n | Comenta o alvo — `gcap` parágrafo, `gcip` bloco, `gc3j` 4 linhas, `gcG` até o fim |
| `gc` | v | Comenta / descomenta a seleção |
| `gbc` | n | Comenta a linha em **bloco** (`/* */`) |
| `gb{motion}` / `gb` (v) | n/v | Comentário de bloco no alvo / seleção |

`ts-comments` deixa o comentário certo em arquivos mistos (JSX dentro de `.tsx`, etc).
`gco` / `gcO` / `gcA` **não existem** aqui (precisam do `Comment.nvim`).

---

## 15. Text objects do mini.ai (`{i|a}{alvo}`)

| Alvo | Pega |
|------|------|
| `f` | chamada de função — `if` só os args, `af` com o nome |
| `c` | classe (treesitter) |
| `o` | bloco / `if` / `for` / `while` |
| `t` | tag HTML/JSX |
| `d` | sequência de dígitos |
| `e` | pedaço de camelCase/snake_case (o `Case` de `wordCase`) |
| `g` | o buffer inteiro (`vig`, `dig`, `=ig`) |
| `u` / `U` | chamada de função (`U` sem o namespace antes do ponto) |
| `?` | você digita os delimitadores (`ci?` → abertura `<CR>` fechamento `<CR>`) |

Prefixe com `n` (próximo) ou `l` (anterior): `cin"`, `dal)`, `yin}`.

## 16. Navegação por treesitter

| Tecla | Ação |
|-------|------|
| `]f` / `[f` | próxima / anterior função |
| `]c` / `[c` | próxima / anterior classe |
| `]a` / `[a` | próximo / anterior parâmetro |
| `]F` `[F` `]C` `[C` `]A` `[A` | idem, mirando o **fim** do nó |
| `]n` / `[n` | próximo / anterior nó do treesitter (mini.bracketed) |

Seleção incremental (LazyVim): `<CR>` expande, `<BS>` encolhe.

---

## 17. Toggles do LazyVim — `<Leader>u…`

| Tecla | Alterna |
|-------|---------|
| `<Leader>uw` | wrap de linha |
| `<Leader>us` | spell |
| `<Leader>ul` / `<Leader>uL` | número da linha / número relativo |
| `<Leader>ud` | diagnósticos |
| `<Leader>uh` | inlay hints |
| `<Leader>uc` | conceal |
| `<Leader>ub` | fundo claro/escuro |
| `<Leader>uT` | treesitter highlight |
| `<Leader>uf` / `<Leader>uF` | autoformat (global / buffer) — ver também `:ToggleAutoformat` |
| `<Leader>ur` | redraw + limpa realce de busca |
| `<Leader>un` | descarta todas as notificações |

## 18. Buffers e abas

| Tecla | Ação |
|-------|------|
| `<S-h>` / `<S-l>` | buffer anterior / próximo |
| `[b` / `]b` | idem (mini.bracketed) |
| `<Leader>bd` | fecha o buffer |
| `<Leader>bo` | fecha os outros buffers |
| `<Leader>bp` / `<Leader>bP` | pin / fecha os não-pinados (bufferline) |
| `<Leader>,` | lista buffers (picker) |
| ``<Leader>` `` | volta pro buffer anterior (`:e #`) |
| `<Tab>` / `<S-Tab>` | próxima / anterior **aba** (override custom) |
| `te` | nova aba (`:tabedit`) |
