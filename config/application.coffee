module.exports = (lineman) ->
  enableSass: true
  livereload: true
  enableAssetFingerprint: true
  server:
    apiProxy:
      enabled: false
      host: 'localhost'
      port: 3000