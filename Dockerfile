FROM n8nio/n8n

# Définir le répertoire de travail (optionnel, mais recommandé)
WORKDIR /usr/src/app

# Copier package.json et installer les dépendances supplémentaires
COPY package.json ./
RUN npm install pdf-parse pdf2pic pizzip docxtemplater

# Exposer le port par défaut de n8n
EXPOSE 5678

# Utiliser la commande par défaut de n8n
CMD ["n8n"]