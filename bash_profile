# COLORS
LIGHT_GRAY="\[\033[0;37m\]"; BLUE="\[\033[1;36m\]"; RED="\[\033[0;31m\]"; LIGHT_RED="\[\033[1;31m\]";
GREEN="\[\033[0;32m\]"; WHITE="\[\033[1;37m\]"; LIGHT_GRAY="\[\033[0;37m\]"; YELLOW="\[\033[1;33m\]";

# GIT PROMPT (http://gist.github.com/120804)
function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ \(\1\)/';
}
function parse_git_status {
  git status 2> /dev/null | sed -e '/(working directory clean)$/!d' | wc -l;
}
function check_git_changes {
  # tput setaf 1 = RED, tput setaf 2 = GREEN
  [ `parse_git_status` -ne 1 ] && tput setaf 1 || tput setaf 2
}
export PS1="$YELLOW\w\[\$(check_git_changes)\]\$(parse_git_branch)$LIGHT_GRAY $ "

export PATH="/usr/local/sbin:$PATH"   # For nginx installed via home brew
export PATH=$PATH:$HOME/.rvm/bin      # Add RVM to PATH for scripting

if test -f ~/.rvm/scripts/rvm; then
    [ "$(type -t rvm)" = "function" ] || source ~/.rvm/scripts/rvm
fi

alias gpr="git pull --rebase"
alias gpom="git push origin master"
alias gcam="git commit -a -m"
alias gd="git diff"

