#Functions
weather () {
        if [ -z "$1" ]
        then
                curl "http://wttr.in/Sheffield"
        else
                curl "http://wttr.in/$1"
        fi
}

export PATH="$HOME/.composer/vendor/bin:$PATH"
export PATH="/usr/local/opt/php@7.1/bin:$PATH"
export PATH="/usr/local/opt/php@7.1/sbin:$PATH"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
[[ -s "$HOME/.avn/bin/avn.sh" ]] && source "$HOME/.avn/bin/avn.sh" # load avn


alias du='du -h'
alias df='df -h'
alias f='find -iname'
alias weather='curl http://wttr.in/Sheffield'

# History with timestamps and elapsed time
alias h='history -iD'

# Parent directories
alias cd..='cd ..'
alias '..'='cd ..'
alias -g ...='../..'
alias -g ....='../../..'
alias -g .....='../../../..'
alias -g ......='../../../../..'
alias -g .......='../../../../../..'

# Git
alias   g='git'
alias  gs='git status'
alias  gl='git l'
alias  gp='git pull'
alias gaa='git add -A'

# Artisan
alias artisan='php artisan'
alias pmigrate= 'artisan migrate'
alias pms='php artisan migrate:refresh --seed'
alias cinstall= 'composer install'
alias cdump='composer dump-autoload'
alias larnew='composer create-project laravel/laravel'



