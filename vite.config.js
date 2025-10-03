import { defineConfig } from 'vite'

export default defineConfig({
  root: '.',
  build: {
    outDir: 'dist',
    assetsDir: 'static',
    rollupOptions: {
      input: {
        main: './index.html',
        admin: './admin.html',
        display: './display.html',
        buzz: './buzz.html'
      }
    }
  },
  server: {
    port: 8888,
    open: true
  }
})
