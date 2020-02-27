FROM grafana/grafana

COPY influx.yml /etc/grafana/provisioning/datasources/influx.yml
COPY dashboards.yml /etc/grafana/provisioning/dashboards/dashboards.yml
COPY panels/* /var/lib/grafana/dashboards/


EXPOSE 3000
