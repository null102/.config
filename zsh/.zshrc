# ~/.config/zsh/.zshrc — fish-flavored zsh

# ---------- History ----------
HISTFILE="$ZDOTDIR/.zsh_history"
HISTSIZE=100000
SAVEHIST=100000
setopt SHARE_HISTORY              # share across sessions
setopt HIST_IGNORE_DUPS            # don't store consecutive dupes
setopt HIST_IGNORE_ALL_DUPS        # remove older dupe entries
setopt HIST_IGNORE_SPACE           # ignore commands starting with space
setopt HIST_REDUCE_BLANKS
setopt EXTENDED_HISTORY

# ---------- Behavior ----------
setopt AUTO_CD                     # `dir/` instead of `cd dir/`
setopt AUTO_PUSHD                  # cd pushes onto dir stack
setopt PUSHD_IGNORE_DUPS
setopt INTERACTIVE_COMMENTS        # allow # comments interactively
setopt NO_BEEP
setopt PROMPT_SUBST

# ---------- Completion (fish-style) ----------
autoload -Uz compinit && compinit
zstyle ':completion:*' menu select                                 # arrow-key menu
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' \
                                    'r:|[._-]=* r:|=*' \
                                    'l:|=* r:|=*'                  # fuzzy/case-insensitive
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*:descriptions' format '%F{yellow}%d%f'
zstyle ':completion:*:warnings' format '%F{red}no matches for: %d%f'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' verbose yes

# ---------- Plugins ----------
ZSH_PLUGINS="$ZDOTDIR/plugins"

# autosuggestions: gray inline ghost-text from history (→ or Ctrl+F to accept)
source "$ZSH_PLUGINS/zsh-autosuggestions/zsh-autosuggestions.zsh"
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=8'  # gray, like fish's brblack

# history substring search: up-arrow filters history by current prefix
source "$ZSH_PLUGINS/zsh-history-substring-search/zsh-history-substring-search.zsh"
bindkey '^[[A' history-substring-search-up        # up arrow
bindkey '^[[B' history-substring-search-down      # down arrow
bindkey '^P'   history-substring-search-up
bindkey '^N'   history-substring-search-down

# syntax highlighting: must be sourced LAST
source "$ZSH_PLUGINS/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

# ---------- Keybinds (fish-like accept-suggestion) ----------
bindkey '^F'    autosuggest-accept                # Ctrl+F
bindkey '^[[C'  forward-char                      # → moves cursor; if at EOL, accepts
bindkey '^[f'   forward-word                      # Alt+→ word jump (terminal-dependent)
bindkey '^[b'   backward-word

# ---------- Prompt ----------
# %1~ = current dir only (last segment), with ~ for $HOME
# swap to %~ for full path with ~, or %2~ for last 2 segments
PROMPT='%F{cyan}%1~%f %F{green}❯%f '

# ---------- Aliases ----------
alias ls='ls -G'
alias ll='ls -lah'
alias la='ls -A'
alias ..='cd ..'
alias ...='cd ../..'
alias g='git'
alias gs='git status'
alias gd='git diff'
alias gl='git log --oneline --graph --decorate'

# ---------- Functions ----------
for f in ~/.config/zsh/functions/*.zsh; do
  source "$f"
done

