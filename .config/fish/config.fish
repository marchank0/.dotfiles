alias coffee="caffeinate -s &"
alias cloud="cd ~/Library/Mobile\ Documents"
alias vim="nvim"
alias e="nvim"
alias bat="bat --style numbers,changes --color=always"
alias ls="lsd"
alias ll="ls -l"
alias la="ls -a"
alias lla="ls -la"
alias lt="ls --tree"
alias sudo="sudo " # allow using aliases in sudo
alias abs="readlink -f" # get absolute path
alias fzf="fzf --height 40% --reverse --preview 'bat {} | head -n 100'"

alias dot="/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"

if status is-interactive
    # Commands to run in interactive sessions can go here
end

zoxide init fish | source
starship init fish | source

##### env
set fish_greeting ""

set -gx EDITOR nvim

# fzf
set -gx FZF_DEFAULT_COMMAND "rg --files --no-ignore-vcs --glob '!*/{.git,node_modules}/**'"
set -gx FZF_CTRL_T_COMMAND "rg --files --no-ignore-vcs --glob '!*/{.git,node_modules}/**'"
set -gx FZF_ALT_C_COMMAND "fd --type d --no-ignore-vcs --exclude node_modules --exclude .git"

# brew: now auto update
set -gx HOMEBREW_NO_AUTO_UPDATE 1


##### colors
function fzf_colors
    if test "$argv" = "dawnfox"
        # dawnfox
        set -gx FZF_DEFAULT_OPTS {$FZF_DEFAULT_OPTS}''\
            ' --color=fg:#575279,bg:#faf4ed,hl:#2d81a3'\
            ' --color=fg+:#faf4ed,bg+:#575279,hl+:#eea846'\
            ' --color=info:#b4637a,prompt:#c9709e,pointer:#de8db7'\
            ' --color=marker:#eea846,spinner:#b4637a,header:#dd9024'
    else
        # duskfox
        set -gx FZF_DEFAULT_OPTS {$FZF_DEFAULT_OPTS}''\
        '--color=fg:#e0def4,bg:#232136,hl:#65b1cd'\
        '--color=fg+:#232136,bg+:#cdcbe0,hl+:#4a869c'\
        '--color=info:#b4637a,prompt:#c9709e,pointer:#de8db7'\
        '--color=marker:#e6a852,spinner:#b4637a,header:#e6a852'
    end
end

function nvim_colors
end

function kitty_colors
end
