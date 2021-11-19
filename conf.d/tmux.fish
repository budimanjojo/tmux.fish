if not type -q tmux
    echo "fish tmux plugin: tmux not found. Please install tmux before using this plugin." >&2
    exit 1
end

set -q fish_tmux_fixterm || set fish_tmux_fixterm true
set -q fish_tmux_iterm2 || set fish_tmux_iterm2 false
set -q fish_tmux_fixterm_without_256color || set fish_tmux_fixterm_without_256color "screen"
set -q fish_tmux_fixterm_with_256color || set fish_tmux_fixterm_with_256color "screen-256color"
set -q fish_tmux_config || set -x fish_tmux_config "$HOME/.tmux.conf"
set -q fish_tmux_unicode || set fish_tmux_unicode false

if test (tput colors) = "256"
    set -x fish_tmux_term $fish_tmux_fixterm_with_256color
else
    set -x fish_tmux_term $fish_tmux_fixterm_without_256color
end

set -l script_dir (realpath (dirname (status -f)))
if test ! $fish_tmux_iterm2 = true && test -e $fish_tmux_config
    set -x _fish_tmux_fixed_config "$script_dir/tmux.extra.conf"
else
    set -x _fish_tmux_fixed_config "$script_dir/tmux.only.conf"
end

set -l tmux_args

test $fish_tmux_iterm2 = true && set -a tmux_args "-CC"
test $fish_tmux_unicode = true && set -a tmux_args "-u"

if test $fish_tmux_fixterm = true
    set -a tmux_args "-f $_fish_tmux_fixed_config"
else if test -e $fish_tmux_config
    set -a tmux_args "-f $fish_tmux_config"
end

if status is-interactive; and not set -q TMUX; and not fish_is_root_user
    if tmux has-session
        exec tmux attach
    else
        exec tmux $tmux_args
    end
end
