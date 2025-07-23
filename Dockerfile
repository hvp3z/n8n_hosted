FROM n8nio/n8n:1.103.2

# Utiliser root temporairement
USER root

# Installer les dépendances système si nécessaire
RUN apk add --no-cache python3 make g++

# Définir un répertoire de travail
WORKDIR /home/node/.n8n
COPY package.json ./
RUN rm -rf node_modules package-lock.json
RUN npm install -g pdf-parse pdf2pic pizzip docxtemplater
RUN cp -r /home/node/.n8n/* /usr/local/lib/node_modules/
RUN ls -la /usr/local/lib/node_modules

# Définir NODE_PATH
#test
ENV NODE_PATH=/usr/local/lib/node_modules

# Revenir à l'utilisateur node
USER node

