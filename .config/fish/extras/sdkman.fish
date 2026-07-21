
set -l SDKMAN_DIR "$DOT_PLUGIN_HOME/sdkman"
if test -d "$SDKMAN_DIR"
    set -gx SDKMAN_DIR "$SDKMAN_DIR"
    function sdk
        bash -lc 'source "${SDKMAN_DIR}/bin/sdkman-init.sh" && sdk $argv'
    end
end

