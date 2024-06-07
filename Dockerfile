FROM node:18-alpine as builder
RUN apk add python3 make gcc libc-dev g++ py3-setuptools
RUN mkdir -p /home/node/app/node_modules && chown -R node:node /home/node/app
USER node
WORKDIR /home/node/app
RUN echo$(node --max_old_space_size=1024 /usr/local/bin/npm install n8n@1.14.1 --loglevel verbose)

FROM node:18-alpine
COPY --from=builder /home/node/ /home/node/
COPY docker-entrypoint.sh /
WORKDIR /home/node
RUN  \
   mkdir /home/node/.n8n && \
   chown node:node /home/node/.n8n
ENV SHELL /bin/sh
USER node
WORKDIR /home/node/app/node_modules/n8n/bin
ENTRYPOINT ["tini", "--", "/docker-entrypoint.sh"]
