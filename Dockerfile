FROM  ubuntu:trusty
MAINTAINER Ricardo Rivas G. <richistron@gmail.com>
#####################
# setting up apache #
#####################
# installing stuff
RUN apt-get update -y
RUN apt-get install apache2 -y
RUN apt-get install -y mysql-client
RUN apt-get install php5 libapache2-mod-php5 php5-mysql -y
RUN apt-get install -y wget rsync
# enable apache modules
RUN a2enmod php5
RUN a2enmod rewrite
# remove html default dir
RUN rm -rf /var/www/html
# run apache
ADD bootstrap.sh /boostrap.sh
RUN chmod 0755 /boostrap.sh
CMD ["bash", "/boostrap.sh"]
# PORT
EXPOSE 80
