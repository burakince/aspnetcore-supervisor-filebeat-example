FROM burakince/aspnetcore-supervisor-filebeat:2.0.4

RUN mkdir -p /etc/filebeat \
  && mkdir -p /etc/value-service \
  && mkdir -p /var/log/supervisord \
  && mkdir -p /app \
  && mkdir -p /var/log/value-service

WORKDIR /app

COPY ValueService/out .
COPY filebeat.yml /etc/filebeat/filebeat.yml
COPY supervisord.conf /etc/value-service/supervisord.conf

ENTRYPOINT ["/usr/bin/supervisord", "-c", "/etc/value-service/supervisord.conf"]
