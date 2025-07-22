FROM n8nio/n8n:1.99.1

# Utiliser root temporairement pour la phase de build
USER root

# Définir un répertoire de travail
WORKDIR /home/node/.n8n_custom
COPY package.json ./

# Installer les dépendances localement et copier directement dans le répertoire global
RUN rm -rf node_modules package-lock.json && npm install
RUN cp -r /home/node/.n8n_custom/node_modules/* /usr/local/lib/node_modules/

# Revenir à l'utilisateur node
USER node

EXPOSE 5678
CMD ["n8n"]