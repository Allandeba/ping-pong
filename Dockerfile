FROM node:24-alpine

WORKDIR /app

ENV NODE_ENV=production \
    PORT=3000

COPY package.json package-lock.json ./
RUN npm ci --omit=dev && npm cache clean --force

COPY client/ ./client/
COPY server/ ./server/

EXPOSE 3000
USER node

HEALTHCHECK --interval=30s --timeout=5s --start-period=10s --retries=3 \
  CMD ["node", "-e", "fetch('http://127.0.0.1:' + process.env.PORT + '/api/config', { signal: AbortSignal.timeout(3000) }).then(response => process.exit(response.ok ? 0 : 1), () => process.exit(1))"]

CMD ["node", "./server/server.js"]
