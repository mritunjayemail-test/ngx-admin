# stage 1
FROM node:8.11.4 as node
WORKDIR /app

RUN npm i npm@latest -g

COPY . .
RUN npm rebuild node-sass

RUN npm i

RUN ng build --prod

# stage 2
FROM nginx:alpine
COPY --from=node /app/dist /usr/share/nginx/html