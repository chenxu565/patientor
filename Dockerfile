FROM node:20

WORKDIR /usr/src/app

# Copying the package.json files to the container
COPY package*.json ./

# Installing the dependencies for the backend
RUN npm ci

# Copying the rest of the files to the container
COPY . .

# Transpiling the TypeScript files to JavaScript
RUN npm run tsc

# Building the frontend
RUN cd patientor-frontend && npm ci && npm run build

# Copying the frontend build to the root of the project
RUN cp -r ./patientor-frontend/dist .

CMD ["npm", "start"]
