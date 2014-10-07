do (Marionette) ->
  _.extend Marionette.Renderer,

  render: (templateName, data) ->
    return unless templateName
    path = @getTemplate(templateName)
    throw "Template #{ templateName } not found!" unless path
    path(data)

  getTemplate: (templateName) ->
    path = "app/templates/#{ templateName }"
    return JST[path] if JST[path]