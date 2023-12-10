FROM --platform=linux/amd64 node:19-alpine as build-stage
# Install Angular CLI globally
RUN npm install -g @angular/cli

ARG NODE_PACKAGE=node-v$NODE_VERSION-linux-x64
ARG NODE_HOME=/opt/$NODE_PACKAGE

ENV NODE_PATH $NODE_HOME/lib/node_modules
ENV PATH $NODE_HOME/bin:$PATH
RUN curl https://nodejs.org/dist/v$NODE_VERSION/$NODE_PACKAGE.tar.gz | tar -xzC /opt/
WORKDIR /app 
COPY package*.json ./
RUN npm install
COPY ./ .

# experimental copy
# COPY public/ ./public
# COPY src/ ./src
# COPY .env.qa .
# COPY nginx.conf .

# RUN npm run build --omit=dev
# FROM  --platform=linux/amd64 nginx:latest as production-stage 
# RUN mkdir /app 
# COPY --from=build-stage /app/build /app 
ENV PORT=80

EXPOSE ${PORT}
COPY nginx.conf /etc/nginx/nginx.conf
CMD ["ng", "serve", "--host", "0.0.0.0", "--port", "80"]
