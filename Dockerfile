FROM node:latest
EXPOSE 443
COPY . .
WORKDIR .
RUN chmod +x /startup.sh
ENTRYPOINT ["/startup.sh"]