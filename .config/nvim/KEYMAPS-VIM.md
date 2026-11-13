# Neovim — vim puro + combos do dia a dia

O que está aqui: movimentos, text objects, operadores, busca/substituição e as
**combinações que você usa toda hora** — trocar tudo dentro de aspas, renomear
todas as ocorrências estilo VSCode, macros, edição em massa com `:g`, etc.

- Atalhos **custom + plugins** → `keymaps-nvim`
- **TUIs do terminal** (tmux, lazygit, …) → `keymaps-tools`
- Base: **LazyVim**. `<Leader>` = `<Space>`, `<LocalLeader>` = `\`.
- Dentro do editor: `<Leader>sk` busca qualquer keymap · segure `<Leader>` p/ o menu do which-key.

---

## ⚠️ Overrides da SUA config (mordem quem vem do VSCode)

| Tecla | Vanilla faz | Na sua config faz |
|-------|-------------|-------------------|
| `x` | deleta char (copia p/ o registrador) | deleta char **sem copiar** (`"_x`) |
| `dw` | deleta daqui até o início da próxima palavra (pra **frente**) | deleta a palavra **pra trás**, sem copiar (`vb"_d`) |
| `+` / `_` | primeira coluna não-branca da linha abaixo / atual | **incrementa / decrementa** número (era `<C-a>`/`<C-x>`) |
| `<C-a>` | incrementa número | **seleciona tudo** (`gg<S-v>G`) |
| `<C-m>` | igual a `<CR>` (linha abaixo) | pula pra **frente** no jumplist (`<C-i>`) |
| `s` / `S` | `s` = `cl`, `S` = `cc` | prefixo de janela (`ss` `sv` `sh` `sj` `sk` `sl` `sf`) — use `cl` / `cc` |
| `<Tab>` / `<S-Tab>` (normal) | outros | próxima / anterior **tab** (`:tabnext` / `:tabprev`) |

Pra deletar palavra pra **frente**: `de` (até o fim da palavra) ou `daw` / `diw`.

---

## 1. A fórmula: `[nº] operador [nº] {alvo}`

`alvo` = um **movimento** (`w`, `$`, `}`, `G`, `/foo`) ou um **text object** (`iw`, `i"`, `ap`).

| Operador | Ação |
|----------|------|
| `d` | delete (recorta) |
| `c` | change (deleta e entra em insert) |
| `y` | yank (copia) |
| `=` | auto-indenta |
| `>` / `<` | indenta / desindenta |
| `gu` / `gU` / `g~` | minúscula / MAIÚSCULA / inverte caixa |
| `gq` / `gw` | requebra linha na `textwidth` |
| `g?` | ROT13 (curiosidade) |
| `!` | filtra por comando externo (`!ipsort`) |

Duplicar o operador = linha inteira: `dd`, `yy`, `cc`, `>>`, `guu`, `gUU`.
Versão MAIÚSCULA = "até o fim da linha": `D` = `d$`, `C` = `c$`, `Y` = `yy`.

**Exemplos de leitura:** `d2w` deleta 2 palavras · `c3j` muda 4 linhas · `y}` copia até o próximo parágrafo · `>ip` indenta o parágrafo · `gUiw` a palavra vira MAIÚSCULA · `=iB` reindenta o bloco `{}`.

---

## 2. Movimento

### Na linha
| Tecla | Vai para |
|-------|----------|
| `0` / `^` / `$` | coluna 0 / primeiro não-branco / fim da linha |
| `g_` | último caractere não-branco |
| `f{c}` / `F{c}` | próxima / anterior ocorrência de `{c}` na linha (cursor **em cima**) |
| `t{c}` / `T{c}` | idem, mas para **antes** de `{c}` |
| `;` / `,` | repete o último `f`/`t` / repete no sentido contrário |
| `\|` | coluna N (`20\|` vai pra coluna 20) |

### Palavras
| Tecla | Vai para |
|-------|----------|
| `w` / `b` | início da próxima / palavra anterior |
| `e` / `ge` | fim da palavra atual / fim da anterior |
| `W` `B` `E` | idem, mas "WORD" = separado só por espaço (ignora pontuação) |

