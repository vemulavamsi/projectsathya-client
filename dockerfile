FROM node:14.16.0 AS build-stage
ARG NODE_VERSION=14.16.0
ARG NODE_PACKAGE=node-v$NODE_VERSION-linux-x64
ARG NODE_HOME=/opt/$NODE_PACKAGE

ENV NODE_PATH $NODE_HOME/lib/node_modules
ENV PATH $NODE_HOME/bin:$PATH
WORKDIR /app

# Install Angular CLI globally
RUN npm install -g @angular/cli

# Copy package files
COPY package*.json ./

# Install app dependencies
RUN npm install

# Copy the rest of the application code
COPY . .

# Build the Angular app
RUN npm run build -- --output-path=./dist/out
#RUN npm run build
# Production Stage
FROM nginx:latest as production-stage

# Install Angular CLI globally in the production image
RUN apt-get update && \
    apt-get install -y npm && \
    npm install -g @angular/cli
# Create a directory to store the built app
#WORKDIR /usr/share/nginx/html
WORKDIR /app

# Copy the built app from the build stage
COPY --from=build-stage /app/dist/out .
# COPY nginx.conf /etc/nginx/nginx.conf

# Expose port 80 for the Angular app
EXPOSE 80

# # The default command to start nginx
# #CMD ["nginx", "-g", "daemon off", "ng","serve"]
CMD ["nginx", "-g", "daemon off;"]