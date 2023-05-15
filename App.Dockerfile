FROM node:20-alpine

WORKDIR /usr/src/app

COPY backend/package*.json ./
RUN npm i
COPY backend/dist ./
COPY .env ./
EXPOSE 3000

CMD ["node", "src/index.js"]