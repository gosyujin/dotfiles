# echo "reading .bashrc"
# Prompt Style
function load_ps1() {
  LAST_STATUS=$?
  
  AVAIL=`df -lh | grep /$ | awk '{print $4}'`

  if [ ${LAST_STATUS} = "0" ]; then
    FACE="( '_').oO(${LAST_STATUS})"
  else
    FACE="(;>o<).oO(\033[0;35m\]${LAST_STATUS}\033[0;37m\])"
  fi

  PS1="\[\033[0;37m\][\t \u\[\033[0;37m\]@\033[0;31m\]\h\033[0;37m Avail:${AVAIL} ${FACE}\[\033[0;36m\]$(__git_ps1) \[\033[0;32m\]\w\[\033[0;37m\]]\n\$ "

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
else
  # Other
  export LSCOLORS=gxfxcxdxbxegedabagacad
  alias l="ls -Gp"
  alias ls="ls -Gp"
  alias ll="ls -Gpl"
  alias la="ls -Gpa"
  alias lla="ls -Gpla"
fi

DOTFILES_PATH=$HOME/github/dotfiles/
BUNDLE_EXEC_SH=$DOTFILES_PATH/bundler-exec.sh
GIT_COMPLETION_SH=$DOTFILES_PATH/git-completion.bash
GIT_PROMPT_SH=$DOTFILES_PATH/git-prompt.sh

[ -f $GIT_COMPLETION_SH ] && source $GIT_COMPLETION_SH
[ -f $GIT_PROMPT_SH ] && source $GIT_PROMPT_SH
[ -f $BUNDLE_EXEC_SH ] && source $BUNDLE_EXEC_SH

alias rm="sh $DOTFILES_PATH/rmtrash.sh"
alias cd="pushd"
alias  p="popd"
alias  d="date"
alias  h="history" ; alias hig="history | grep"
alias ps="ps -ef"  ; alias psg="ps -ef | grep"
alias  g="git"     ; alias  gi="git"

export HISTSIZE=50000
export HISTFILESIZE=50000
export GOPATH=~/gopath
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOBIN

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
# dd
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

export PROMPT_COMMAND=load_ps1