### Tela e arquivo
| Tecla | Ação |
|-------|------|
| `gg` / `G` | topo / fim do arquivo · `42G` ou `:42` vai pra linha 42 |
| `<C-d>` / `<C-u>` | desce / sobe meia tela |
| `<C-f>` / `<C-b>` | página inteira pra frente / trás |
| `H` / `M` / `L` | topo / meio / base da **tela** visível |
| `zz` / `zt` / `zb` | centraliza / joga a linha atual pro topo / base |
| `<C-e>` / `<C-y>` | rola 1 linha sem mexer o cursor |
| `%` | pula pro par correspondente `()` `[]` `{}` |

### Parágrafos e blocos
| Tecla | Ação |
|-------|------|
| `{` / `}` | parágrafo anterior / próximo (linha em branco) |
| `(` / `)` | frase anterior / próxima |
| `[[` / `]]` | seção anterior / próxima (ou `{` na coluna 0) |
| `[{` / `]}` | início / fim do bloco `{}` atual |
| `[(` / `])` | início / fim dos `()` atuais |

### Treesitter (mini.bracketed + textobjects)
| Tecla | Ação |
|-------|------|
| `]f` / `[f` | próxima / anterior **função** |
| `]c` / `[c` | próxima / anterior **classe** |
| `]a` / `[a` | próximo / anterior **parâmetro/argumento** |
| `]F` `[F` `]C` `[C` `]A` `[A` | idem, mirando o **fim** do nó |
| `]n` / `[n` | próximo / anterior **nó** do treesitter (mini.bracketed) |
| `]d` / `[d` | próximo / anterior **diagnóstico** |
| `]h` / `[h` | próximo / anterior **hunk** do git |
| `]t` / `[t` | próximo / anterior **TODO/FIX/HACK** |
| `]b` `]q` `]l` `]u` `]y` `]x` `]j` | buffer · quickfix · loclist · undo · yank · conflito · jump (mini.bracketed) |

---

## 3. Text objects — `{i|a}{alvo}`

`i` = **inside** (só o conteúdo) · `a` = **around** (inclui as bordas / espaço).

