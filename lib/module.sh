# lib/module.sh
#!/bin/sh

. "$SCRIPT_DIR/lib/logger.sh"
. "$SCRIPT_DIR/lib/dependency.sh"
. "$SCRIPT_DIR/lib/directory.sh"

from_git() {
    repo="https://github.com/$1"
    to="$2"

    git clone $repo $to
}

install_modules() {
    
    remove_dir ~/.config/nvim
    remove_dir ~/.local/state/nvim
    remove_dir ~/.local/share/nvim
    # from_git LazyVim/starter ~/.config/nvimlazy
    
    remove_dir ~/.config/tmux/plugins/tpm
    from_git tmux-plugins/tpm ~/.config/tmux/plugins/tpm
}