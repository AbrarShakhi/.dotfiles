
DOT_PLUGIN_HOME="$HOME/.local/apps"

# Homebrew
BREW_DIR="/home/linuxbrew/.linuxbrew"
if [ -d $BREW_DIR ]; then
    eval "$($BREW_DIR/bin/brew shellenv)"
fi

# Pyenv
PYENV_ROOT="$DOT_PLUGIN_HOME/pyenv"
if [ -d $PYENV_ROOT ]; then
    export PYENV_ROOT
    command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
    eval "$(pyenv init -)"
fi

# nvm
export NVM_DIR="$DOT_PLUGIN_HOME/nvm"
if [ -d $NVM_DIR ]; then
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
fi

# Sdkman
SDKMAN_DIR="$DOT_PLUGIN_HOME/sdkman"
if [ -d $SDKMAN_DIR ]; then
    export SDKMAN_DIR
    [[ -s "$SDKMAN_DIR/bin/sdkman-init.sh" ]] && source "$SDKMAN_DIR/bin/sdkman-init.sh"
fi

# Rustup
export RUSTUP_HOME="$DOT_PLUGIN_HOME/rustup"
export CARGO_HOME="$DOT_PLUGIN_HOME/cargo"
if [ -d $CARGO_HOME ]; then
. "$CARGO_HOME/env"
fi

# Flutter
FLUTTER_DIR="$DOT_PLUGIN_HOME/flutter"
export FLUTTER_DIR
export PATH="$PATH:$FLUTTER_DIR/bin"

# Android Studio
export ANDROID_HOME="$HOME/Android/Sdk"
export ANDROID_SDK_ROOT="$HOME/Android/Sdk"
export PATH="$PATH:$ANDROID_HOME/emulator"
export PATH="$PATH:$ANDROID_HOME/platform-tools"
export PATH="$PATH:$ASTUDIO_DIR/cmdline-tools/latest/bin"
# export ANDROID_SDK_HOME="$HOME/.android"
# export ANDROID_AVD_HOME="$HOME/.android/avd"

# Jetbrains Toolbox
JETBRAINS_TOOLBOX_PATH="$XDG_DATA_HOME/JetBrains/Toolbox/scripts"
if [ -d $JETBRAINS_TOOLBOX_PATH ]; then
    export PATH="$PATH:$JETBRAINS_TOOLBOX_PATH"
fi

# Bun
export BUN_INSTALL="$HOME/.local/apps/bun"
export PATH="$BUN_INSTALL/bin:$PATH"
