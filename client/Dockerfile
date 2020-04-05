#use an existing docker image as base
FROM node:alpine as builder

WORKDIR '/app'

# Download and install a dependency
COPY package.json .
RUN npm install
COPY . .

# Tell the image what to do when it starts as a container
RUN npm run build

#nginx proces
FROM nginx
EXPOSE 3000
COPY ./nginx/default.conf /etc/nginx/conf.d/default.conf
COPY --from=builder /app/build /usr/share/nginx/html