# Git related

# Check if main exists and use instead of master
function git_main_branch() {
  command git rev-parse --git-dir &>/dev/null || return
  local ref
  for ref in refs/{heads,remotes/{origin,upstream}}/{main,trunk}; do
    if command git show-ref -q --verify $ref; then
      echo ${ref:t}
      return
    fi
  done
  echo master
}

# Git aliases
alias gst='git status'
alias gwip='git add -A; git rm $(git ls-files --deleted) 2> /dev/null; git commit --no-verify --no-gpg-sign -m "WIP-- [skip ci]"'
alias gunwip='git log -n 1 | grep -q -c "WIP\-\-" && git reset HEAD~1'
alias glo="git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ad) %C(bold blue)<%an>%Creset' --date=short"
alias gcm='git checkout $(git_main_branch)'
alias gcor='git checkout --recurse-submodules'
alias gsbu='git submodule update --init --recurse'
alias tig='tig --all'
