FROM ubuntu:24.04
RUN apt update -qq && apt install -y -qq nginx php8.3-fpm php8.3-xml && rm -rf /var/lib/apt/lists/*
COPY nginx.conf /etc/nginx/sites-available/default
COPY html /var/www/html
COPY music /var/www/html/music
RUN mkdir -p /var/www/html/admin && chown -R www-data:www-data /var/www
RUN echo "done" > /run/php-init
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
EXPOSE 80
CMD ["/bin/sh", "/entrypoint.sh"]
