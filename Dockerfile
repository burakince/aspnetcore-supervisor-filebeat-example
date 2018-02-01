FROM burakince/aspnetcore-supervisor-filebeat:2.0.5

RUN mkdir -p /etc/filebeat \
  && mkdir -p /etc/value-service \
  && mkdir -p /var/log/supervisord \
  && mkdir -p /app \
  && mkdir -p /var/log/value-service

WORKDIR /app

COPY ValueService/out .
COPY filebeat.yml /etc/filebeat/filebeat.yml
COPY supervisord.conf /etc/value-service/supervisord.conf

HEALTHCHECK --interval=30s --timeout=30s --start-period=5s --retries=3 \
  CMD curl --fail http://localhost:80/api/status || exit 1

ENTRYPOINT ["/usr/bin/supervisord", "-c", "/etc/value-service/supervisord.conf"]
