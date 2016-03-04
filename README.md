# Docker icinga


### Build


sh build.sh

or


docker build -t kaija/icinga .



### Run


sh test.sh

or


expose container port 80 to host port 8080

docker run -d -p 8080:80 kaija/icinga

specified the login user name and password

docker run -d -e ICINGA_USER=kaija -e ICINGA_PASS=123456 -p 8080:80 kaija/icinga

mount extra config into icinga config dir

docker run -d -p 8080:80 kaija/icinga -v /tmp/icinga:/etc/icinga/modules
