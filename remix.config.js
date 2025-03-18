/** @type {import('@remix-run/dev').AppConfig} */
export default {
  // 특정 패턴의 파일을 라우트로 인식하지 않도록 설정 (숨김 파일 무시)
  ignoredRouteFiles: ['**/.*'],

  // 서버 모듈 형식을 ES 모듈로 설정
  serverModuleFormat: 'esm',

  // 서버 플랫폼을 Node.js로 설정
  serverPlatform: 'node',

  // Tailwind CSS 통합 활성화
  tailwind: true,

  // PostCSS 처리 활성화
  postcss: true,

  // 변경 시 자동으로 다시 빌드할 파일 경로 지정
  watchPaths: ['./tailwind.config.ts'],

  // 개발 서버 설정
  dev: {
    // 개발 서버가 사용할 포트 번호
    port: 3000,
  },
}
