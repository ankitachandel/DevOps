FROM ubuntu:18.04
MAINTAINER Ankita chandel <ankitchandel11@gmail.com>
RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive TZ=Etc/UTC apt-get -y install tzdata
RUN apt-get update && apt-get install -y sudo git supervisor
WORKDIR /var/www/html/
ADD install_ubuntu.sh install_ubuntu.sh
RUN bash install_ubuntu.sh

RUN cd /var/www/html/ && \
    git clone https://github.com/phacility/libphutil.git && \
    git clone https://github.com/phacility/arcanist.git && \
    git clone https://github.com/phacility/phabricator.git
ADD phabricator.conf /etc/apache2/sites-enabled/phabricator
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
RUN add-apt-repository ppa:git-core/ppa
RUN apt-get install mercurial python-pygments subversion -y 
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y git git-core mysql-server apache2 libapache2-mod-php php php7.1-zip php-[extname] php-mysql php-gd php-curl php-apcu php-cli php-json php-mbstring
RUN sudo a2enmod rewrite
#CMD ["/usr/bin/supervisord", "-n", "-c", "/etc/supervisor/supervisord.conf"]
