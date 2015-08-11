FROM ubuntu:14.04

RUN apt-get install -q -y nginx

ADD nginx-site /etc/nginx/sites-available/default
ADD start-nginx.sh /root/

# forward request and error logs to docker log collector
RUN ln -sf /dev/stdout /var/log/nginx/access.log
RUN ln -sf /dev/stderr /var/log/nginx/error.log

ENTRYPOINT ["/root/start-nginx.sh"]
