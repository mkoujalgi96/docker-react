FROM node:alpine as builder
WORKDIR /app1
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
COPY --from=builder app1/build /usr/share/nginx/html