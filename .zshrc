# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/home/sahil/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="bullet-train"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
		autojump
		git
		common-aliases
		python
	)

source $ZSH/oh-my-zsh.sh

[[ -s /home/sahil/.autojump/etc/profile.d/autojump.sh ]] && source /home/sahil/.autojump/etc/profile.d/autojump.sh

	autoload -U compinit && compinit -u

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
alias zshconfig="subl ~/.zshrc"
alias ohmyzsh="subl ~/.oh-my-zsh"
alias st="subl"

alias poi="j panda; source venv/bin/activate;"
alias lkj="cd ~/Project/Terrain_Car/; source venv/bin/activate;"
alias qwe="source venv/bin/activate;"
alias deac="deactivate"
alias runserver='python manage.py runserver'
alias makemigrations='python manage.py makemigrations'
alias migrate='python manage.py migrate'
alias collectstatic='python manage.py collectstatic'
alias djshell='python manage.py shell_plus'
alias djnb='python manage.py shell_plus --notebook'
alias dbshell='python manage.py dbshell'
alias djrun='python manage.py'

# Buller-train settings
BULLETTRAIN_STATUS_SHOW=true
BULLETTRAIN_TIME_SHOW=false
BULLETTRAIN_CONTEXT_SHOW=true
BULLETTRAIN_CONTEXT_BG='white'
BULLETTRAIN_CONTEXT_FG='black'

BULLETTRAIN_CUSTOM_MSG='sahil@ares'
BULLETTRAIN_CUSTOM_BG='white'
BULLETTRAIN_CUSTOM_FG='black'

BULLETTRAIN_CONTEXT_SHOW=true
BULLETTRAIN_NVM_SHOW=false
BULLETTRAIN_RUBY_SHOW=false
BULLETTRAIN_GO_SHOW=false
BULLETTRAIN_PERL_SHOW=false
BULLETTRAIN_HG_SHOW=false

BULLETTRAIN_PROMPT_ORDER=(
  context
  dir
  virtualenv
  git
)

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" 


export TERRAIN_CAR_SECRET='6(vm+h2_t9a677axofevq&f_f!^qe=+czp3r+c*i#1id6b^%pk'
export AWS_ACCESS_KEY_ID='AKIAIEZ4DBSUQNXNIQJA'
export AWS_SECRET_ACCESS_KEY='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'
export S3_BUCKET_NAME='terrain-car-assets'
export S3_BUCKET_REGION='ap-south-1'
