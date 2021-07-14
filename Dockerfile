FROM node:alpine
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build
 
FROM nginx
#EXPOSE 80 Port Expo ased for EB to automatically map at 80
COPY --from=0 /app/build /usr/share/nginx/html