FROM node:18-alpine AS builder
WORKDIR '/src/app'
COPY  package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
EXPOSE 80
COPY --from=builder /src/app/build /usr/share/nginx/html

