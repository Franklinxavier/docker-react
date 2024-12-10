# BUILDING PHASE

FROM node:alpine as build

WORKDIR /app

COPY package.json .

RUN npm install

COPY . .

RUN npm run build


# RUNNING PHASE
FROM nginx

COPY --from=build /app/build /usr/share/nginx/html
