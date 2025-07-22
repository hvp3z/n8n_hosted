FROM n8nio/n8n:1.99.1

WORKDIR /home/node/.n8n_custom
COPY package.json ./
RUN npm install
RUN npm list
EXPOSE 5678
CMD ["n8n"]