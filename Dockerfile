FROM n8nio/n8n

WORKDIR /app
COPY . /app
RUN npm install pdf-parse pdf2pic pizzip docxtemplater

EXPOSE 5678

CMD ["node", "/app/src/index.js"]