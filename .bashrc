# echo "reading .bashrc"
# Prompt Style
function load_ps1() {
  if [ -f $BASH_COMPLETION_DIR/git ]; then
    PS1="\[\033[0;37m\][\t \u\[\033[0;37m\]@\h\[\033[0;36m\]$(__git_ps1)\[\033[0;32m\]\w\[\033[0;37m\]]\n\$ "
  else
    PS1="\[\033[0;37m\][\t \u\[\033[0;37m\]@\h \[\033[0;32m\]\w\[\033[0;37m\]]\n\$ "
  fi
  # >: forward, <: back, =: equal
  export GIT_PS1_SHOWUPSTREAM=1
  # %: exists untracked file
  export GIT_PS1_SHOWUNTRACKEDFILES=1
  # $: exists stashed file
  export GIT_PS1_SHOWSTASHSTATE=1
  # *: exists unstaged file, +: exists staged file
  export GIT_PS1_SHOWDIRTYSTATE=1
  export PS1
}

# Source global definitions
if [ -f /etc/bashrc ]; then
  . /etc/bashrc
fi

if [[ "$HOSTNAME" =~ ^.*.sakura.ne.jp$ ]]; then
  # SakuraVPS
  export LS_COLORS='no=00:fi=00:di=04;36:ln=01;36:pi=40;33:so=40;33:bd=40;33:cd=40;33:ex=01;31:or=04;36:*.tgz=01;32:*.gz=01;32:*.tar=01;32:*.lzh=01;32:*.LZH=01;32:*.lha=01;32:*.zip=01;32:*.z=01;32:*.Z=01;32:*.rpm=01;32:*.gif=01;35:*.jpg=01;35:*.tif=01;35:*.eqs=01;35:*.ps=01;35:*.bmp=01;35:*.xwd=01;35:*.JPG=01;35:*.jpeg=01;35:*.obj=01;35'
  alias l="ls -p --color=auto --show-control-chars"
  alias ls="ls -p --color=auto --show-control-chars"
  alias ll="ls -pl --color=auto --show-control-chars"
  alias la="ls -pa --color=auto --show-control-chars"
  alias lla="ls -pla --color=auto --show-control-chars"
  BSCP_PATH=$HOME/github/dotfiles/bash_completaion/etc
else
  # Other
  export LSCOLORS=gxfxcxdxbxegedabagacad
  alias l="ls -Gp"
  alias ls="ls -Gp"
  alias ll="ls -Gpl"
  alias la="ls -Gpa"
  alias lla="ls -Gpla"
  BSCP_PATH=$HOME/works/github/dotfiles/bash_completaion/etc
fi

alias d="date"
alias gr="grep"
alias le="less"
alias rsp="rspec -fs -c"
alias rvml="rvm list"
alias rvmu="rvm use"
alias sou="source"
alias g="git"     ; alias gi="git"
alias h="history" ; alias hi="history" ; alias hig="history | grep"
alias p="ps -ef"  ; alias ps="ps -ef"  ; alias psg="ps -ef | grep"

export BASH_COMPLETION=$BSCP_PATH/bash_completion
export BASH_COMPLETION_DIR=$BSCP_PATH/bash_completion.d
. $BASH_COMPLETION

# args show loop
function loop() {
  if [ $# = 0 ] ; then 
    echo "Usage: loop args"
  else 
    while : ; do
      $*
      if [ $? -ne 0 ] ; then
        break
      fi
      sleep 1s
    done
  fi
}
# dropbox status show loop
function dropboxloop() {
  while : ; do
    date
    python2 ~/.dropbox-script/dropbox.py status
    du -sh ~/Dropbox
    du -sh ~/Dropbox/.dropbox.cache/
    sleep 1s
  done
}
function dd_ext() {
  dd if=/dev/urandom of=file1 bs=1024 count=1000
}
# find from root directory
function findroot() {
  sudo find / -name $1 2>/dev/null
}
alias fr="findroot"
# root shutdown now
function shutdownnow() {
  sudo shutdown -h now
}
# root reboot now
function rebootnow() {
  sudo shutdown -r now
}

# Load RVM into a shell session *as a function*
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" 
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

export PROMPT_COMMAND=load_ps1
