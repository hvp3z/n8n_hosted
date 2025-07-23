FROM n8nio/n8n:1.103.2

# Passer en root pour installer les dépendances système
USER root

# Installer les dépendances système nécessaires
RUN apk add --no-cache \
    python3 \
    make \
    g++ \
    cairo-dev \
    jpeg-dev \
    pango-dev \
    giflib-dev \
    pixman-dev \
    pangomm-dev \
    libjpeg-turbo-dev \
    freetype-dev

# Revenir à l'utilisateur node
USER node

# Créer le répertoire pour les modules personnalisés
RUN mkdir -p /home/node/.n8n/custom_modules

# Installer les packages npm dans le répertoire personnalisé
WORKDIR /home/node/.n8n/custom_modules
RUN npm init -y
RUN npm install pdf-parse pdf2pic pizzip docxtemplater

# Définir le NODE_PATH pour inclure nos modules personnalisés
ENV NODE_PATH="/home/node/.n8n/custom_modules/node_modules:/usr/local/lib/node_modules/n8n/node_modules:/usr/local/lib/node_modules:/usr/local/node_modules"

# Revenir au répertoire de travail par défaut
WORKDIR /home/node

# Afficher les informations de debug au démarrage
RUN echo "NODE_PATH configuré: $NODE_PATH"

# L'utilisateur par défaut pour l'exécution
USER node