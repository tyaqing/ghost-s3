FROM ghost:5-alpine
# 切换到工作目录
WORKDIR $GHOST_INSTALL

# 安装ghos3包并配置S3存储适配器
RUN set -ex \
    && npm install ghos3 \
    && mkdir -p ./content/adapters/storage \
    && cp -r ./node_modules/ghos3/* ./content/adapters/storage/s3 \
    && rm -Rf node_modules package-lock.json package.json \
    && cd ./content/adapters/storage/s3 \
    && npm install \
    # 清理npm缓存以减小镜像大小
    && npm cache clean --force

# 确保目录权限正确
RUN chown -R node:node ./content
