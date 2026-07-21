set BREW_DIR /home/linuxbrew/.linuxbrew

if test -d $BREW_DIR
    $BREW_DIR/bin/brew shellenv | source
end