# Use a Node.js base image
FROM node:16

# Set the working directory in the container
WORKDIR /usr/src/app

# Install WebUSB support (optional, if needed for your project)
RUN apt-get update && apt-get install -y \
    libusb-1.0-0-dev

# Install necessary dependencies for your app
COPY package*.json ./
RUN npm install

# Copy the source code into the container
COPY . .

# Expose the port your app will run on (default is 8080)
EXPOSE 8080

# Start the app (you'll be running an HTTP server to serve your website)
CMD ["npm", "start"]
