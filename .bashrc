. ~/.bash-functions

for d in ~/tools/*; do
    if [ -d $d/bin ] ; then
	addPath $d/bin
    else
	addPath $d
    fi
done

addPath ~/bin

hostOrDomainOverride .bashrc

ssh-use-current

