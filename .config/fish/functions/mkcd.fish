
function mkcd --description "Create a directory and cd into it"
    if test (count $argv) -eq 0
        echo "Usage: mkcd <directory>"
        return 1
    end

    mkdir -p -- $argv && cd -- $argv
end