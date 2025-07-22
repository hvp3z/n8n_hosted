FROM n8nio/n8n:1.99.1

WORKDIR /home/node/.n8n_custom
COPY package.json ./
RUN rm -rf node_modules package-lock.json && npm install && npm list
RUN cp -r /home/node/.n8n_custom/node_modules /home/node/node_modules

EXPOSE 5678
CMD ["n8n"]