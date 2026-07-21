# Pyenv
set -l PYENV_ROOT "$DOT_PLUGIN_HOME/pyenv"
if test -d "$PYENV_ROOT"
    set -gx PYENV_ROOT "$PYENV_ROOT"

    if not command -q pyenv
        fish_add_path "$PYENV_ROOT/bin"
    end

    pyenv init - | source
end