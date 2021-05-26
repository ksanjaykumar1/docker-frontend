FROM node:alpine as builder

WORKDIR '/app'
#WORKDIR '/app'
COPY  package.json .

RUN npm install
RUN npm cache clean --force

# RUN npm config set unsafe-perm true

COPY   . .
# USER root
# ENV BABEL_DISABLE_CACHE 1
RUN chown -R root:node node_modules
RUN ls -l
RUN npm run build

FROM nginx

#copy file from /app/build the container from above
# nginx will serve static file in /usr/share/nginx/html
COPY --from=builder /app/build /usr/share/nginx/html

#default command for ngix will start it , so no need to start it






