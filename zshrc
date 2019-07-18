#!/usr/bin/env zsh

[[ -d $HOME/.emacs.d/bin ]] && export PATH=$HOME/.emacs.d/bin:$PATH
[[ -d $HOME/.bin ]] && export PATH=$HOME/.bin:$PATH

if [ -d $HOME/perl5 ]; then
   PATH="$HOME/perl5/bin${PATH:+:${PATH}}"; export PATH;
   PERL5LIB="$HOME/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
   PERL_LOCAL_LIB_ROOT="$HOME/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
   PERL_MB_OPT="--install_base \"$HOME/perl5\""; export PERL_MB_OPT;
   PERL_MM_OPT="INSTALL_BASE=$HOME/perl5"; export PERL_MM_OPT;
fi

source <(antibody init)

export PYENV_ROOT="${HOME}/.pyenv/"

export ZSH="${HOME}/.cache/antibody/https-COLON--SLASH--SLASH-github.com-SLASH-robbyrussell-SLASH-oh-my-zsh/"

antibody bundle robbyrussell/oh-my-zsh
antibody bundle robbyrussell/oh-my-zsh path:plugins/command-not-found
antibody bundle robbyrussell/oh-my-zsh path:plugins/copydir
antibody bundle robbyrussell/oh-my-zsh path:plugins/copyfile
antibody bundle robbyrussell/oh-my-zsh path:plugins/cp
antibody bundle robbyrussell/oh-my-zsh path:plugins/docker-compose
antibody bundle robbyrussell/oh-my-zsh path:plugins/extract
antibody bundle robbyrussell/oh-my-zsh path:plugins/git
antibody bundle robbyrussell/oh-my-zsh path:plugins/git-flow-avh
antibody bundle robbyrussell/oh-my-zsh path:plugins/git-prompt
antibody bundle robbyrussell/oh-my-zsh path:plugins/history
antibody bundle robbyrussell/oh-my-zsh path:plugins/pass
antibody bundle robbyrussell/oh-my-zsh path:plugins/python
antibody bundle robbyrussell/oh-my-zsh path:plugins/pyenv
antibody bundle robbyrussell/oh-my-zsh path:plugins/shrink-path
antibody bundle robbyrussell/oh-my-zsh path:plugins/sudo

[[ $INSIDE_EMACS != *"term"* ]] && antibody bundle zsh-users/zsh-autosuggestions
antibody bundle zsh-users/zsh-syntax-highlighting
antibody bundle zsh-users/zsh-completions
antibody bundle zsh-users/zsh-history-substring-search

antibody bundle zimfw/zimfw path:modules/history
antibody bundle mafredri/zsh-async

# Enable highlighters
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor root line)

# Override highlighter colors
typeset -gA ZSH_HIGHLIGHT_STYLES

ZSH_HIGHLIGHT_STYLES[default]=bold
ZSH_HIGHLIGHT_STYLES[line]=bold

# autoload -U zutil
# autoload -U compinit
# autoload -U complist

#-----------------------------
# Prompt
#-----------------------------
export VIRTUAL_ENV_DISABLE_PROMPT=1

function virtualenv_status() {
  [[ -z "$VIRTUAL_ENV" ]] && return ""
  basename " %{${fg_bold[white]}%}`basename \"$VIRTUAL_ENV\"`%{${reset_color}%}"
}

function git_status(){
  [[ ! -d ".git/" ]] && return ""
  echo -e " $(git_super_status)"
}

ZSH_THEME_GIT_PROMPT_PREFIX=""
ZSH_THEME_GIT_PROMPT_SUFFIX=""
ZSH_THEME_GIT_PROMPT_SEPARATOR=" "

# section for dir
function prompt_dir() {
  echo '%B%F{black}$(shrink_path -f)%f%b'
}

# section for git branch
function prompt_git() {
  echo '$(git_status)'
}

# section for git branch
function prompt_venv() {
  echo '$(virtualenv_status)'
}

# refresh prompt with new data
prompt_refresh() {
  PROMPT="$prompt_data[prompt_venv] %(!,%B%F{red}#%f%b,%B%F{blue}>%f%b) "
  RPROMPT="$prompt_data[prompt_dir]$prompt_data[prompt_git]"
  # Redraw the prompt.
  zle reset-prompt
}

prompt_callback() {
  local job=$1 code=$2 output=$3 exec_time=$4
  prompt_data[$job]=$output
  prompt_refresh
}

async_init

# cache variable
typeset -Ag prompt_async
typeset -Ag prompt_data

# Start async worker
async_start_worker prompt_async -n
# Register callback function for the workers completed jobs
async_register_callback prompt_async prompt_callback

# start async jobs before cmd
prompt_precmd() {
  async_job prompt_async prompt_dir
  async_job prompt_async prompt_venv $PWD # required
  async_job prompt_async prompt_git $PWD # required
}

