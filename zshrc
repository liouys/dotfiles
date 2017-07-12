export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="cloud"

plugins=(git)

source $ZSH/oh-my-zsh.sh

if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

alias zshconfig="vim ~/.zshrc"
alias ohmyzsh="vim ~/.oh-my-zsh"

# brew config
export HOMEBREW_NO_AUTO_UPDATE="1"

# JENKINS CONFIGURE
export JENKINS_TOOLS=~/work/JenkinsCI/jenkins-tools

# DOCKER CONFIG
export DOCKER_HOST=tcp://10.34.57.11:2377
