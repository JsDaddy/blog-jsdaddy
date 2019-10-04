FROM node:10

#WORKDIR /usr/src/app
RUN npm i -g hexo
RUN npm install -g ts-node

RUN npm install -g typescript

COPY package*.json ./

RUN npm install

RUN hexo clean

RUN hexo server
