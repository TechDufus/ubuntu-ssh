FROM ubuntu:latest
RUN apt-get update && apt-get install -y openssh-server

WORKDIR /usr/var/ssh/
COPY entrypoint.sh .

EXPOSE 22
ENTRYPOINT ["/usr/var/ssh/entrypoint.sh"]
