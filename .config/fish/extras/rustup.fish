set -gx RUSTUP_HOME "$DOT_PLUGIN_HOME/rustup"
set -gx CARGO_HOME "$DOT_PLUGIN_HOME/cargo"

if test -d $CARGO_HOME
    source "$CARGO_HOME/env.fish"
end
