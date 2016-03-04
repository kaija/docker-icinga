#!/bin/sh
docker run -d -p 2080:80 -v /tmp/icinga:/etc/icinga/modules -v /tmp/plugins:/usr/lib/nagios/plugins/custom --name icinga kaija/icinga
