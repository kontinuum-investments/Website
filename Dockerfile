FROM node:latest
EXPOSE 443
COPY . .
WORKDIR .
RUN npm i --omit dev
RUN npm run build
RUN npm i --omit dev
ENTRYPOINT ["./startup.sh"]
