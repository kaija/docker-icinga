FROM ubuntu

MAINTAINER Kaija Chang <kaija.chang@gmail.com>

RUN apt-get update
RUN apt-get dist-upgrade -y

RUN DEBIAN_FRONTEND=noninteractive apt-get -y dist-upgrade
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install software-properties-common
RUN DEBIAN_FRONTEND=noninteractive add-apt-repository ppa:formorer/icinga
RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y icinga
RUN mkdir -p /usr/lib/nagios/plugins/custom
COPY run.sh /run.sh

ENV ICINGA_USER admin
ENV ICINGA_PASS admin

CMD ["/bin/bash", "/run.sh"]
