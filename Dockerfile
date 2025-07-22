FROM n8nio/n8n:1.99.1

USER root
WORKDIR /home/node/.n8n_custom
COPY package.json ./
RUN rm -rf node_modules package-lock.json && npm install
RUN cp -r /home/node/.n8n_custom/node_modules /usr/local/lib/node_modules/
RUN ls -la /usr/local/lib/node_modules
USER node

EXPOSE 5678
CMD ["n8n"]