# Setup
zmodload zsh/zle
autoload -Uz add-zsh-hook
add-zsh-hook precmd prompt_precmd

PROMPT=' %(!,%B%F{red}#%f%b,%B%F{blue}>%f%b) '

# PROMPT='$(virtualenv_status) %(!,%B%F{red}#%f%b,%B%F{blue}>%f%b) '
# RPROMPT='%B%F{black}$(shrink_path -f)%f%b$(git_status)'
# Color command correction prompt
SPROMPT="$fg[cyan]Correct $fg[red]%R$reset_color $fg[magenta]to $fg[green]%r?$reset_color ($fg[white]Si :: No :: Abortar :: Editar$fg[white])"

#-----------------------------
# colors
#-----------------------------
LS_COLORS='rs=0:di=01;34:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:su=37;41:sg=30;43:tw=30;42:ow=34;42:st=37;44:ex=01;32:';

#------------------------------
# Keybindings
#------------------------------
bindkey -e
typeset -g -A key

#bindkey '\e[3~' delete-char
bindkey '\e[1~' beginning-of-line
bindkey '\e[4~' end-of-line
#bindkey '\e[2~' overwrite-mode
bindkey '^?' backward-delete-char
bindkey '^[[1~' beginning-of-line
bindkey '^[[5~' up-line-or-history
bindkey '^[[3~' delete-char
bindkey '^[[4~' end-of-line
bindkey '^[[6~' down-line-or-history
bindkey '^[[A' up-line-or-search
bindkey '^[[D' backward-char
bindkey '^[[B' down-line-or-search
bindkey '^[[C' forward-char
# for rxvt
bindkey "\e[8~" end-of-line
bindkey "\e[7~" beginning-of-line
# for gnome-terminal
bindkey "\eOH" beginning-of-line
bindkey "\eOF" end-of-line

bindkey -M emacs '^P' history-substring-search-up
bindkey -M emacs '^N' history-substring-search-down

#------------------------------
# Window title
#------------------------------
case $TERM in
  termite|*xterm*|rxvt|rxvt-unicode|rxvt-256color|rxvt-unicode-256color|(dt|k|E)term)
    precmd () {
      print -Pn "\e]0;%n: %~ \a"
    }
    preexec () { print -Pn "\e]0;$1\a" }
   ;;
  screen|screen-256color)
    precmd () {
      print -Pn "\e]0;%n: %~ \a"
    }
    preexec () {
      print -Pn "\e]0;$1\a"
    }
    ;;
esac

# Quick find
f() {
    echo "find . -iname \"*$1*\""
    find . -iname "*$1*"
}

# Show my public IP
mypip() {
  curl -s ipinfo.io/ip
}

export PAGER="eless"
#export LESS="-iMSx4 -XFR"
if which lesspipe.sh >/dev/null 2>&1; then
   export LESSOPEN="| lesspipe.sh %s"
fi
alias lv="eless"

# term-projectile support
function environment_variable_exists {
  eval "value=\"\${$1+x}\""
  [ ! -z $value ]
}

function emacs_ansi_term_support {
  echo -e "\033AnSiTu" "$LOGNAME" # $LOGNAME is more portable than using whoami.
  echo -e "\033AnSiTc" "$(pwd)"
  [[ $(uname) = "SunOS" ]] && hostname_options="" || hostname_options="-f"
}

if environment_variable_exists INSIDE_EMACS; then
  [[ $INSIDE_EMACS == *"term"* ]] && add-zsh-hook precmd emacs_ansi_term_support
fi

# Watch other user login/out
watch=notme
export LOGCHECK=60

# Enable color support of ls
if [[ "$TERM" != "dumb" ]]; then
  if [[ -x `which dircolors` ]]; then
    eval `dircolors -b`
    alias 'ls=ls --color=auto'
  fi
fi

if [[ "$TERM" == "dumb" ]]; then
  unsetopt zle
  unsetopt prompt_cr
  unsetopt prompt_subst
  if whence -w precmd >/dev/null; then
      unfunction precmd
  fi
  if whence -w preexec >/dev/null; then
      unfunction preexec
  fi
  PS1='$ '
fi

#------------------------------
# ShellFuncs
#------------------------------
# -- coloured manuals
# man() {
#   env \
#     LESS_TERMCAP_mb=$(printf "\e[1;31m") \
#     LESS_TERMCAP_md=$(printf "\e[1;31m") \
#     LESS_TERMCAP_me=$(printf "\e[0m") \
#     LESS_TERMCAP_se=$(printf "\e[0m") \
#     LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
#     LESS_TERMCAP_ue=$(printf "\e[0m") \
#     LESS_TERMCAP_us=$(printf "\e[1;32m") \
#     man "$@"
# }


