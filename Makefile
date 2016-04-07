all: image debug

image:
	docker build -t kaija/icinga .
debug:
	docker run -it -p 2080:80 -p 161:161/udp -v ${PWD}/modules:/etc/icinga/modules -v /tmp/plugins:/usr/lib/nagios/plugins/custom kaija/icinga /bin/bash
run:
	docker run -d  -p 2080:80 -p 161:161/udp -v ${PWD}/modules:/etc/icinga/modules -v /tmp/plugins:/usr/lib/nagios/plugins/custom kaija/icinga
