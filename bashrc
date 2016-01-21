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
# Create new article document
mkarticle() {
	cat <<- "EOF" > $1
	% BEGIN PREAMBLE
	%#####################
	\documentclass{article}
	
	\usepackage{parskip} # No indent of first line in paragraph

	\title{Title goes here}
	\author{Author goes here}

	% END PREAMBLE
	%#####################
	
	\begin{document}
	\maketitle

	\end{document}
	EOF
}

# Create new beamer document
	mkbeamer() {
		cat <<- 'EOF' > $1
		% BEGIN PREAMBLE
		%#####################
		\documentclass{beamer}
		\let\Tiny=\tiny

		\usepackage[utf8]{inputenc}
		\usepackage[british]{babel}
		\usepackage{listings}
		\usepackage{datetime}
		
		\usetheme{CambridgeUS}
		\setbeamertemplate{caption}[numbered]
		
		\title{Title goes here}
		\subtitle{Subtitle here}
		\author{Author}
		\institute{Institute/Organisation}
		\newdate{date}{} % Date of presentation goes here
		\date{\displaydate{date}}

		\defbeamertemplate*{footline}{shadow theme}
		{%
			\leavevmode%
			\hbox{\begin{beamercolorbox}[wd=.5\paperwidth,ht=2.5ex,dp=1.125ex,leftskip=.3cm plus1fil,rightskip=.3cm]{author in head/foot}%
				\usebeamerfont{author in head/foot}\insertframenumber\,/\,\inserttotalframenumber\hfill\insertshortauthor
			\end{beamercolorbox}%
			\begin{beamercolorbox}[wd=.5\paperwidth,ht=2.5ex,dp=1.125ex,leftskip=.3cm,rightskip=.3cm plus1fil]{title in head/foot}%
				\usebeamerfont{title in head/foot}\insertshorttitle%
			\end{beamercolorbox}}%
			\vskip0pt%
		}

		% END PREAMBLE
		%#####################
		\begin{document}
		
		\frame{\titlepage \centering{\vspace{1cm}}}

		\section*{Section name}
			\begin{frame}
				\frametitle{Frame title}
			\end{frame}
		\end{document}
		EOF
	}

# Create new report document
	mkreport() {
		cat <<- 'EOF' > $1
		% BEGIN PREAMBLE
		%######################
		\documentclass[11pt,a4paper,pdftex,dvipsnames]{report}
		
		\usepackage[utf8]{inputenc}
		\usepackage[english]{babel}

		\usepackage{fullpage}
		
		\usepackage{graphicx}
		\usepackage{enumitem}
		\usepackage{hyperref}
		\usepackage{float}

		\usepackage[toc,page]{appendix}
		\usepackage[acronym,nonumberlist]{glossaries}
		\usepackage{multicol} % Multi-column bibliography

		\usepackage{parskip} % Prevent indent of initial paragraph
		\setlength{\parindent}{15pt}

		\makeindex
		\makeglossaries

		% END PREAMBLE
		%#######################
		\begin{document}

		\include{glossary}
		\titlePage

		\newpage

		% TOC
		%#######################
		\tableofcontents
		\newpage

		% Text Body
		%#######################
		
		% START APPENDICES
		%#######################
		\begin{appendices}

		% REFERENCES
		%#######################
		\bibliographystyle{unsrt}
		\bibliography{references}

		% ACRONYMS
		%#######################
		\printglossary[type=\acronymtype]

		% GLOSSARY
		%#######################
		\printglossary

		\end{appendices}

		\end{document}
		EOF
	}

# New latex document
	mktex() {
		mcd $1
		touch $1".tex"
		# Create element directories
		mkdir img

		# Configure tex skeletons
		if [ $2 == 'article' ]
		then
			mkarticle $1".tex"
		elif [ $2 == 'beamer' ]
		then
			mkbeamer $1".tex"
		elif [ $2 == 'report' ]
		then
			touch "glossary.tex"
			touch "title.tex"
			mkdir "tex"
			mkreport $1".tex"
		fi
	}

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
