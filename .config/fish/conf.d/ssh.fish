if test "$OS" != "Windows_NT"
    and test -z "$SSH_AUTH_SOCK"
    and command -q ssh-agent
    eval (ssh-agent -c)
end
