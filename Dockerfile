FROM n8nio/n8n:1.99.1

USER root
WORKDIR /home/node/.n8n_custom
COPY package.json ./
RUN rm -rf node_modules package-lock.json && npm install
RUN mkdir -p /home/node/custom-modules && cp -r /home/node/.n8n_custom/node_modules/* /home/node/custom-modules/
ENV NODE_PATH=/home/node/custom-modules
USER node

EXPOSE 5678
CMD ["n8n"]