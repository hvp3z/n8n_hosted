FROM n8nio/n8n:1.99.1

# Installer les dépendances globalement pour qu'elles soient accessibles par n8n
RUN npm install -g pdf-parse pdf2pic pizzip docxtemplater

# Exposer le port
EXPOSE 5678

# Utiliser la commande par défaut de l'image de base
CMD ["n8n"]