# lib/dependency.sh
#!/bin/sh

. "$SCRIPT_DIR/lib/logger.sh"

check_runnable() {
    runnable="$1"

    if ! command -v $runnable >/dev/null 2>&1; then
        error "Could not find '$runnable'. Please install '$runnable'."
        exit 1
    fi

    success "$runnable is installed."
}

check_dependencies() {
    check_runnable "git"
    check_runnable "stow"
}