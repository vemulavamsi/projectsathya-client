FROM --platform=linux/amd64 node:19-alpine as build-stage
# Install Angular CLI globally
RUN npm install -g @angular/cli
WORKDIR /app 
COPY package*.json ./
RUN npm install
COPY ./ .

# experimental copy
# COPY public/ ./public
# COPY src/ ./src
# COPY .env.qa .
# COPY nginx.conf .

RUN npm run build --omit=dev
FROM  --platform=linux/amd64 nginx:latest as production-stage 
RUN mkdir /app 
# COPY --from=build-stage /app/build /app 
COPY nginx.conf /etc/nginx/nginx.conf
