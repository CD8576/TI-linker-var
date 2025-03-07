# Use Node.js 16 base image
FROM node:16

# Set the working directory inside the container
WORKDIR /usr/src/app

# Install necessary dependencies for WebUSB support (if needed)
RUN apt-get update && apt-get install -y \
    libusb-1.0-0-dev

# Copy package.json and package-lock.json first to optimize caching
COPY package*.json ./

# Install dependencies defined in package.json
RUN npm install

# Copy the rest of the source code into the container
COPY . .

# Expose the port the app will run on
EXPOSE 8080

# Start the app using the start script in package.json
CMD ["npm", "start"]
