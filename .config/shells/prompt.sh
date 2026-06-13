git_branch() {
  git branch 2>/dev/null | grep '^\*' | sed 's/\* //'
}

if [ "$MYSHELL" = "bash" ]; then
  build_prompt() {
    local branch
    branch=$(git_branch)
    if [ -n "$branch" ]; then
      echo "\[\e[38;5;111m\]\w\[\e[0m\] \[\e[38;5;240m\]on\[\e[0m\] \[\e[38;5;178m\]$branch\[\e[0m\] \[\e[38;5;240m\]❯\[\e[0m\] "
    else
      echo "\[\e[38;5;111m\]\w\[\e[0m\] \[\e[38;5;240m\]❯\[\e[0m\] "
    fi
  }
  PROMPT_COMMAND='PS1=$(build_prompt)'
fi

if [ "$MYSHELL" = "zsh" ]; then
  autoload -Uz vcs_info
  precmd() {
    vcs_info
  }
  zstyle ':vcs_info:git:*' formats ' on %F{yellow}%b%f'
  setopt PROMPT_SUBST
  PROMPT='%F{111}%~%f${vcs_info_msg_0_} %F{240}❯%f '
fi