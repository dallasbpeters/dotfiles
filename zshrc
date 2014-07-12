# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="dallaspeters"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how many often would you like to wait before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git ruby rails rvm)

source $ZSH/oh-my-zsh.sh
#git-flow autocomplete
source ~/.git-flow-completion.zsh




# Customize to your needs...

alias startmemcached=/usr/local/opt/memcached/bin/memcached
alias be="bundle exec"
alias prepare="cordova prepare"
alias subl="'/Applications/Sublime Text 3.app/Contents/SharedSupport/bin/subl'"
alias sub="'/Applications/Sublime Text 3.app/Contents/SharedSupport/bin/subl'"
alias nano="subl"
alias zshconfig="sub ~/.zshrc"
alias ohmyzsh="sub ~/.oh-my-zsh"
alias testify='LANG=en_US.UTF-8 RAILS_ENV=test bundle exec cucumber'
alias apacherestart="sudo apachectl restart"
alias apachetest="sudo apachectl -t"
# Easier navigation: .., ..., ...., ....., ~ and -
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ~="cd ~" # `cd` is probably faster to type though
alias -- -="cd -"
alias d="cd ~/Dropbox"
alias dl="cd ~/Downloads"
alias dt="cd ~/Desktop"
alias p="cd ~/projects"
alias g="git"
alias h="history"
alias sub="subl ."

# Edit hosts file
alias hosts="sudo vim /private/etc/hosts"

#git aliases
alias status="git status"
alias pull="git pull"
alias diff="git diff"
alias push om="git push origin master"
alias fetch="git fetch --all"

#Project Alias
alias queenbee="cd ~/Development/Apps/queenbee; rvm 2.0.0@queenbee;"
alias journeys="cd ~/Development/Apps/journeymaker;"
alias biblesearch="cd ~/Sites/biblesearch;rvm 1.9.3@biblesearch;"
alias styleguide="cd ~/Sites/styleguide; rvm 2.0.0@styleguide;"
alias biblereader="cd ~/Development/Apps/biblereader"
# export PATH="/usr/local/mysql/bin:$PATH"
export PATH=/usr/local/share/npm/bin:$PATH
export PATH=/usr/local/share/npm/lib/node_modules/weinre:$PATH
export PATH=/usr/local/bin:$PATH
export EDITOR="subl"
export PATH=$PATH:~/Development/Android/sdk/platform-tools

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting


gifify() {
  if [[ -n "$1" ]]; then
    if [[ $2 == '--good' ]]; then
      ffmpeg -i $1 -r 10 -vcodec png out-static-%05d.png
      time convert -verbose +dither -layers Optimize -resize 600x600\> out-static*.png  GIF:- | gifsicle --colors 128 --delay=5 --loop --optimize=3 --multifile - > $1.gif
      rm out-static*.png
    else
      ffmpeg -i $1 -s 600x400 -pix_fmt rgb24 -r 10 -f gif - | gifsicle --optimize=3 --delay=3 > $1.gif
    fi
  else
    echo "proper usage: gifify <input_movie.mov>. You DO need to include extension."
  fi
}
