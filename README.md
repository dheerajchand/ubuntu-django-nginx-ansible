#Welcome To The Generic Django Development Environment

This is a Django project template written by Dheeraj Chand of [Clarity and Rigour](http://www.clarityandrigour.com) (email: first_initial+last_name AT clarity and rigour DOT COM, strip the spaces and do the subs).
This software is:

1. Written in [Python](http://www.python.org),
2. Uses [PostgreSQL](http://www.postgresql.org) as the database, with PostGIS extensions and.
3. Uses [GeoDjango](http://www.geodjango.org) as the scripting framework 

Credits to: 

1. [George Nassar](https://github.com/gnassar) for his help in understanding nginx's configuration files.
2. [Jonathan Arehart](https://twitter.com/jonathanarehart) for his general help in understanding server configuration.
## The purpose of this project.

This project allows you to have a new Django project from scratch via Ansible + Vagrant.

Ubuntu 14.04
Python 2.7
PostgreSQL 9.3
PostGIS 2
nginx
gunicorn

## Repo Contents

1. Vagrantfile + Ansible Playbook for virtual machine config. Ansible inspiration from [this project](http://blog.wercker.com/2013/11/25/django-16-part3.html), and configuration instructions modified from [Digital Ocean](https://www.digitalocean.com/community/tutorials/how-to-install-and-configure-django-with-postgres-nginx-and-gunicorn)
2. Code for Honeybee Spatial ETL.

##Host Environment

###Install VirtualBox
https://www.virtualbox.org/wiki/Downloads

###Install Vagrant
https://www.vagrantup.com/downloads.html

###Install Ansible
http://docs.ansible.com/intro_installation.html

##Development Environment
Make sure git doesn't change line endings:
```
git config --global core.autocrlf input
```

##Startup
You will need to edit the vars.yaml file. This file contains usernames and passwords. Please set them according to your preferences.

Start VM with Vagrant. This will use Puppet to install dependencies and run a script to set up virtual environment and pip requirements.
```
vagrant up --provision
```
Open browser to http://localhost:8080 to check that everything works. It should show the Django start page that tells you to configure URL's.

You will also need to create your own Django superuser for the project. You can do that by:

```
vagrant ssh
sudo su
cd /opt/venv/$projectname
python manage.py createsuperuser
```

or by using the manage.py tool in your IDE. [PyCharm](https://www.jetbrains.com/pycharm/) has that built in!

##Management
If you make any changes to Vagrantfile, requirements.txt, or default.pp:
```
vagrant reload --provision
```
If you need to shut down or reboot your laptop, or just want to stop the VM:
```
vagrant halt
```
To log onto VM:
```
vagrant ssh
```
To get rid of a VM if you are done or it was corrupted:
```
vagrant destroy
```
If you a change is made to Vagrantfile or requirements.txt, do
```
vagrant reload -–provision
```