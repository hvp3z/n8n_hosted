FROM n8nio/n8n:1.99.1

RUN npm install -g pdf-parse pdf2pic pizzip docxtemplater
RUN npm list -g
EXPOSE 5678
CMD ["n8n"]