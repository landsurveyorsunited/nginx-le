FROM nginx:stable-alpine

ADD conf/nginx.conf /etc/nginx/nginx.conf
#ADD conf/service.conf /etc/nginx/conf.d/service.conf

ADD script/entrypoint.sh /entrypoint.sh
ADD script/le.sh /le.sh

RUN \
 chmod +x /entrypoint.sh && \
 chmod +x /le.sh && \
 apk add  --update letsencrypt tzdata openssl && \
 rm -rf /var/cache/apk/*

CMD ["/entrypoint.sh"]
