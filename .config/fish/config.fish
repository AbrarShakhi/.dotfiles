if status is-interactive
    set -U fish_greeting
end

# XDG
set -gx XDG_CONFIG_HOME "$HOME/.config"
set -gx XDG_DATA_HOME "$HOME/.local/share"

# Editor
set -gx EDITOR nvim

# Misc
set -gx GCC_COLORS 'error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'
# set -gx SUDO_PROMPT "[sudo] password for $USER  :"


if test -d "$XDG_DATA_HOME/bin"
    fish_add_path -g "$XDG_DATA_HOME/bin"
end

if test -d "$HOME/.local/bin"
    fish_add_path -g "$HOME/.local/bin"
end

if test -d "$HOME/.local/scripts"
    fish_add_path -g "$HOME/.local/scripts"
end


set -gx DOT_PLUGIN_HOME "$HOME/.local/apps"

if command -q ssh-agent
    and test "$OS" != "Windows_NT"
    and test -z "$SSH_AUTH_SOCK"
    eval (ssh-agent -c)
end
