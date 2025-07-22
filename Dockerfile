FROM n8nio/n8n

# Set working directory
WORKDIR /usr/src/app

# Copy package.json and install dependencies
COPY package.json ./
RUN npm install

# Expose the default n8n port
EXPOSE 5678

# Start n8n
CMD ["n8n"]