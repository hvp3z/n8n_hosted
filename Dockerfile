FROM n8nio/n8n:1.99.1

# Installer les dépendances globalement
RUN npm install -g pdf-parse pdf2pic pizzip docxtemplater

EXPOSE 5678
CMD ["n8n"]