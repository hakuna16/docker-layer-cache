# Without using layed cache

FROM node:latest
WORKDIR /application
ADD . .
RUN yarn install
CMD node index.js


# With layed cache

FROM node:latest
WORKDIR /application
ADD package.json .
ADD yarn.lock .
RUN yarn install
ADD . .
CMD node index.js