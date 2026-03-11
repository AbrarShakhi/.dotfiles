# lib/directory.sh
#!/bin/sh

. "$SCRIPT_DIR/lib/logger.sh"

# -------------------------------
# Directory Utilities
# -------------------------------
remove_dir() {
    dir="$1"

    if [ -d "$dir" ]; then
        log "Removing '$dir'..."
        rm -rf "$dir"
    fi
}

ensure_dir() {
    dir="$1"

    if [ ! -d "$dir" ]; then
        log "Creating '$dir'..."
        mkdir -p "$dir"
    fi
}

prompt_recreation() {
    dir="$1"

    if [ -d "$dir" ]; then
        log "'$dir' already exists."

        prompt "This will delete all contents in $dir."
        prompt "Type 'yes' to proceed, or anything else to cancel: "
        read response

        if [ "$response" != "yes" ]; then
            error "Aborted. '$dir' was not removed."
            exit 1
        fi

        log "Removing '$dir'..."
        rm -rf "$dir"
        success "'$dir' has been removed."
    fi
}

create_directories() {
    log "Checking for necessary directories..."

    ensure_dir "$HOME/.local/apps"
    ensure_dir "$HOME/.local/share/bin"
    ensure_dir "$HOME/.cache"

    log "Checking configuration directory..."
    ensure_dir "$HOME/.config"
}

recreate_directories() {
    prompt_recreation "$HOME/.local/bin"
}