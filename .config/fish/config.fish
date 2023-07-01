if not functions -q fundle; eval (curl -sfL https://git.io/fundle-install); end
fundle plugin 'patrickf1/fzf.fish'
fundle init

alias coffee='caffeinate -s &'
alias cloud='cd ~/Library/Mobile\ Documents'
alias vim='nvim'
alias e='nvim'
alias bat='bat --style=numbers,changes --color=always --line-range=:200 --decorations=always'
alias ls='lsd --color=always'
alias ll='ls -l'
alias la='ls -a'
alias lla='ls -la'
alias lt='ls --tree'
alias sudo='sudo '         # allow using aliases in sudo
alias abs='readlink -f'    # get absolute path
alias fzf='fzf --height 40% --reverse --preview "bat {}" \
	               --preview-window=50% --info=inline --border=none --keep-right --scrollbar=█ --no-color \
	               --bind="ctrl-\:change-preview-window(80%|hidden|)"'
alias reload='source ~/.config/fish/config.fish'
# TODO make script/ansible book for automation
alias dot='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME' # manage git bare repo for dotfiles
alias dotrm='dot rm --cached -f'                                      # remove file from git bare repo
if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -gx HOMEBREW_NO_AUTO_UPDATE 1
set fish_greeting ""
set -gx EDITOR nvim

##### fzf.fish settings
# TODO: rewrite with fd, rg is for pattern find inside the file
# Ctrl-o will open the selected file/directory in your editor of choice
set fzf_directory_opts --bind 'ctrl-o:execute($EDITOR {} &> /dev/tty)'
set fzf_preview_dir_cmd lt
set fzf_fd_opts --hidden --exclude=.git --exclude=node_modules --exclude=.m2 --exclude=.groovy
# TODO: use fd only
#set -gx FZF_DEFAULT_COMMAND 'rg --files --no-ignore-vcs --glob "!*/{.git,node_modules}/**"'
set -gx FZF_CTRL_T_COMMAND 'fd --type d'
#set -gx FZF_ALT_C_COMMAND 'fd --type d --no-ignore-vcs --exclude node_modules --exclude .git'
# run 'fzf_configure_bindings --help' for details
# search Directory   |  Cmd+F  (F for file)
# search Git Log     |  Cmd+L  (L for log)
# search Git Status  |  Cmd+S  (S for status)
# search History     |  Ctrl+R (R for reverse)
# search Processes   |  Cmd+P  (P for process)
# search Variables   |  Ctrl+V (V for variable)
fzf_configure_bindings --directory=\e\[102\;9u --git_log=\e\[108\;9u --git_status=\e\[115\;9u --history=\cR --processes=\e\[112\;9u --variables=\cV

function fzff
     set_colorscheme
     command fzf --height 40% --reverse --preview "bat {}" \
	               --preview-window 50% --info inline --border none --keep-right \
		       --scrollbar=█ --border-label="test-test" \
	               --bind "ctrl-\:change-preview-window(80%|hidden|)" $argv
end

function set_colorscheme
    # TODO: need to add LS_COLORS and move to service that manages dark mode look
    # https://minsw.github.io/fzf-color-picker/
    # https://github.com/sharkdp/vivid

    defaults read -g AppleInterfaceStyle 1>/dev/null 2>/dev/null
    if test $status -eq 1
        # dawnfox
        set -gx FZF_DEFAULT_OPTS \
            ' --color=fg:#575279,bg:#faf4ed,hl:#2d81a3'\
            ' --color=fg+:#faf4ed,bg+:#575279,hl+:#eea846'\
            ' --color=info:#b4637a,prompt:#c9709e,pointer:#de8db7'\
            ' --color=marker:#eea846,spinner:#b4637a,header:#dd9024'
    else
        # duskfox
        set -gx FZF_DEFAULT_OPTS \
        '--color=fg:#e0def4,bg:#232136,hl:#65b1cd'\
        '--color=fg+:#232136,bg+:#cdcbe0,hl+:#4a869c'\
        '--color=info:#b4637a,prompt:#c9709e,pointer:#de8db7'\
        '--color=marker:#e6a852,spinner:#b4637a,header:#e6a852'
    end
end


zoxide init fish | source
starship init fish | source
