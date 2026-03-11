# lib/module.sh
#!/bin/sh

. "$SCRIPT_DIR/lib/logger.sh"
. "$SCRIPT_DIR/lib/dependency.sh"
. "$SCRIPT_DIR/lib/directory.sh"

from_git() {
    repo="$1"
    to="$2"

    git clone $repo $to
}

install_modules() {
    
    remove_dir ~/.config/nvim
    remove_dir ~/.local/state/nvim
    remove_dir ~/.local/share/nvim
    from_git https://github.com/NvChad/starter ~/.config/nvim
    
    remove_dir ~/.tmux/plugins/tpm
    from_git https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
}