FROM datacite1/nginx

VOLUME [ "/var/log/nginx/" ]

EXPOSE 80

COPY www /var/www/website
