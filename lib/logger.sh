# lib/logging.sh
#!/bin/sh

# -------------------------------
# Colors
# -------------------------------
RED="\033[1;31m"
GREEN="\033[1;32m"
GRAY="\033[0;90m"
YELLOW="\033[1;33m"
RESET="\033[0m"

# -------------------------------
# Logging functions
# -------------------------------
log() {
    printf "${GRAY}%s${RESET}\n" "$1"
}

success() {
    printf "${GREEN}%s${RESET}\n" "$1"
}

error() {
    printf "${RED}%s${RESET}\n" "$1" >&2
}

prompt() {
    printf "${YELLOW}%s${RESET}" "$1"
}