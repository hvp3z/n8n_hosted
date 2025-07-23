FROM n8nio/n8n:1.103.2

USER root
RUN apk add --no-cache python3 make g++ cairo-dev jpeg-dev pango-dev giflib-dev

USER node

COPY package.json /tmp/
RUN cd /tmp && npm install
RUN cp -R /tmp/node_modules /home/node/.n8n/

ENV NODE_PATH=/home/node/.n8n/node_modules:/usr/local/lib/node_modules/n8n/node_modules

USER node