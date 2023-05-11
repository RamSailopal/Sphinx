#!/bin/bash
if [[ "$1" == "" ]]
then
	echo "Please enter html, pdf or both"
	exit 1
fi
if [[ "$1" == "html" ]]
then
	cd /home/sphinx/docs
	make html
fi
if [[ "$1" == "pdf" ]]
then
        cd /home/sphinx/docs
        make latexpdf
        cp -f /home/sphinx/docs/_build/latex/* /home/sphinx/docs/_build/html
fi
if [[ "$1" == "both" ]]
then
        cd /home/sphinx/docs
        make html
        make latexpdf
        cp -f /home/sphinx/docs/_build/latex/* /home/sphinx/docs/_build/html
fi


