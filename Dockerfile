FROM n8nio/n8n:1.99.1

WORKDIR /usr/src/app
COPY package.json ./
RUN npm install

EXPOSE 5678
CMD ["/usr/local/bin/n8n"]