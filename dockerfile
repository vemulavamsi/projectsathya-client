
# FROM node:14.16.0
# # Install Angular CLI globally
# RUN npm install -g @angular/cli
# WORKDIR /app 
# COPY package*.json ./
# RUN npm install
# COPY ./ .

# # experimental copy
# # COPY public/ ./public
# # COPY src/ ./src
# # COPY .env.qa .
# # COPY nginx.conf .

# RUN npm run build --omit=dev
# FROM  --platform=linux/amd64 nginx:latest as production-stage 
# RUN mkdir /app 
# # COPY --from=build-stage /app/build /app 
# # COPY nginx.conf /etc/nginx/nginx.conf
# # Expose port 80 for the Angular app
# EXPOSE 80
# # Start the Angular app
# CMD ["ng", "serve", "--host", "0.0.0.0", "--port", "80"]

# Build Stage
FROM node:14.16.0 AS build-stage

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
# RUN ng build --prod

# Production Stage
FROM nginx:latest as production-stage

WORKDIR /usr/share/nginx/html

# Copy the built app from the build stage
COPY --from=build-stage /app/dist/out .

# Expose port 80 for the Angular app
EXPOSE 80

# The default command to start nginx
CMD ["nginx", "-g", "daemon off;"]
