# Android Studio / Android SDK
set -gx ANDROID_HOME "$HOME/Android/Sdk"
set -gx ANDROID_SDK_ROOT "$HOME/Android/Sdk"

fish_add_path \
    "$ANDROID_HOME/emulator" \
    "$ANDROID_HOME/platform-tools" \
    "$ASTUDIO_DIR/cmdline-tools/latest/bin"

# Optional
# set -gx ANDROID_SDK_HOME "$HOME/.android"
# set -gx ANDROID_AVD_HOME "$HOME/.android/avd"

# JetBrains Toolbox
set -l JETBRAINS_TOOLBOX_PATH "$XDG_DATA_HOME/JetBrains/Toolbox/scripts"
if test -d "$JETBRAINS_TOOLBOX_PATH"
    fish_add_path "$JETBRAINS_TOOLBOX_PATH"
end