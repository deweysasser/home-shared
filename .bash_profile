# Put any machine or domain specific overrides into 
# ~/.conf/machine/$host

source ~/.bash-functions

. ~/.bash-prompt


function source-if() {
    for file in "$@"; do
	if [ -r "$file" ] ; then
	    source "$file"
	fi
    done
}

source-if ~/.bash-interactive-functions


export CVS_RSH=ssh
export RSYNC_RSH=ssh

alias which='type'
alias more=less
alias start='cygstart'

source-if ~/bin/share/pkgmgr-bootstrap.bsh

export GNUSERV_SHOW_EMACS=1

if [[ `uname -s`  == CYGWIN* ]] ; then
    export PATH="$PATH:~/bin/nt"
else
    os=`uname -s`
    export PATH="$PATH:~/bin/$os"
fi



#hostOrDomainOverride -v .bash_login

addPath ~/bin/share /sbin /usr/sbin

ssh-setup

source-if ~/.bash_completion ~/.bash_completion_svn

export SGML_CATALOG_FILES=~/etc/sgml/XMLCATALOG
JAVA_DEBUG="-Xdebug -Xrunjdwp:transport=dt_socket,address=4444,server=y,suspend=n"
export EDITOR=vi

addListConditional MANPATH ~/man
addListConditional PYTHONPATH ~/lib/python
addListConditional PERL5LIB ~/lib/perl5


hostOrDomainOverride .bash_profile

ssh-use-current

if command-exists keychain ; then
    keychain
fi


source-if ~/.bashrc
