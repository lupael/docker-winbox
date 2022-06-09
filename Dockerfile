FROM alpine:latest

MAINTAINER ISPbills <support@ispbills.com>

ENV DISPLAY=":1"


RUN addgroup alpine \
RUN  adduser  -G alpine -s /bin/sh -D alpine \
RUN  echo "alpine    ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers 

# For access via VNC
EXPOSE 5900

# For access via noVNC
EXPOSE 8080

COPY etc /etc
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
COPY winbox64.exe /home/alpine
COPY user-data /home/alpine
COPY docker-mikrotik-1024x576.png /etc/xdg/openbox
COPY winbox.png /opt/noVNC 
COPY vnc.html /opt/noVNC
RUN chown alpine:alpine -R /home/alpine

WORKDIR /home/alpine

# User alpine
USER alpine

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]
