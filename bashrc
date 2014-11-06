# ~/.bashrc

# used for bash non-login shells.
# non-login shells include:
# * X sessions (xdm, gdm, kdm)
# * X Terminals (xterm, konsole, gnome-terminal)
# * running remote commands via ssh

# NOTE: some programs (ie, winscp) fail if this generates any output.

# first, source the system bashrc
if [ -r /etc/bashrc ]; then
    . /etc/bashrc
fi

# MAIL is used by mutt
export MAIL=/mail/${USER}/Maildir/

# default printer: change this to suit your needs.
# pr3swd is the duplex queue on our black and white laser printer in the
# southwest quadrant of the 3rd floor of ICES.
export PRINTER=pr3swd

# default editor: this is used by svn, etc.
# the only safe default for EDITOR is one which instructs the user how to quit.
# most users will change this to vim or emacs.
export EDITOR=vim

# uncomment this to use a prompt which indicates exit status
#if [ -r /etc/bash/prompt ]; then
#    . /etc/bash/prompt
#fi

# pine aliases
alias alpine='alpine -passfile ~/.pinepass'
alias pine='alpine -passfile ~/.pinepass'





## My customizations 

## Ronaldo Setup
if [ $(hostname) = "ronaldo.ices.utexas.edu" ]; then
  echo $(hostname)
  module load intel
  module load mkl
  module load openmpi
  module load matlab
  module list

  alias lafmm='cd /h1/chenhan/Projects/bill/lafmm/treecode'
  alias knn='cd /h1/chenhan/Projects/knn'
fi


## Stampede Setup
if [ 'hostname -d' = "stampede.tacc.utexas.edu" ]; then
  echo hostname
  module load fftw3
  module load cuda

  alias gpu='srun -p gpu -t 1:00:00 -n 32 --pty /bin/bash -l'
fi


## Maverick Setup
if [ 'hostname -d' = "maverick.tacc.utexas.edu" ]; then
  echo hostname
  module load cuda

  alias askit='cd /home/02794/ych/Projects/askit/treecode'
  alias gnf='cd /home/02794/ych/Projects/GNF'
  alias gpu='srun -p gpu -t 1:00:00 -n 40 --pty /bin/bash -l'
fi




## Git command line display
function git_branch {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return;
  echo "("${ref#refs/heads/}") ";
}

function git_since_last_commit {
  now=`date +%s`;
  last_commit=$(git log --pretty=format:%at -1 2> /dev/null) || return;
  seconds_since_last_commit=$((now-last_commit));
  minutes_since_last_commit=$((seconds_since_last_commit/60));
  hours_since_last_commit=$((minutes_since_last_commit/60));
  minutes_since_last_commit=$((minutes_since_last_commit%60));
  echo "${hours_since_last_commit}h${minutes_since_last_commit}m ";
}

PS1="[\[\033[1;32m\]\u@\h: \W\[\033[0m\]] \[\033[0m\]\[\033[1;36m\]\$(git_branch)\[\033[0;33m\]\$(git_since_last_commit)\[\033[0m\]$ "


## Common alias

alias gitk='gitk --all &'
alias ml='module list'
alias ma='module avail'
alias rm='rm -i'
alias mkdir='mkdir -p'
alias ..='cd ..'
alias libpath='echo -e ${LD_LIBRARY_PATH//:/\\n}'
alias du='du -kh'
alias ls='ls -h --color'
alias h='history'
alias j='jobs -l'
