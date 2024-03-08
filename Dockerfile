# FROM node:18-alpine AS builder
# WORKDIR /app
# COPY package.json ./
# RUN npm install

# COPY . .
# RUN npm run build


FROM nginx:alpine as production-build
COPY nginx.conf /etc/nginx/nginx.conf
## Remove default nginx index page
RUN rm -rf /usr/share/nginx/html/*
# Copy from the stage 1
# COPY --from=builder /app/dist /usr/share/nginx/html/nested-app
COPY dist /usr/share/nginx/html/nested-app
# EXPOSE 8080
ENTRYPOINT ["nginx", "-g", "daemon off;"]