### Nativos
| Alvo | O que pega |
|------|-----------|
| `w` / `W` | palavra / WORD |
| `s` | frase |
| `p` | parágrafo |
| `"` `'` `` ` `` | dentro das aspas |
| `(` `)` `b` | dentro dos parênteses |
| `{` `}` `B` | dentro das chaves |
| `[` `]` | dentro dos colchetes |
| `<` `>` | dentro dos sinais de menor/maior |
| `t` | dentro da tag HTML/JSX (`<div>...</div>`) |

### mini.ai (extras, ativos aqui)
| Alvo | O que pega |
|------|-----------|
| `f` | chamada de função inteira — `af` com nome+args, `if` só os args |
| `c` | classe (treesitter) |
| `o` | bloco / `if` / `for` / `while` (treesitter) |
| `t` | tag (versão treesitter, mais robusta) |
| `d` | sequência de dígitos |
| `e` | "word with case" — pega **um pedaço de camelCase/snake_case** (ex: o `Case` de `wordWithCase`) |
| `g` | o buffer inteiro (`dig`, `yig`, `vig`) |
| `u` / `U` | chamada de função — `U` sem incluir o namespace antes do ponto |
| `?` | **você digita** os delimitadores de abertura e fechamento (`ci?` → `<` `<Enter>` `>` `<Enter>`) |

Variantes mini.ai: prefixe com `n` (**next**) ou `l` (**last**): `cin(` muda dentro do **próximo** `()`, `dil"` deleta dentro das aspas **anteriores**, `yan}` copia o **próximo** bloco.

---

## 4. Combo verbo + alvo — receitas

| Combo | Faz |
|-------|-----|
| `ciw` | troca a palavra sob o cursor |
| `ci"` / `ci'` / `` ci` `` | **troca tudo dentro das aspas** |
| `ca"` | troca as aspas + o conteúdo |
| `ci(` / `ci)` / `cib` | troca tudo dentro dos parênteses |
| `ci{` / `ciB` | troca tudo dentro das chaves |
| `cit` | troca o conteúdo da tag HTML |
| `di{` / `da{` | deleta dentro das chaves / incluindo elas |
| `yi(` / `ya(` | copia dentro dos `()` / incluindo eles |
| `vi{` / `va{` | seleciona dentro das chaves / incluindo elas |
| `dap` / `yap` / `>ap` | deleta / copia / indenta o parágrafo inteiro |
| `cif` / `dif` | troca / deleta os **argumentos** da função |
| `daf` | deleta a chamada de função inteira |
| `cie` | troca só um pedaço do identificador camelCase |
| `dt)` | deleta até o `)` (sem incluir) |
| `ct"` | troca até a próxima aspas |
| `di?` | deleta dentro de delimitadores que você digita |
| `gUiw` / `guiw` / `g~iw` | palavra → MAIÚSCULA / minúscula / inverte |
| `=i{` | reindenta o bloco `{}` |
| `!ip sort` | ordena as linhas do parágrafo por `sort` |
| `guu` | linha inteira pra minúscula |

`.` repete o **último combo de edição** (não repete movimento nem `:s`). É o comando mais poderoso do vim — ver seção 11.

---

## 5. Edição rápida (normal mode)

| Tecla | Ação |
|-------|------|
| `r{c}` | troca **1** caractere por `{c}` (sem entrar em insert) |
| `3r-` | troca os próximos 3 chars por `-` |
| `R` | modo replace (sobrescreve digitando) |
| `~` | inverte a caixa do char e anda |
| `J` / `gJ` | junta a linha de baixo (com espaço / sem espaço) |
| `xp` | troca dois chars de lugar · `ddp` troca duas linhas |
| `>>` / `<<` | indenta / desindenta a linha · `==` auto-indenta |
| `3==` | auto-indenta 3 linhas |
| `dd` / `yy` / `p` / `P` | recorta / copia linha · cola abaixo / acima |
| `]p` | cola reindentando pro contexto atual |
| `4dd` | deleta 4 linhas · `d5G` deleta até a linha 5 |
| `D` / `C` / `Y` | do cursor até o fim da linha: deleta / muda / copia |
| `S` (vanilla) | limpa a linha e entra em insert — na sua config use `cc` |
| `u` / `<C-r>` | desfaz / refaz |
| `U` | desfaz todas as mudanças na linha atual |
| `g-` / `g+` | navega na **árvore** de undo (estados antigos/novos) |
| `<C-a>` / `<C-x>` | incrementa / decrementa (aqui: `+` / `_`; entende hex, datas, bool, semver, `let`↔`const`) |
| `g<C-a>` (visual) | incrementa em **cascata** (1,1,1 → 1,2,3) |
| `&` | repete o último `:s` na linha atual |
| `@:` | repete o último comando de `:` |

---

## 6. Insert mode (atalhos que salvam)

| Tecla | Ação |
|-------|------|
| `i` `a` / `I` `A` | insere antes/depois do cursor / no início/fim da linha |
| `o` / `O` | abre linha abaixo / acima |
| `gi` | volta pra onde você estava editando por último |
| `<C-w>` | apaga a palavra anterior |
| `<C-u>` | apaga até o início da linha |
| `<C-h>` | apaga um char (backspace) |
| `<C-r>{reg}` | cola o registrador `{reg}` (`<C-r>0` = último yank, `<C-r>"` = unnamed, `<C-r>%` = nome do arquivo) |
| `<C-r>=2*21<CR>` | insere o resultado de uma expressão |
| `<C-t>` / `<C-d>` | indenta / desindenta a linha sem sair do insert |
| `<C-o>{cmd}` | executa **um** comando normal e volta pro insert (`<C-o>O` abre linha acima) |
| `<C-a>` | reinsere o texto do último insert |
| `<C-n>` / `<C-p>` | autocomplete simples de palavra (pra frente / trás) |
| `<Esc>` ou `<C-[>` | volta pro normal |

---

## 7. Visual mode

| Tecla | Ação |
|-------|------|
| `v` / `V` / `<C-v>` | char / linha / **bloco** (coluna) |
| `gv` | reseleciona a última seleção |
| `o` | pula pra outra ponta da seleção |
| `>` / `<` | indenta / desindenta (`gv` pra manter selecionado e repetir) |
| `=` | auto-indenta a seleção |
| `~` / `u` / `U` | inverte caixa / minúscula / MAIÚSCULA |
| `J` | junta as linhas selecionadas |
| `r{c}` | troca cada char da seleção por `{c}` |
| `:s/x/y/g` | substitui só dentro da seleção (o `:'<,'>` aparece sozinho) |
| `<C-a>` / `<C-x>` | incrementa / decrementa todos os números selecionados |
| `g<C-a>` | numeração sequencial (ver seção 5) |

### Bloco visual (`<C-v>`) — colunas
1. `<C-v>` → move `j`/`k` pra pegar as linhas → `l`/`$` pra largura.
2. `I{texto}<Esc>` insere **no começo de todas** · `A{texto}<Esc>` insere **no fim de todas**.
3. `c{texto}<Esc>` troca o bloco em todas · `d` deleta a coluna · `r{c}` preenche.
4. `$A;` = ponto-e-vírgula no fim de várias linhas de tamanhos diferentes.

---

## 8. Registradores e clipboard

| Registrador | O que é |
|-------------|---------|
| `"0` | último **yank** (não é sujo por deletes) — na sua config `<Leader>p` cola dele |
| `""` | unnamed (último yank OU delete) |
| `"1`–`"9` | histórico de deletes/changes (`"1` = mais recente) |
| `"a`–`"z` | registradores nomeados (`"ayy` copia pra `a`, `"Ayy` **acrescenta**) |
| `"_` | buraco negro — `"_d` deleta sem sujar nada (na sua config: `<Leader>d`) |
| `"+` / `"*` | clipboard do sistema (`"+y`, `"+p`) |
| `".` | último texto inserido · `":` último comando · `"%` nome do arquivo |
| `"/` | último padrão de busca |

`:reg` lista tudo · `:reg a b` mostra só `a` e `b`.
`<C-r>a` no insert / cmdline cola o registrador `a`.

---

## 9. Busca

| Tecla | Ação |
|-------|------|
| `/foo` / `?foo` | busca pra frente / trás |
| `n` / `N` | próximo / anterior (no mesmo sentido / contrário) |
| `*` / `#` | busca a **palavra inteira** sob o cursor pra frente / trás |
| `g*` / `g#` | idem, mas **parcial** (casa `foobar` também) |
| `/<CR>` | repete a última busca · `//new<CR>` reaproveita o padrão |
| `<C-r><C-w>` | (na linha de `/` ou `:`) puxa a palavra sob o cursor |
| `<C-r><C-a>` | puxa a WORD sob o cursor |
| `:noh` | limpa o realce (na sua config: `<Esc>` no normal já limpa) |
| `/foo\c` / `/foo\C` | força ignorar / respeitar caixa nessa busca |
| `/\vfoo(bar)?` | "very magic": regex quase normal (menos `\` de escape) |
| `/foo\zsbar` | casa `foobar` mas o cursor/seleção começa no `bar` |
| `gd` / `gD` | vai pra 1ª ocorrência do identificador local / global (sem LSP) |
| `q/` | janela com o **histórico de buscas** (edita e dá `<CR>`) |

---

## 10. Substituição `:s` — inclui renomear no arquivo todo

```
:s/velho/novo/          troca a 1ª ocorrência da linha atual
:s/velho/novo/g         troca todas na linha atual
:%s/velho/novo/g        troca no ARQUIVO inteiro
:%s/velho/novo/gc       idem, pedindo confirmação a cada uma
:'<,'>s/velho/novo/g    só dentro da seleção visual
:.,+10s/velho/novo/g    da linha atual até +10
:.,$s/velho/novo/g      da linha atual até o fim
```

**Confirmação (`c`):** `y` sim · `n` não · `a` todas · `q` para · `l` essa e para · `<C-e>`/`<C-y>` rola a tela.

| Truque | Efeito |
|--------|--------|
| `\<foo\>` | casa a **palavra inteira** `foo` (não `foobar`) |
| `:%s//novo/g` | padrão vazio = **reaproveita a última busca** (faça `*` e depois isso) |
| `<C-r><C-w>` | dentro do `:%s/` puxa a palavra sob o cursor |
| `\(...\)` … `\1` | grupo de captura → referência (`:%s/\(\w\+\)=\(\w\+\)/\2=\1/`) |
| `\U` `\L` `\e` | no "novo": MAIÚSCULA / minúscula até `\e` (`:%s/\<./\U&/g` capitaliza) |
| `&` (no novo) | insere o texto casado inteiro |
| `&` (normal) | repete o último `:s` na linha atual |
| `g&` | repete o último `:s` no arquivo todo, com os mesmos flags |
| `:&&` | repete `:s` mantendo os flags |
| `:%s/\s\+$//e` | remove espaços no fim das linhas (`e` = não reclama se não achar) |
| `:g/padrão/d` | **deleta** todas as linhas que casam |
| `:v/padrão/d` | deleta as linhas que **não** casam (mantém só as que casam) |
| `:%s/velho/novo/gc` **+** `<C-r>0` | trocar pelo que você acabou de copiar: `:%s/<C-r>0/novo/g` |

**Renomear variável no arquivo (com preview do LSP):** `<Leader>rn` — só isso, respeita escopo.
Sem LSP (texto puro): `:%s/\<velho\>/novo/gc`.

---

## 11. `cgn` — o "Ctrl+D do VSCode" no vim puro

Não tem multi-cursor instalado. O jeito nativo (e melhor pra 90% dos casos):

1. Cursor em cima da palavra → `*` (busca a palavra inteira, já pula pra próxima).
   - Quer casar parcial? Use `g*`. Quer texto arbitrário? `/meu texto<CR>`.
2. `N` uma vez pra voltar pra primeira ocorrência (opcional).
3. `cgn` → digita a substituição → `<Esc>`. (`cgn` = "change the next match of the search pattern".)
4. `.` repete: pula pra próxima ocorrência **e** refaz a troca. Continue `.` `.` `.`.
5. Pra **pular** uma ocorrência sem mudar: `n` e depois `.` de novo.

Variações: `dgn` deleta a próxima · `cgN` / `dgN` operam pra trás.

Quando usar cada um:
- **Poucas e você quer escolher uma a uma** → `*` `cgn` `.` `.` (`n` pula).
- **Todas de uma vez, com conferência** → `:%s/\<foo\>/bar/gc`.
- **Todas sem pensar** → `:%s/\<foo\>/bar/g`.
- **Só num trecho** → seleciona no visual, `:s/foo/bar/g`.

Multi-cursor de verdade (seleções simultâneas estilo VSCode) → ver seção 15.

---

## 12. Macros — repetir sequências complexas

| Tecla | Ação |
|-------|------|
| `q{a}` | começa a **gravar** no registrador `a` |
| `q` | para de gravar |
| `@a` | executa o macro `a` |
| `@@` | repete o último macro executado |
| `10@a` | executa 10 vezes (para no primeiro erro — ótimo, é o "freio") |
| `q{A}` | grava **acrescentando** no macro `a` existente |
| `:%norm @a` | roda o macro `a` em **todas as linhas** do arquivo |
| `:'<,'>norm @a` | roda o macro só nas linhas selecionadas |
| `:g/padrão/norm @a` | roda o macro só nas linhas que casam `padrão` |

**Editar um macro:** `"ap` cola o conteúdo do registrador `a` numa linha → edita → `0"ay$` copia de volta pra `a`.

Dica: comece o macro com `0` ou `^` pra ele ser "à prova de posição", e termine com `j` pra ele avançar sozinho.

---

## 13. `:g` e `:normal` — edição em massa

```
:g/console\.log/d           deleta toda linha com console.log
:g/^\s*$/d                  deleta linhas em branco
:g/padrão/normal A;         acrescenta ; no fim de cada linha que casa
:g/padrão/normal ciwFOO     troca a palavra sob o cursor em cada linha que casa
:g/TODO/t$                  copia toda linha com TODO pro fim do arquivo
:g/padrão/m0                move as linhas que casam pro topo (agrupa)
:v/padrão/d                 deleta o que NÃO casa
:%normal A;                 ; no fim de TODAS as linhas
:'<,'>normal I// %           comenta a seleção na unha (ou só use gc)
```

`:t` = copy (`:t.` duplica a linha) · `:m` = move · `:normal` roda comandos do modo normal.

---

## 14. Marcas, jumps e histórico

| Tecla | Ação |
|-------|------|
| `m{a}` | põe a marca `a` na posição atual |
| `` `{a} `` / `'{a}` | vai pra marca `a` (posição exata / início da linha) |
| `` `` `` / `''` | volta pra posição de antes do último salto |
| `` `. `` | vai pra última edição · `` `^ `` último ponto de insert |
| `` `" `` | posição em que você fechou o arquivo da última vez |
| `<C-o>` / `<C-i>` | volta / avança no **jumplist** (aqui `<C-i>` também é `<C-m>`) |
| `g;` / `g,` | volta / avança no **changelist** (lista de edições) |
| `:marks` | lista todas as marcas |
| `[a`–`]z` maiúsculas | marcas **globais** (funcionam entre arquivos): `mA`, `` `A `` |

Jumps contam: `/`, `n`, `G`, `{`, `}`, `%`, `H`/`M`/`L`, `:linha`. `j`/`k`/`w` **não** contam.

---

## 15. Folds, spell, diff

### Folds
`za` alterna · `zR` abre todas · `zM` fecha todas · `zo`/`zc` abre/fecha uma · `zj`/`zk` próximo/anterior fold · `zf{motion}` cria fold manual.

### Spell (`<Leader>us` liga/desliga)
`]s` / `[s` próximo / anterior erro · `z=` sugestões · `zg` adiciona ao dicionário · `zw` marca como errada · `1z=` aceita a 1ª sugestão direto.

### Diff (`:Gdiffsplit`, Diffview, `nvim -d`)
`]c` / `[c` próxima / anterior mudança · `do` (diff obtain) puxa a mudança do outro lado · `dp` (diff put) empurra pro outro lado · `zR` abre tudo · `:diffupdate` recalcula.
> Obs: aqui `]c`/`[c` sem diff = navegar classes (treesitter).

---

## 16. Receitas do dia a dia (índice rápido)

| Quero… | Faço |
|--------|------|
| Trocar o texto dentro de uma string | `ci"` (ou `ci'`, `` ci` ``) |
| Trocar dentro de qualquer delimitador | `ci?` e digitar abertura/fechamento |
| Trocar tudo dentro dos parênteses de uma função | `ci(` ou `cif` (só os args) |
| Renomear uma variável no arquivo (com preview) | `<Leader>rn` |
| Renomear "estilo Ctrl+D", escolhendo uma a uma | cursor na palavra → `*` `N` `cgn` novo `<Esc>` → `.` `.` (`n` pula) |
| Renomear todas de uma vez, conferindo | `:%s/\<velho\>/novo/gc` |
| Renomear só num trecho | seleciona no visual → `:s/velho/novo/g` |
| Trocar pelo que acabei de copiar | `:%s/<C-r>0/alvo/g` |
| Adicionar `;` no fim de várias linhas | `<C-v>` seleciona as linhas → `$A;` `<Esc>` |
| Prefixar várias linhas (ex: `- `) | `<C-v>` seleciona → `I- ` `<Esc>` |
| Comentar um parágrafo | `gcap` · linha: `gcc` · seleção: `gc` |
| Deletar todas as linhas com `console.log` | `:g/console\.log/d` |
| Apagar linhas em branco | `:g/^\s*$/d` |
| Tirar espaço no fim das linhas | `:%s/\s\+$//e` |
| Envolver a linha de baixo (juntar) | `J` |
| Mover linha pra cima/baixo | `:m+1` / `:m-2` (ou visual `:m'>+1`) |
| Duplicar a linha | `yyp` (ou `:t.`) |
| Reindentar o bloco todo | `=i{` (ou `gg=G` no arquivo inteiro) |
| CamelCase → trocar só um pedaço | `cie` em cima do pedaço |
| Selecionar tudo | `<C-a>` (sua config) ou `ggVG` |
| Voltar pra onde eu estava editando | `gi` ou `` `. `` ou `<C-o>` |
| Repetir a última edição | `.` |
| Rodar um macro em todas as linhas que casam | `:g/padrão/norm @a` |

---

## 17. Não instalado (mas útil saber que existe)

| Recurso | Plugin | Habilitar |
|---------|--------|-----------|
| **Multi-cursor** de verdade (várias seleções ao mesmo tempo, estilo VSCode Ctrl+D / Alt+Click) | `jake-stewart/multicursor.nvim` ou `mg979/vim-visual-multi` | adicionar em `lua/plugins/` |
| **Surround** (`cs"'`, `ds(`, `ysiw]`, `gsa`/`gsd`/`gsr`) | `mini.surround` (extra do LazyVim) | `:LazyExtras` → `coding.mini-surround` |
| **Pulo por labels** na tela (`s{2 chars}`) | `flash.nvim` | está no config com `enabled = false` — trocar pra `true` |
| `gco` / `gcO` / `gcA` (comentar linha abaixo/acima/fim + insert) | `numToStr/Comment.nvim` | adicionar em `lua/plugins/` |
| Move de linhas/blocos com `<M-j>`/`<M-k>` | `mini.move` | adicionar em `lua/plugins/` |

Enquanto isso: multi-cursor ≈ `cgn`+`.` (seção 11) · surround ≈ `ci"` + digitar as novas bordas, ou `:s` · mover linha ≈ `:m`.
