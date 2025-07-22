FROM n8nio/n8n:1.99.1

# Utiliser root temporairement pour la phase de build
USER root

# Définir un répertoire de travail accessible
WORKDIR /home/node/.n8n_custom
COPY package.json ./

# Installer les dépendances localement
RUN rm -rf node_modules package-lock.json && npm install

# Copier les modules dans un répertoire accessible par n8n (avec permissions root)
RUN cp -r /home/node/.n8n_custom/node_modules /usr/local/lib/node_modules/n8n_custom

# Revenir à l'utilisateur node pour l'exécution
USER node

EXPOSE 5678
CMD ["n8n"]