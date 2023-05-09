FROM node:16-alpine AS image

WORKDIR /index

COPY package*.json ./

RUN npm install

COPY ./src ./src
COPY ./tsconfig.json ./

RUN npm run build

RUN rm -rf node_modules

RUN rm -rf /root/.npm

RUN npm install --omit=dev

COPY ./init /init

CMD ["npm", "run", "start"]