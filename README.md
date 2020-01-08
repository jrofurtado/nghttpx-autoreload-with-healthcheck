# nhttpx-autoreload-with-healthcheck

# Volumes
/volume dir should be a volume and should contain the fullchain certificate *server.crt* and key *server.key*

If server.crt changes nghttpx will reload the certificate

# Environment variables
* PARAMS extra nghttx arguments

# docker-compose example
~~~~
version: '3'

volumes:
  lb_data:
    driver: local

services:
  myservice:
    ...
  lb:
    ports:
      - "80:80"
      - "443:443"
    build: ../nghttpx-autoreload-with-healthcheck
    image: jrofurtado/nghttpx-autoreload-with-healthcheck:latest
    volumes: 
      - lb_data:/volume
    environment:
      PARAMS: '
        -f"*,80;no-tls"
        -f"*,443"
        -b"myservice,8080;;dns;"'
~~~~