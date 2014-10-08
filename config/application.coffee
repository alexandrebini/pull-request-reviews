module.exports = (lineman) ->
  enableSass: true
  livereload: true
  enableAssetFingerprint: true

  haml:
    templates:
      options:
        target: 'js'
        language: 'coffee'
        includePath: true
      files: [
        {
          expand: true,
          cwd:    "app/templates",
          src:    ["**/*.haml"],
          dest:   "generated/template/",
          ext:    ".js"
        }
      ]

  removeTasks:
    common: ['less', 'handlebars', 'pages:dev', 'jst', 'jshint']
    dist: ['pages:dist', 'jshint']

  server:
    pushState: true
    apiProxy:
      enabled: false
      host: 'localhost'
      port: 3000
      prefix: 'api'