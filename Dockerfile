# syntax=docker/dockerfile:1
FROM node:20-alpine

WORKDIR /usr/src/app

RUN apk add --no-cache python3 make g++ sqlite

COPY package*.json ./
RUN npm ci --omit=dev

COPY . .
EXPOSE 3000
CMD ["node", "app.js"]
