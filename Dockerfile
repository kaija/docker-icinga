FROM ubuntu

MAINTAINER Kaija Chang <kaija.chang@gmail.com>

RUN apt-get update
RUN apt-get dist-upgrade -y

RUN DEBIAN_FRONTEND=noninteractive apt-get -y dist-upgrade
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install software-properties-common
RUN DEBIAN_FRONTEND=noninteractive add-apt-repository ppa:formorer/icinga
RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y icinga
RUN apt-get install -y snmptt wget patch smistrip
COPY packages/snmp-mibs-downloader_1.1_all.deb /var/cache/apt/archives/
RUN dpkg -i /var/cache/apt/archives/snmp-mibs-downloader_1.1_all.deb
COPY templates/snmptrapd.conf /etc/snmp/snmptrapd.conf
COPY templates/snmptt.ini /etc/snmp/snmptt.ini
COPY templates/snmpd.conf /etc/snmp/snmpd.conf
COPY templates/snmpd /etc/default/snmpd
COPY templates/snmptt-nagios.conf /etc/snmp/snmptt-nagios.conf
RUN mkdir -p /usr/lib/nagios/plugins/custom
COPY scripts/run.sh /run.sh

ENV ICINGA_USER icingaadmin
ENV ICINGA_PASS icingaadmin

CMD ["/bin/bash", "/run.sh"]
