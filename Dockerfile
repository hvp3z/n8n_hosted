FROM n8nio/n8n:1.99.1

WORKDIR /usr/src/app
COPY package.json ./
RUN npm install
CMD ["n8n"]
EXPOSE 5678