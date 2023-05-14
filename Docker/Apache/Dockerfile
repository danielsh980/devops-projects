FROM docker.io/ubuntu:22.04

WORKDIR /tmp
RUN apt-get update
RUN apt-get install python3 python3-pip apache2 libapache2-mod-wsgi-py3 git -y
RUN pip3 install flask mysql-connector-python
RUN mkdir /var/www/webApp
RUN git clone -b apache-setup https://github.com/danielsh980/devops-projects.git
RUN cp -R /tmp/devops-projects/templates /var/www/webApp
RUN cp /tmp/devops-projects/app.py /var/www/webApp/app.py
RUN cp /tmp/devops-projects/app.wsgi /var/www/webApp/app.wsgi
RUN cp /tmp/devops-projects/webApp.conf /etc/apache2/sites-available/webApp.conf
RUN a2ensite webApp.conf
RUN service apache2 restart
EXPOSE 80
