FROM node:20.11.1-alpine3.18 as base

ENV NODE_ENV=production
ENV YARN_VERSION=4.2.2
RUN corepack enable && corepack prepare yarn@${YARN_VERSION}

RUN mkdir /app
WORKDIR /app

COPY --chown=node . .

# BUILD STAGE
FROM base as build
RUN yarn install && yarn build

# DEPS STAGE
FROM base as deps
RUN yarn workspaces focus --production

# RUN STAGE
FROM node:20.11.1-alpine3.18

USER node
WORKDIR /app

COPY --from=deps --chown=node /app/node_modules ./node_modules
COPY --from=build --chown=node /app/.next ./.next
COPY --from=build --chown=node /app/package.json .


CMD [ "yarn", "start" ]