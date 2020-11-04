FROM nginx

COPY . /app

COPY default.conf /etc/nginx/conf.d/default.conf

WORKDIR /app

RUN apt-get update -y && apt-get install python3 supervisor -y && cp supervisord.conf /etc/supervisor/supervisord.conf

ENTRYPOINT ["/usr/bin/supervisord"]