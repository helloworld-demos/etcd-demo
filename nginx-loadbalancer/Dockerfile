FROM nginx:1.13.8

EXPOSE 80

ENV PATH="/opt/confd/bin:${PATH}"
ENV ETCD_PORT=2379
ENV HOST_IP=10.1.92.1

# install confd (https://github.com/kelseyhightower/confd/blob/master/docs/installation.md#linux)
ADD https://github.com/kelseyhightower/confd/releases/download/v0.15.0/confd-0.15.0-linux-amd64 /opt/confd/bin/confd

RUN chmod +x /opt/confd/bin/confd

# remove default nginx configuration since conf will generate one dynamically
RUN rm -rf /etc/nginx/nginx.conf
ADD nginx.toml /etc/confd/conf.d/nginx.toml
ADD nginx.tmpl /etc/confd/templates/nginx.tmpl

# integrate confd with nginx
ADD confd-watch /usr/local/bin/confd-watch
RUN chmod +x /usr/local/bin/confd-watch

CMD /usr/local/bin/confd-watch