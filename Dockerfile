FROM ghost:5.114.1 AS ghost-base

RUN npm config set registry https://registry.npmmirror.com && \
    npm install --prefix /tmp/ghos3 ghos3 && \
    cp -r /tmp/ghos3/node_modules/ghos3 /var/lib/ghost/current/core/server/adapters/storage/s3 && \
    rm -r /tmp/ghos3
