FROM node:10

WORKDIR /usr/src/app

RUN npm i -g hexo

COPY package*.json ./

RUN npm install

COPY . /usr/src/app

RUN hexo clean

CMD ["hexo", "server"]
