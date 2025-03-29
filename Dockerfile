# FROM ghost:5-alpine AS ghost-base

FROM ghost:5.5.0-alpine AS  ghost-base

RUN npm install --prefix /tmp/ghos3 ghos3 && \
    cp -r /tmp/ghos3/node_modules/ghos3 current/core/server/adapters/storage/s3 && \
    rm -r /tmp/ghos3
