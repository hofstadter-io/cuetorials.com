FROM nginx:1.21.6

RUN mkdir /var/log/pv && chown nginx:nginx /var/log/pv
COPY ./ci/nginx.conf /etc/nginx/nginx.conf
COPY ./ci/server.conf /etc/nginx/conf.d/default.conf
COPY dist /usr/share/nginx/html
