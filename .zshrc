export PATH="$HOME/bin:$PATH"
eval `opam config env`

autoload -Uz colors
colors

setopt no_beep
setopt noflowcontrol

autoload -Uz vcs_info
setopt prompt_subst
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr "%F{yellow}!"
zstyle ':vcs_info:git:*' unstagedstr "%F{red}+"
zstyle ':vcs_info:*' formats "%F{green}%c%u[%b]%f"
zstyle ':vcs_info:*' actionformats '[%b|%a]'
precmd () { vcs_info }

#prompt
PROMPT='[%D %T][%F{cyan}%n%f@%F{green}%U%m%u%f:%F{blue}%B%d%f%b] ${vcs_info_msg_0_}
$'

alias ..='cd ../'
alias ....='cd ../..'
alias ls='ls -F --color=auto'
alias clip='xclip -selection c'
alias grep='grep --color=auto'

# 一時作業用コマンド http://bit.ly/22GF66y
tmpspace() {
  (
  d=$(mktemp -d "${TMPDIR:-/tmp}/${1:-tmpspace}.XXXXXXXXXX") && cd "$d" || exit 1
  "$SHELL"
  s=$?
  if [[ $s == 0 ]]; then
    rm -rf "$d"
  else
    echo "Directory '$d' still exists." >&2
  fi
  exit $s
  )
}

alias tempspace=tmpspace

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/mumumu/google-cloud-sdk/path.zsh.inc' ]; then . '/home/mumumu/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/mumumu/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/mumumu/google-cloud-sdk/completion.zsh.inc'; fi
