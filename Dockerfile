FROM node as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# /app/build <-- our Data to copy to nginx

FROM nginx as webapp
COPY --from=builder /app/build /usr/share/nginx/html

