FROM nginx

RUN apt-get update -qq && apt-get -y install apache2-utils
ENV NODE_ROOT /var/www/api-gateway
WORKDIR $NODE_ROOT
RUN mkdir log
COPY ./nginx/ssl-client.conf /tmp/app.nginx
RUN envsubst '$NODE_ROOT' < /tmp/app.nginx > /etc/nginx/conf.d/default.conf

CMD [ "nginx", "-g", "daemon off;" ]

#docker build -t proxy_frontmaaia .
#docker run -p 80:80 proxy_frontmaaia