PS1="\[\033[1;32m\]\u@\h: \[\033[1;33m\] \w\[\033[0m\]$ "

export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
