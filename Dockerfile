FROM debian:stretch-slim

ENV GOGS_VER=0.11.66
RUN mkdir /opt/tlm/
ADD https://github.com/gogs/gogs/releases/download/v${{GOGS_VER}}/linux_amd64.zip /opt/tlm/
ADD files/usersList.txt /opt/tlm
ADD bash/main.sh /opt/tlm/
RUN apt-get -y update && apt-get -y install unzip git &&\
    cd /opt/tlm/ && unzip linux_amd64.zip && mkdir /opt/tlm/gogs/custom &&\
    chmod +x /opt/tlm/main.sh &&\
    apt-get -y autoclean &&\
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /opt/tlm/linux_amd64.zip
ADD files/app.ini /opt/tlm/gogs/custom/conf/app.ini
RUN mkdir /opt/data /opt/data/git /opt/data/git/gogs-repositories
ADD files/gogs.db /opt/data/gogs.db
ENV DOMAIN=tlmzinc.tlm
EXPOSE 22 9418 443
CMD ["/opt/tlm/main.sh"]

