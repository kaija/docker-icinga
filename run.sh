#!/bin/bash
/etc/init.d/apache2 start

icinga_user=$ICINGA_USER
icinga_pass=$ICINGA_PASS

#create password for web access
htpasswd -cb /etc/icinga/htpasswd.users $icinga_user $icinga_pass

icinga /etc/icinga/icinga.cfg
