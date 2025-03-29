FROM ghost:5-alpine


ENV storage__active s3


RUN npm install --prefix /tmp/ghos3 ghos3 && \
    cp -r /tmp/ghos3/node_modules/ghos3 current/core/server/adapters/storage/s3 && \
    rm -r /tmp/ghos3
