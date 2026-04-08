FROM node:20-alpine AS builder
WORKDIR /app
COPY pack*.json ./
RUN npm install
COPY . .

FROM node:20-alpine AS runtime
WORKDIR /app

RUN addgroup -S appgroup && adduser -S appuser -G appgroup

COPY --from=builder /app/node_modules ./node_modules
COPY --from=builder /app/index.js ./index.js
COPY --from=builder /app/package.json ./package.json

USER appuser
EXPOSE 3000

HEALTHCHECK --interval=30s --timeout=5s \
    CMD wget -qo- http://localhost:3000/health || exit 1
CMD ["node", "index.js"]