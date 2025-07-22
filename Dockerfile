FROM n8nio/n8n:1.99.1

# Définir le répertoire de travail
WORKDIR /home/node/.n8n_custom

# Copier package.json et installer les dépendances localement
COPY package.json ./
RUN npm install

# Copier les modules dans un répertoire accessible par n8n (optionnel, selon le contexte)
# RUN cp -r node_modules /usr/local/lib/node_modules/

EXPOSE 5678
CMD ["n8n"]