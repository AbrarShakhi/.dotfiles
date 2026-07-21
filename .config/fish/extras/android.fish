set -gx ANDROID_HOME "$HOME/Android/Sdk"
set -gx ANDROID_SDK_ROOT "$HOME/Android/Sdk"

fish_add_path \
    "$ANDROID_HOME/emulator" \
    "$ANDROID_HOME/platform-tools" \
    "$ASTUDIO_DIR/cmdline-tools/latest/bin"

set -gx ANDROID_SDK_HOME "$HOME/.android"
set -gx ANDROID_AVD_HOME "$HOME/.android/avd"

set -l JETBRAINS_TOOLBOX_PATH "$XDG_DATA_HOME/JetBrains/Toolbox/scripts"
fish_add_path "$JETBRAINS_TOOLBOX_PATH"
