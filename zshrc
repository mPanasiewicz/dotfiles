# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.

# ZSH_THEME="macovsky"
# ZSH_THEME="robbyrussell"
# ZSH_THEME="gnzh"
# ZSH_THEME="fino"
# ZSH_THEME="bira"
# ZSH_THEME="robbyrussell"
# ZSH_THEME="fino"
# ZSH_THEME="steeef"
# ZSH_THEME="sporty_256"
# ZSH_THEME="bira"
# ZSH_THEME="powerline"
ZSH_THEME="bullet-train"
# for list of colors run spectrum_ls
BULLETTRAIN_TIME_SHOW=false
BULLETTRAIN_CONTEXT_SHOW=false
ULLETTRAIN_IS_SSH_CLIENT=true
BULLETTRAIN_NVM_SHOW=true
BULLETTRAIN_NVM_BG=022
BULLETTRAIN_NVM_FG=253
BULLETTRAIN_RUBY_BG=235
BULLETTRAIN_RUBY_FG=red
BULLETTRAIN_GO_SHOW=true
BULLETTRAIN_DIR_BG=232
BULLETTRAIN_DIR_FG=226
BULLETTRAIN_GIT_BG=233
BULLETTRAIN_GIT_FG=214

RAILS_ENV=development

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

alias b="bundle exec"
alias -g se='| grep -i'
alias runkt="bundle exec rails s -p 3002"
alias runb2c="bundle exec rails s -p 3000"
alias runb2b="bundle exec rackup -p 9292"
alias redis-stop="redis-cli shutdown"
alias redis-start="redis-server"
# alias vim='/Applications/MacVim.app/Contents/MacOS/vim'
alias -s log="less -MN"
alias -s rb=vim
alias gdw="git diff --color-words"

# http://zshwiki.org/home/builtin/functions/zmv
autoload -U zmv

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Uncomment this to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
export UPDATE_ZSH_DAYS=31

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
HIST_STAMPS="yyyy/mm/dd"
HISTSIZE=1000
SAVEHIST=1000

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git osx ruby brew bundler forklift gem github history postgres pow rails rake tmux history-substring-search vi-mode tmuxinator autojump zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh
export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh
bindkey '\e[A' history-beginning-search-backward
bindkey '\e[B' history-beginning-search-forward

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# # Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
export ARCHFLAGS="-arch x86_64"
export CC=/usr/local/bin/gcc-4.2
export CXX=/usr/local/bin/g++-4.2
export CPP=/usr/local/bin/cpp-4.2
export PATH="/usr/local/heroku/bin:/Library/PostgreSQL/9.3/data:/Library/PostgreSQL/9.3/bin:$PATH"
export PATH=/usr/local/bin:/usr/local/sbin:$HOME/bin:$PATH
export ANDROID_HOME=/Users/maciejpanasiewicz/Library/Android/sdk
export PATH=$ANDROID_HOME/platform-tools:$PATH
export PATH=$ANDROID_HOME/tools:$PATH
export PGDATA=/Library/PostgreSQL/9.3/data/
export EDITOR=vim
export GIT_EDITOR=vim

#eval "$(rbenv init -)"
eval "$(rbenv init --no-rehash - zsh)"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

export PATH=/usr/local/bin:/Users/maciejpanasiewicz/.rbenv/shims:/usr/local/bin:/usr/local/sbin:/Users/maciejpanasiewicz/bin:/usr/local/heroku/bin:/Library/PostgreSQL/9.3/data:/Library/PostgreSQL/9.3/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin
[[ -s $(brew --prefix)/etc/profile.d/autojump.sh ]] && . $(brew --prefix)/etc/profile.d/autojump.sh
PS1="$PS1"'$([ -n "$TMUX" ] && tmux setenv TMUXPWD_$(tmux display -p "#D" | tr -d %) "$PWD")'

export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh
