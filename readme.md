## Ubuntu 16.04 AEM Server

### Instructions

#### Build docker image

`$ docker build -t aem-dispatcher-ubuntu-16.04:1.0 .`

#### Run image
`$ docker run --name aem-dispatcher --add-host=aem-pub-host:<host-ip> -p <pub-port>:80 aem-dispatcher-ubuntu-16.04:1.0`

where `<pub-ip>` is the ip of the server running the aem publisher and `<host-port>` is the host port where this image's port
should be mapped.


#### Monitor
Once the container is running, open Kitematic, find image named 'aem-dispatcher' and launch the container console
using 'Exec'. The dispatcher log can then be monitored in the console using the following command

`$ tail -f /var/log/apache2/dispatcher.log`

#### Stop
To stop the server, stop the container using the command

`$ docker stop aem-dispatcher`