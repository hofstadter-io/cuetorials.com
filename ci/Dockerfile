FROM nginx:stable

COPY dist /usr/share/nginx/html
COPY ./ci/nginx.conf /etc/nginx/nginx.conf
COPY ./ci/server.conf /etc/nginx/conf.d/server.conf
