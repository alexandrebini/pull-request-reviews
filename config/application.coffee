module.exports = (lineman) ->
  enableSass: true
  livereload: true
  enableAssetFingerprint: true

  jst:
    compile:
      files:
        'generated/template/haml.js': "app/generated/templates/**/*.html"

  appendTasks:
    common: ['haml', 'jst']

  removeTasks:
    common: ['less', 'pages:dev']
    dist: ['pages:dist']

  server:
    apiProxy:
      enabled: false,
      host: 'localhost'
      port: 3000