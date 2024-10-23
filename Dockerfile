# Use the official Node.js image as the base
FROM node:18

# Set the working directory
WORKDIR /app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code
COPY . .

# Build the Nest.js application
RUN npm run build

# Copy environment-specific .env file
ARG ENVIRONMENT
COPY .env.$ENVIRONMENT .env

# Expose the port the app runs on
EXPOSE 3003

# Define the command to run the app
CMD ["npm", "run", "start:prod"]
