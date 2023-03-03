FROM nginx
COPY ./docker-entrypoint.sh /
ENTRYPOINT ["./docker-entrypoint.sh"]