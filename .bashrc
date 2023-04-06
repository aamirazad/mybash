# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
	for rc in ~/.bashrc.d/*; do
		if [ -f "$rc" ]; then
			. "$rc"
		fi
	done
fi

# Set the default editor
export EDITOR=nvim
alias vim='nvim'

unset rc

alias aamir='echo hello' 

# Change directory aliases
alias home='cd ~'
alias cd..='cd ..'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

# Remove a directory and all files
alias rmd='/bin/rm  --recursive --force --verbose '

# Alias's for safe and forced reboots
alias rebootsafe='sudo shutdown -r now'
alias rebootforce='sudo shutdown -r -n now'

# Alias's for archives
alias mktar='tar -cvf'
alias mkbz2='tar -cvjf'
alias mkgz='tar -cvzf'
alias untar='tar -xvf'
alias unbz2='tar -xvjf'
alias ungz='tar -xvzf'

# Fedora Storage drive
alias mntStorage='sudo mount -o uid=1000,gid=1000,rw /dev/sda2 /mnt/Storage/'
alias mntUbuntu='sudo mount -U 91c2ef08-37ac-4132-b782-dec7cbd90917 /mnt/Ubuntu'
alias mountStorage='sudo mount -o uid=1000,gid=1000,rw /dev/sda2 /mnt/Storage/'
alias jDown='cd /mnt/Storage/Users/Aamir/Downloads/'
alias jMy-stuff='cd /mnt/Storage/Users/Aamir/My-stuff/'
alias jCode='cd /mnt/Storage/Users/Aamir/My-stuff/Github/'

# Autojump
[[ -s /home/aamir/.autojump/etc/profile.d/autojump.sh ]] && source /home/aamir/.autojump/etc/profile.d/autojump.sh

# Github copilot cli

eval "$(github-copilot-cli alias -- "$0")"

# Starship

eval "$(starship init bash)"

# fnm
export PATH="/home/aamir/.local/share/fnm:$PATH"
eval "`fnm env`"

# Find text in pdf!

function greppdf {
    find . -name '*.pdf' -exec sh -c 'pdftotext "{}" -' \; | grep -i --with-filename --label=$1 "$1"
}

