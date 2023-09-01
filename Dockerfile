
# Use Node.js v14
FROM node:14

# Set environment variable to avoid hanging during npm install
ENV NPM_CONFIG_PROGRESS=false

# Create app directory
WORKDIR /usr/src/index

# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
COPY package*.json ./

# Install dependencies using npm ci for better caching and reproducibility
RUN npm i

# Bundle app source
COPY . .

# Expose the port
EXPOSE 3000

# Start the application
CMD [ "node", "src/index.js" ]
