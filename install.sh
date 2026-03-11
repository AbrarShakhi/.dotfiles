#!/bin/sh

set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
cd "$SCRIPT_DIR"

. "$SCRIPT_DIR/lib/directory.sh"
. "$SCRIPT_DIR/lib/module.sh"
. "$SCRIPT_DIR/lib/dependency.sh"

run_stow() {
    log "Running 'stow' to create symlinks..."
    stow .
    success "Symlinks have been created."
}

check_dependencies
create_directories
recreate_directories
run_stow
install_modules