#------------------------------
# Calc: https://github.com/arzzen/calc.plugin.zsh
#------------------------------
autoload -U zcalc
function __calc_plugin {
    zcalc -e "$*"
}
aliases[calc]='noglob __calc_plugin'
aliases[=]='noglob __calc_plugin'

#------------------------------
# Alias
#------------------------------
# Dotfiles management
alias dt="dotdrop -c ~/.dotdrop.yml"
# Short command aliases
alias ssh="TERM=xterm ssh"
alias mydf="df -hPT | column -t"
alias cl="clear"
alias 'ems=emacsclient -t '
alias 'emsg=emacsclient -c '
alias ls=exa
alias 'j=jobs -l'
alias 's=ls | grep'
alias 'tf=tail -f'
alias 'grep=grep --colour'
alias '..=cd ..'
alias '../..=cd ../..'
alias 'home=cd ~/'
alias 'dir=dir --color=auto'

# Play safe!
alias 'rm=safe-rm'

# advcpmv
alias 'mv=amv -g'
alias 'cp=acp -g'

# For convenience
alias 'mkdir=mkdir -p'
alias 'dus=du -ms * | sort -n'

# Typing errors...
alias 'cd..=cd ..'

# Running 'b.ps' runs 'q b.ps'
alias -s ps=q
alias -s html=q

# Global aliases (expand whatever their position)
#  e.g. find . E L
alias -g L='| eless'
alias -g H='| head'
alias -g S='| sort'
alias -g T='| tail'
alias -g N='> /dev/null'
alias -g E='2> /dev/null'

# Python
alias 'pyb=python setup.py build'
alias 'pyd=python setup.py develop'
alias 'pyi=python setup.py install'

# Ripgrep
alias 'rg=rg -uuu'

# do a du -hs on each dir on current path
alias lsdir="for dir in *;do;if [ -d \$dir ];then;du -hsL \$dir;fi;done"


#------------------------------
# Completion
#------------------------------
# case-insensitive (uppercase from lowercase) completion
zstyle ':completion:*' completer _oldlist _expand _complete _match _ignored _approximate
zstyle ':completion:*' completions 0
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' glob 0
zstyle ':completion:*' group-name ''
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' matcher-list '+m:{a-z}={A-Z} r:|[._-]=** r:|=**' '' '' '+m:{a-z}={A-Z} r:|[._-]=** r:|=**'
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' max-errors 1 numeric
zstyle ':completion:*' menu select=2
zstyle ':completion:*' select-prompt '%SScrolling active: current selection at %p%s'
zstyle ':completion:*' substitute 0
zstyle ":completion:*:commands" rehash 1
zstyle ':completion:*:(all-|)files' ignored-patterns '(|*/)CVS'
zstyle ':completion:*:(rm|kill|diff):*' ignore-line yes
zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:*:kill:*:processes' list-colors "=(#b) #([0-9]#)*=36=31"
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:cd:*' ignored-patterns '(*/)#lost+found' '(*/)#CVS'
zstyle ':completion:*:descriptions' format '%U%F{yellow}%d%f%u'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'
zstyle ':completion:*:kill:*' force-list always
zstyle ':completion:*:processes' command 'ps -au$USER'
zstyle ':completion:*:*:*:users' ignored-patterns \
   adm apache bin daemon games gdm halt ident junkbust lp mail mailnull \
   named news nfsnobody nobody nscd ntp operator pcap postgres radvd \
   rpc rpcuser rpm shutdown squid sshd sync uucp vcsa xfs backup  bind  \
   dictd  gnats  identd  irc  man  messagebus  postfix  proxy  sys  www-data \
   avahi Debian-exim hplip list cupsys haldaemon ntpd proftpd statd
zstyle ':completion:*:*:mpv:*' file-patterns '*.(#i)(flv|mp4|webm|mkv|wmv|mov|avi|mp3|ogg|wma|flac|wav|aiff|m4a|m4b|m4v|gif|ifo)(-.) *(-/):directories' '*:all-files'
zstyle :compinstall filename "$HOME/.zshrc"
zstyle -d users

#------------------------------
# History
#------------------------------
# Zsh settings for history
export HISTIGNORE="&:ls:[bf]g:exit:reset:clear:cd:cd ..:cd.."
export HISTSIZE=25000
export HISTFILE=~/.zhistory
export SAVEHIST=25000
setopt APPEND_HISTORY
setopt BANG_HIST
setopt EXTENDED_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_REDUCE_BLANKS
setopt HIST_SAVE_NO_DUPS
setopt HIST_VERIFY
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY

#------------------------------
# Options
#------------------------------
setopt CORRECT
setopt ALWAYS_TO_END
setopt NOTIFY
setopt NOBEEP
setopt AUTOLIST
setopt AUTOCD
setopt PRINT_EIGHT_BIT

#------------------------------
# Activation
#------------------------------
[[ -n ${ZDOTDIR}/.zcompdump(#qN.mh+24) ]] && compinit || compinit -C
