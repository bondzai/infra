FROM node:14-alpine
WORKDIR /app
COPY package*.json ./
RUN yarn --production
COPY . .
EXPOSE 1234
CMD [ "yarn", "start" ]
