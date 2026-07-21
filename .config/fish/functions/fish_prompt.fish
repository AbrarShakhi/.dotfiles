# The MIT License (MIT)

# Copyright (c) 2015 Bruno Pinto

# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:

# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.

# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.


# You can override some default options with config.fish:
#
#  set -g theme_short_path yes
#  set -g theme_stash_indicator yes
#  set -g theme_ignore_ssh_awareness yes

function fish_prompt
  set -l last_command_status $status
  set -l cwd

  if test "$theme_short_path" = 'yes'
    set cwd (basename (prompt_pwd))
  else
    set cwd (prompt_pwd)
  end

  set -l fish     "⋊>"
  set -l ahead    "↑"
  set -l behind   "↓"
  set -l diverged "⥄"
  set -l dirty    "⨯"
  set -l stash    "≡"
  set -l none     "◦"

  set -l normal_color     (set_color normal)
  set -l success_color    (set_color cyan)
  set -l error_color      (set_color $fish_color_error 2> /dev/null; or set_color red --bold)
  set -l directory_color  (set_color $fish_color_quote 2> /dev/null; or set_color brown)
  set -l repository_color (set_color $fish_color_cwd 2> /dev/null; or set_color green)

  set -l prompt_string $fish

  if test "$theme_ignore_ssh_awareness" != 'yes' -a -n "$SSH_CLIENT$SSH_TTY"
    set prompt_string "$fish "(whoami)"@"(hostname -s)" $fish"
  end

  if test $last_command_status -eq 0
    echo -n -s $success_color $prompt_string $normal_color
  else
    echo -n -s $error_color $prompt_string $normal_color
  end

  if git_is_repo
    if test "$theme_short_path" = 'yes'
      set root_folder (command git rev-parse --show-toplevel 2> /dev/null)
      set parent_root_folder (dirname $root_folder)
      set cwd (echo $PWD | sed -e "s|$parent_root_folder/||")
    end

    echo -n -s " " $directory_color $cwd $normal_color
    echo -n -s " on " $repository_color (git_branch_name) $normal_color " "


    set -l list
    if test "$theme_stash_indicator" = yes; and git_is_stashed
      set list $list $stash
    end
    if git_is_touched
      set list $list $dirty
    end
    echo -n $list

    if test -z "$list"
      echo -n -s (git_ahead $ahead $behind $diverged $none)
    end
  else
    echo -n -s " " $directory_color $cwd $normal_color
  end

  echo -n -s " "
end
