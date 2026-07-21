# SDKMAN
set -l SDKMAN_DIR "$DOT_PLUGIN_HOME/sdkman"
if test -d "$SDKMAN_DIR"
    set -gx SDKMAN_DIR "$SDKMAN_DIR"

    if test -s "$SDKMAN_DIR/bin/sdkman-init.sh"
        bash -c "source '$SDKMAN_DIR/bin/sdkman-init.sh'; env" | while read -l line
            if string match -qr '^[A-Za-z_][A-Za-z0-9_]*=' -- $line
                set -l key (string split -m1 "=" $line)[1]
                set -l value (string split -m1 "=" $line)[2]
                set -gx $key $value
            end
        end
    end
end