FROM node:alpine

WORKDIR '/app'

COPY ./package.json ./

RUN npm install

COPY ./ ./

RUN npm run build

FROM nginx
#For AWS EXPOSE is needed
EXPOSE 3000
COPY ./ngnix/default.conf /etc/nginx/conf.d/default.conf
COPY --from=0 /app/build /usr/share/nginx/html
