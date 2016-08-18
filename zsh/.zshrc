# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Uncomment this to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment following line if you want to  shown in the command execution time stamp
# in the history command output. The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|
# yyyy-mm-dd
HIST_STAMPS="mm/dd/yyyy"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git github brew autojump fabric osx hub vagrant)

source $ZSH/oh-my-zsh.sh

# User configuration
export PATH=$HOME/Dropbox/Scripts:/home/dev/devtools/scripts:$HOME/bin:/usr/local/sbin:/usr/local/bin:$PATH


# export MANPATH="/usr/local/man:$MANPATH"

# # Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi
export EDITOR='emacs'

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# python virtual envs
alias activate-2.4="source /home/dev/buildout.python/python-2.4/bin/activate"
alias activate-2.6="source /home/dev/buildout.python/python-2.6/bin/activate"
alias activate-2.7="source /home/dev/buildout.python/python-2.7/bin/activate"
alias bootstrap-2.7="/home/dev/buildout.python/python-2.7/bin/python bootstrap.py"

# emacs gui alias
alias emacs="/Applications/Emacs.app/Contents/MacOS/Emacs -nw"

# custom git prompt from https://github.com/olivierverdier/zsh-git-prompt
# (update the git status on every prompt line)
export ZSH_THEME_GIT_PROMPT_NOCACHE=1
source $HOME/.zsh/git-prompt/zshrc.sh
# This is the default prompt with the git super status added
PROMPT='${ret_status}%{$fg_bold[green]%}%p %{$fg[cyan]%}%c %{$fg_bold[blue]%}$(git_super_status)%{$fg_bold[blue]%} % %{$reset_color%}'

# Syntax highlighting
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Add RVM to PATH for scripting
export PATH="$PATH:$HOME/.rvm/bin"

# Add Python to PATH for scripting
export PATH="$PATH:$HOME/Library/Python/2.7/bin"

# Github aliasing
eval "$(hub alias -s)"

# https://github.com/kennethreitz/autoenv
AUTOENV_ENV_FILENAME=.autoenv
source /usr/local/opt/autoenv/activate.sh
