## Ubuntu 16.04 AEM Server

### Instructions

#### Build docker image

`$ docker build -t jdf-aem-dispatcher-ubuntu-16.04:1.0 .`

#### Run image
`$ docker run --name jdf-aem-dispatcher --add-host=jdf-pub-host:<host-ip> -p <host-port>:80 jdf-aem-dispatcher-ubuntu-16.04:1.0`

where `<host-ip>` is the ip of the host running the image and `<host-port>` is the host port where this image's port should be mapped.


#### Monitor
Once the container is running, open Kitematic, find image named 'jdf-aem-dispatcher' and launch the container console using 'Exec'.
The dispatcher log can then be monitored in the console using the following command

`$ tail -f /var/log/apache2/dispatcher.log`

#### Stop
To stop the server, stop the container using the command

`$ docker stop jdf-aem-dispatcher`