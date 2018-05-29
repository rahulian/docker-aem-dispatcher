FROM ubuntu:16.04

RUN \
  apt-get update && \
  apt-get -y upgrade && \
  apt-get install -y build-essential && \
  apt-get install -y software-properties-common && \
  apt-get install locales && \
  rm -rf /var/lib/apt/lists/*

# Install dependencies
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update
RUN apt-get install -qq wget nano less unzip apache2 tar gzip sudo

# Set default locale
RUN locale-gen en_GB.UTF-8
ENV LANG en_GB.UTF-8
ENV LANGUAGE en_GB:en
ENV LC_ALL en_GB.UTF-8

# Create dispatcher cache folders
RUN mkdir /etc/apache2/conf
RUN mkdir -p /etc/apache2/dispatcher/cache

# Add config files to appropriate folders
ADD dispatcher/.bash_profile /root/.bash_profile
ADD dispatcher/dispatcher.conf /etc/apache2/conf-available/
ADD dispatcher/dispatcher.load /etc/apache2/mods-available/
ADD dispatcher/dispatcher.any /etc/apache2/conf/
ADD dispatcher/dispatcher-apache2.4-4.2.3.so /usr/lib/apache2/modules/mod_dispatcher.so
ADD dispatcher/jdf-aem-dispatcher.conf /etc/apache2/sites-available/

# Manually set up the apache environment variables
ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2
ENV APACHE_LOCK_DIR /var/lock/apache2
ENV APACHE_PID_FILE /var/run/apache2.pid

EXPOSE 80

# Set environment variables
ENV HOME /root

# Load apache modules, conf and site
RUN a2enmod rewrite
RUN a2enmod dispatcher
RUN a2enconf dispatcher
RUN a2ensite jdf-aem-dispatcher

# Launch apache 
CMD apachectl -D FOREGROUND
 