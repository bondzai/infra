FROM node:slim AS app

ENV PUPPETEER_SKIP_CHROMIUM_DOWNLOAD true

RUN apt-get update && apt-get install curl gnupg -y \
  && curl --location --silent https://dl.google.com/linux/linux_signing_key.pub | apt-key add - \
  && sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list' \
  && sh -c 'echo "deb [arch=armhf] http://ports.ubuntu.com/ubuntu-ports/ bionic main universe" >> /etc/apt/sources.list.d/ubuntu-ports.list' \
  && apt-get update \
  && apt-get install chromium-browser -y --no-install-recommends \
  && rm -rf /var/lib/apt/lists/*

WORKDIR /app

USER root

COPY package*.json ./

RUN npm install

COPY . .

EXPOSE 5001

CMD ["npm", "start"]
