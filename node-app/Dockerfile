FROM node:alpine 

# Create app directory
WORKDIR /app

COPY . . 

# Install app dependencies
RUN npm install

# Expose the port the app will run on
EXPOSE 3000 

# Start Node.js application
CMD [ "node" , "index.js"]