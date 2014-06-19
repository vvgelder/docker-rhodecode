## docker-rhodecode 
docker container for running rhodecode. 


### Requirements:
- docker

    $ sudo apt-get docker.io 
    $ ln -s /usr/bin/docker.io /usr/bin/docker


- fig
   
   $ pip install fig

### build image:
Clone the repository

    $ git clone https://github.com/vvgelder/docker-rhodecode.git
    $ cd docker-rhodecode

Adjust the values for admin user,pass and email in noninteractive.ini. Don't adjust the other variables unless you know what you are doing. Otherwise building the imagemight fail.
Then start the build process, this might take a while.
    $ docker build -t vvgelder/rhodecode .
 
### Start container and expose port 5000
    $ mkdir -p /srv/rhodecode/repos/ && mkdir /srv/rhodecode/db
    $ mv fig1.yml fig.yml 
    $ fig up -d
Go to: http://localhost:5000

### Start container and use nginx reverse proxy
prerequisite: https://github.com/jwilder/nginx-proxy`

Adjust VIRTUAL_HOST= to the hostname that points to your proxy.

    $ mkdir -p /srv/rhodecode/repos/ && mkdir /srv/rhodecode/db
    $ mv fig2.yml fig.yml 
    $ fig up -d

Go to: http://<VIRTUAL_HOST>:80


###see also: 
 - http://jasonwilder.com/blog/2014/03/25/automated-nginx-reverse-proxy-for-docker/
 - https://rhodecode.com/help/kb/installation-setup/non-interactive-installation-linux


###Limitations:
 - only support for sqlite
 - no support for celery

