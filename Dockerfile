# 1단계: 빌드 환경 설정
FROM node:18-alpine AS builder
# Node.js 18 Alpine 이미지를 기반으로 builder 스테이지 생성
WORKDIR /app
# 작업 디렉토리를 /app으로 설정
COPY package*.json ./
# package.json과 package-lock.json 파일을 복사
RUN npm install
# 의존성 패키지 설치
COPY . .
# 현재 디렉토리의 모든 파일을 컨테이너로 복사
RUN npm run build
# Remix 애플리케이션 빌드 실행

# 2단계: 프로덕션 환경 설정
FROM node:18-alpine
# 새로운 Node.js 18 Alpine 이미지로 프로덕션 스테이지 시작
WORKDIR /app
# 작업 디렉토리를 /app으로 설정
COPY package*.json ./
# package.json과 package-lock.json 파일을 복사
RUN npm install
# 프로덕션 의존성 패키지 설치
COPY --from=builder /app/build ./build
# 빌더 스테이지에서 빌드된 파일 복사
COPY --from=builder /app/public ./public
# 정적 파일이 있는 public 디렉토리 복사
COPY --from=builder /app/server.js ./server.js
# Express 서버 파일 복사
EXPOSE 3000
# 3000번 포트 노출 (애플리케이션 실행 포트)
CMD ["node", "server.js"]
# 컨테이너 시작 시 서버 실행 명령어