#!/bin/bash
apt-get update
export DEBIAN_FRONTEND="noninteractive"
apt-get install -y python3-sphinx apache2 python3-pip fonts-freefont-otf latexmk
texlive-fonts-recommended texlive-latex-recommended texlive-latex-extra texlive-lang-greek tex-gyre texlive-xetex
if ! test -d /home/sphinx/docs
then
        cd /home/sphinx
	(echo "";echo "";echo "Test";echo "Test";echo "";echo "";echo "";echo "";echo "";echo "";echo "";echo "";echo "";echo "";echo "";echo "";echo "";echo "";echo "";echo "") | sphinx-quickstart docs
        cd /home/sphinx
fi
if ! test -d /var/www/html/_sources
then
	rm -Rf /var/www/html
        ln -sf /home/sphinx/docs/_build/html /var/www 
fi
sed -i '/DocumentRoot \/var\/www\/html/a<Directory \/>\nOptions FollowSymLinks\nAllowOverride None\n<\/Directory>' /etc/apache2/sites-available/000-default.conf
service apache2 restart
cd /home/sphinx/docs
pip3 install myst_parser
pip3 install --upgrade docutils
make html
tail -f /dev/null
