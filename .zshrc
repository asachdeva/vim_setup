# If you come from bash you might have to change your $PATH.
export PATH=$HOME/.bloop:$HOME/.sdkman/candidates/scala/current/bin:$HOME/bin:/usr/local/bin:usr/local/sbin:usr/sbin:/usr/bin:/sbin:/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="powerlevel9k/powerlevel9k"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
Plugins=(autoupdate
 git
 autojump
 battery
 docker
 dotenv
 git
 kubectl
 minikube
 node
 pip
 pipenv
 postgres
 pyenv
 sbt
 scala
 terraform
 titles
 thefuck
 zsh-autosuggestions
 zsh_reload
 zsh-sdkman
 zsh-syntax-highlighting
)

export UPDATE_ZSH_DAYS=1

source $ZSH/oh-my-zsh.sh

# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
alias zshconfig="vi ~/.zshrc"
alias ohmyzsh="vi ~/.oh-my-zsh"
alias l='ls -lFh'     #size,show type,human readable
alias la='ls -lAFh'   #long list,show almost all,show type,human readable
alias grep='grep --color'
alias h='history'
alias zshreload="source ~/.zshrc"
alias upgrade="sudo apt-get update && sudo apt-get upgrade && sudo apt update && upgrade_oh_my_zsh && sdk upgrade && sudo snap refresh && nvim +'PlugInstall --sync' +qa"
alias open="xdg-open"
alias vi="nvim"
alias vim="nvim"

source /usr/share/powerlevel9k/powerlevel9k.zsh-theme
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$SDKMAN_DIR/bin/sdkman-init.sh" ]] && source "$SDKMAN_DIR/bin/sdkman-init.sh"

# Restic Backups
export RESTIC_REPOSITORY=/mnt/gdrive/backup
export RESTIC_PASSWORD=uSRvt2dZ7

# Solarized Color Scheme
eval `dircolors ~/.dir_colors/dircolors`

# Yank Hostname from prompt
prompt_context() {}
