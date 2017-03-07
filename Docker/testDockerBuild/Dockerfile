FROM node:boron
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app
COPY server.js /usr/src/app/
COPY . /usr/src/app
EXPOSE 8080
RUN npm install express
RUN nodejs server.js
