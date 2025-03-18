# 1단계: 빌드 환경 설정
FROM node:18-alpine AS builder
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

# 2단계: 프로덕션 환경 설정
FROM node:18-alpine
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY --from=builder /app/build ./build
COPY --from=builder /app/public ./public
COPY --from=builder /app/server.js ./server.js
EXPOSE 3000
CMD ["node", "server.js"]