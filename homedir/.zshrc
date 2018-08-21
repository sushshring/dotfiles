# Path to your oh-my-zsh configuration.
export ZSH=$HOME/.dotfiles/oh-my-zsh
# if you want to use this, change your non-ascii font to Droid Sans Mono for Awesome
# POWERLEVEL9K_MODE='awesome-patched'
export ZSH_THEME="powerlevel9k/powerlevel9k"
POWERLEVEL9K_SHORTEN_DIR_LENGTH=2
# https://github.com/bhilburn/powerlevel9k#customizing-prompt-segments
# https://github.com/bhilburn/powerlevel9k/wiki/Stylizing-Your-Prompt
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context dir battery nvm vcs virtualenv)
POWERLEVEL9K_RIGHT_PROMT_ELEMENTS=(status background_jobs time disk_usage history)

POWERLEVEL9K_PROMPT_ON_NEWLINE=true
# colorcode test
# for code ({000..255}) print -P -- "$code: %F{$code}This is how your text would look like%f"
POWERLEVEL9K_NVM_FOREGROUND='000'
POWERLEVEL9K_NVM_BACKGROUND='072'
POWERLEVEL9K_SHOW_CHANGESET=true
#export ZSH_THEME="random"

# Set to this to use case-sensitive completion
# export CASE_SENSITIVE="true"

# disable weekly auto-update checks
# export DISABLE_AUTO_UPDATE="true"

# disable colors in ls
# export DISABLE_LS_COLORS="true"

# disable autosetting terminal title.
export DISABLE_AUTO_TITLE="true"

# Which plugins would you like to load? (plugins can be found in ~/.dotfiles/oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(
git
osx
httpie
jsontools
vi-mode
common-aliases
git-extras
node
z
npm
sudo
zsh-completions
zsh-syntax-highlighting)
source $ZSH/oh-my-zsh.sh
# start typing + [Up-Arrow] - fuzzy find history forward
if [[ "${terminfo[kcuu1]}" != "" ]]; then
    autoload -U up-line-or-beginning-search
    zle -N up-line-or-beginning-search
    bindkey "${terminfo[kcuu1]}" up-line-or-beginning-search
fi
# start typing + [Down-Arrow] - fuzzy find history backward
if [[ "${terminfo[kcud1]}" != "" ]]; then
    autoload -U down-line-or-beginning-search
    zle -N down-line-or-beginning-search
    bindkey "${terminfo[kcud1]}" down-line-or-beginning-search
fi

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

source /usr/local/opt/nvm/nvm.sh

autoload -U add-zsh-hook
load-nvmrc() {
  if [[ -f .nvmrc && -r .nvmrc ]]; then
    nvm use &> /dev/null
  elif [[ $(nvm version) != $(nvm version default)  ]]; then
    nvm use default &> /dev/null
  fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc
. ~/.dotfiles/z-zsh
function precmd () {
  z --add "$(pwd -P)"
}

# User configuration

export PATH="$PATH:$HOME/npm/bin"
export ANDROID_HOME=${HOME}/Library/Android/sdk
export PATH=${PATH}:${ANDROID_HOME}/tools
export PATH=${PATH}:${ANDROID_HOME}/platform-tools
export PATH="$PATH:$HOME/Library/Python/2.7/bin"
export PATH="$PATH:$HOME/Library/Python/3.6/bin"
export PATH="$PATH:/usr/local/mysql-shell/bin"
export EDITOR="gvim"
export REACT_EDITOR="vsc"
# Customize to your needs...
unsetopt correct

# run fortune on new terminal :)
fortune
eval "$(hub alias -s)"

# added by travis gem
[ -f ~/.travis/travis.sh ] && source ~/.travis/travis.sh

DEFAULT_USER='sushrutshringarputale'
# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias atom="open -a atom"
alias vsc="open -a Visual\ Studio\ Code"
alias cdPSU="cd /Users/sushrutshringarputale/Library/Mobile\ Documents/com\~apple\~CloudDocs/Penn\ State"
alias rmswp="rm -r *~ && rm -r .*~"
alias readme="cat README"


eval "$(thefuck --alias)"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/sushrutshringarputale/Applications/google-cloud-sdk/path.zsh.inc' ]; then source '/Users/sushrutshringarputale/Applications/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/sushrutshringarputale/Applications/google-cloud-sdk/completion.zsh.inc' ]; then source '/Users/sushrutshringarputale/Applications/google-cloud-sdk/completion.zsh.inc'; fi
