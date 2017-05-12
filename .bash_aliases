# aliases for system access tools and updates
alias agu='sudo apt-get update'
alias agg='sudo apt-get upgrade'
alias agi='sudo apt-get install'
alias acs='apt-cache search'
alias st='subl'
alias python='python3'
alias pip='pip3'
# Aliases for git
alias git='git --no-pager'
alias gs='git status'
alias gb='git branch -a --color'
alias gd='git diff --color'
alias gc='git commit'
alias ga='git add'
alias gl='git log --pretty=oneline'
alias gps='git push'
alias gpl='git pull'
alias gco='git checkout'
alias grm='git rm'
alias gmv='git mv'
# Some common shortcuts for file-/directory commands
alias ls='ls --color=auto'
alias la='ls -a'
alias ll='ls -l'
alias lla='ls -la'
alias l='ls'
alias ~='cd ~'
alias ..='cd ..'
alias ...='cd ../../'
alias ....='cd ../../../'
# Colorize the grep command output for ease of use (good for log files)##
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

alias pls='sudo "$BASH" -c "$(history -p !!)"'
alias activate="source venv/bin/activate"

alias cdp='cd ~/Project/Project-Panda'
alias alias_edit='vim ~/.bash_aliases'
alias srcbashrc='source ~/.bashrc'

# Django-Python shortcuts
alias runserver='python manage.py runserver'
alias makemigrations='python manage.py makemigrations'
alias migrate='python manage.py migrate'
alias collectstatic='python manage.py collectstatic'
alias djshell='python manage.py shell_plus'
alias djnb='python manage.py shell_plus --notebook'
alias dbshell='python manage.py dbshell'

# Go to project and start virtualenv
alias pyinit='cd ~/Project/Project-Panda;source venv/bin/activate'

# Make all migrations and collect static
alias mms='python manage.py makemigrations; python manage.py migrate; python manage.py collectstatic'
alias mm='python manage.py makemigrations; python manage.py migrate;' 

