
if test -d "$XDG_DATA_HOME/bin"
    fish_add_path -g "$XDG_DATA_HOME/bin"
end

if test -d "$HOME/.local/bin"
    fish_add_path -g "$HOME/.local/bin"
end

if test -d "$HOME/.local/scripts"
    fish_add_path -g "$HOME/.local/scripts"
end

set -l extras_dir "$XDG_CONFIG_HOME/fish/extras"
if test -d $extras_dir
    for file in $extras_dir/*.fish
        if test -f $file
            source $file
        end
    end
end