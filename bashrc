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





# add your customizations below

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

if [ 'hostname -d' = "stampede.tacc.utexas.edu" ]; then
  echo hostname
  module load fftw3
  module load cuda

  alias interact="srun -p gpu -t 1:00:00 -n 32 --pty /bin/bash -l"
fi


if [ $(hostname) = "accelerando.math.ntu.edu.tw" ]; then
  echo $(hostname)

  source /opt/intel/bin/compilervars.sh intel64
  PATH=$PATH:/opt/openmpi-1.6.5-intel/bin
  PATH=$PATH:/opt/NVIDIA/cuda/bin:/opt/intel/bin
  PATH=$PATH:$HOME/bin
  PATH=$PATH:$HOME/texlive/2012/bin/x86_64-linux
  PATH=$PATH:/opt/scitools/bin/linux64
  export PATH
  LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/lib:/usr/local/lib:$HOME/lib
  LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/opt/NVIDIA/cuda-5.5/lib64
  LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/opt/openmpi-1.6.5-intel/lib
  LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/opt/hwloc-1.1/lib
  export LD_LIBRARY_PATH
  MANPATH=/opt/openmpi-1.6.5-intel/share/man:$MANPATH
  export MANPATH
  PKG_CONFIG_PATH=$PKG_CONFIG_PATH:$HOME/lib/pkgconfig
  export PKG_CONFIG_PATH
  export MKL_MIC_ENABLE=1
  export MKL_MIC_WORKDIVISION=1.0

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
