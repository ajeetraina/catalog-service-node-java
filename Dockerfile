# Use Node.js LTS version
FROM node:18-slim

# Set working directory
WORKDIR /usr/src/app

# Copy package files
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy application source
COPY . .

# Create non-root user for security
RUN groupadd -r catalog && \
    useradd -r -g catalog catalog && \
    chown -R catalog:catalog /usr/src/app

USER catalog

# Expose service port
EXPOSE 3000

# Start the service
CMD ["npm", "start"]