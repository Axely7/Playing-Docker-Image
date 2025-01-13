# FROM --platform=linux/amd64 node:19.2-alpine3.16
# FROM --platform=$BUILDPLATFORM node:19.2-alpine3.16
FROM node:19.2-alpine3.16

WORKDIR /app

# Copia este archivo al working directory: ./
COPY package.json ./

# Copia todo lo existente en mi archivo y lo pega en mi working directory, excluyendo lo que hay en el .dockerignore
COPY . .

RUN npm install

#Realizar testing
RUN npm run test

# Eliminar archivos y directorios no necesarios en PROD (-rf: recursivo forzado)
RUN rm -rf tests 
RUN rm -rf node_modules

# Unicamente las depdendencias de prod
RUN npm install --prod

CMD ["node", "app.js"]