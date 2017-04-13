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

export GOROOT=/usr/local/go
export GOPATH=$HOME/workspace/gocodes
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin:~/apps/bin
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_66.jdk/Contents/Home

export ANTLY_HOME=~/dev/antly
export GROOVY_HOME=/usr/local/opt/groovy/libexec
export GRADLE_HOME=/usr/local/Cellar/gradle/2.12/libexec

# -- gradle uploadArchives task variables.
export PUBLISH_URL=http://localhost:8081/content/repositories/ctg-release
export PUBLISH_USER=admin
export PUBLISH_PASSWORD=Nexus@2016

export PATH=~/.npm-global/bin:$PATH

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
