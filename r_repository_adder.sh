sudo su 
echo "deb http://stat.ethz.ch/CRAN/bin/linux/ubuntu trusty/ #enabled-manually" >> /etc/apt/sources.list
echo "#lol" >> /etc/apt/sources.list

sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E084DAB9

