#!/bin/sh
docker run -d -p 2080:80 -v /tmp/icinga:/etc/icinga/modules kaija/icinga
