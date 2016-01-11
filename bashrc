# For easy reloading
alias reload='source ~/.bashrc'

# Convenience
#########################################################
alias c='clear'														# Clear terminal display
alias f='open -a Finder ./'								# Open current directory in finder
trash () { command mv "$@" ~/.Trash ; }		# Move file to OSX trash

# Navigation
#########################################################

# Create new directory and cd to it
	mcd () {
		mkdir -p $1
		cd $1
	}

# Moving around
alias ..='cd ..'
alias ....='cd ../..'

# Directory shortcuts
alias university='cd ~/Documents/University/UiB/Master'
alias downloads='cd ~/Downloads'
alias dropbox='cd ~/Dropbox'
alias drive='cd ~/Google\ Drive'
alias projects='cd ~/Documents/IT/Projects'

# System Operations & Information
#########################################################

# Find pid of specified process
	findPid() { lsof -t -c "$@" ; }

# Find processes owned by current user
	my_ps() { ps $@ -u $USER -o pid,%cpu,%mem,start,time,bsdtime,command ; }

# Recommended invocation of top to save resources
alias ttop='top -R -F -s 10 -o rsize'

# Find memory hogs
alias memHogsTop='top -l 1 -o rsize | head -20'
alias memHogsPs='ps wwaxm -o pid,start,vsize,rss,time,command | head -10'

# Hide/Show hidden files in finder
alias finderShowHidden='defaults write com.apple.finder ShowAllFiles TRUE'
alias finderHideHidden='defaults write com.apple.finder ShowAllFiles FALSE'

# Networking
#########################################################

# App-specific
#########################################################
alias prolog='/opt/local/bin/swipl'
alias chrome='open -a "Google Chrome"'
alias fox='open -a "FireFox"'

# Initialize an empty Unity project
	
### Latex ###

# New latex document
	mktex() {
		mcd $1
		touch $1".tex"
	}

# Create new beamer document
	

# Clean latex aux files, '2> /dev/null' avoids error message if no file found.
	latexclean () {
		rm *.aux 2> /dev/null;
		rm *.log 2> /dev/null;
		rm *.nav 2> /dev/null;
		rm *.out 2> /dev/null;
		rm *.snm 2> /dev/null;
		rm *.toc 2> /dev/null;
		rm *.fls 2> /dev/null;
		rm *.fdb_latexmk 2> /dev/null;
		rm *-blx.bib 2> /dev/null;
		rm *.acn 2> /dev/null;
		rm *.bbl 2> /dev/null;
		rm *.blg 2> /dev/null;
		rm *.glo 2> /dev/null;
		rm *.idx 2> /dev/null;
		rm *.ilg 2> /dev/null;
		rm *.ind 2> /dev/null;
		rm *.ist 2> /dev/null;
		rm *.run.xml 2> /dev/null;
		rm *.acr 2> /dev/null;
		rm *.alg 2> /dev/null;
		rm *.glg 2> /dev/null;
		rm *.gls 2> /dev/null;
		rm *.glsdefs 2> /dev/null;
	}

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

export PATH="$PATH:/Applications/HP_Fortify/HP_Fortify_SCA_and_Apps_4.10/bin"
