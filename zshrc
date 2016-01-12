export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="cloud"

plugins=(git)

source $ZSH/oh-my-zsh.sh

if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='mvim'
fi

alias zshconfig="vim ~/.zshrc"
alias ohmyzsh="vim ~/.oh-my-zsh"

export GOROOT=/usr/local/go
export GOPATH=$HOME/workspace/gocodes
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin:~/apps/bin
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_66.jdk/Contents/Home
export GROOVY_HOME=~/dev/antly/tools/java/groovy
export GRADLE_HOME=~/dev/antly/tools/java/gradle
export M2_HOME=~/dev/antly/tools/java/maven
export ANT_HOME=~/dev/antly/tools/java/ant
export PATH=$GRADLE_HOME/bin:$GRADLE_HOME/bin:$M2_HOME/bin:$ANT_HOME/bin:$PATH

