FROM node:19-alpine3.15 as deps
WORKDIR /app
COPY package.json ./
RUN npm install

FROM node:19-alpine3.15 as builder
WORKDIR /app
COPY --from=deps /app/node_modules ./node_modules
COPY . .
RUN npm run test

FROM node:19-alpine3.15 as prod-deps
WORKDIR /app
COPY package.json ./
RUN npm install --prod

FROM node:19-alpine3.15 as runner
WORKDIR /app
COPY --from=prod-deps /app/node_modules ./node_modules
COPY app.js ./
COPY tasks/ ./tasks
CMD [ "node", "app.js" ]