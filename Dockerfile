FROM node:lts

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    ffmpeg \
    imagemagick \
    webp && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/YoL-o/CypherX.git /app

WORKDIR /app

RUN npm install --production && npm cache clean --force

ENV NODE_ENV=production

EXPOSE 3000

CMD sh -c "node keepalive.js & npm run start"
