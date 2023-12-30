FROM node:21-alpine as builder
WORKDIR /app
COPY package*.json .
RUN npm install
COPY . .
RUN npx browserslist@latest --update-db
RUN npm run build
CMD ["npm", "run", "start"]

# FROM nginx:1.25-alpine
# WORKDIR /usr/share/nginx/html
# RUN rm -f ./*
# COPY --from=builder /app/build .
# EXPOSE 80
# CMD ["nginx", "-g", "daemon off;"]