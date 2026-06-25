#stage-1 ------deps
FROM node:20-slim AS deps
WORKDIR /app
COPY package*.json ./
RUN npm ci

#stage-2 ================= builder
FROM node:20-slim AS builder
WORKDIR /app
COPY --from=deps /app/node_modules ./node_modules
COPY . .
RUN npm run build

#stage-2 =========================runner
FROM node:20-slim AS runner
WORKDIR /app
ENV NODE_ENV=production
COPY --from=builder /app/public ./public
COPY --from=builder /app/.next/standalone ./
COPY --from=builder /app/.next/static ./static

EXPOSE 3000
CMD [ "node","server.js" ]



