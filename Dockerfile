FROM alpine
RUN apk add --no-cache bash curl
ADD monitor.sh /monitor.sh
RUN echo "*/2 * * * * bash /monitor.sh" >> /var/spool/cron/crontabs/root
CMD ["crond", "-l", "1", "-f"] 
