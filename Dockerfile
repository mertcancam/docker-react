FROM node:alpine as builder
WORKDIR './app'
COPY ./package.json .
RUN npm install
COPY . .
RUN npm run build

# /app/build everything we care about is in there


FROM nginx:alpine
COPY --from=builder /app/build /usr/share/nginx/html
