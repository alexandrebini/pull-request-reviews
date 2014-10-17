@Reviwr.module 'Helpers', (Helpers, App, Backbone, Marionette, $, _) ->
  class Helpers.Url
    @getInstance: -> @_instance ?= new @(arguments...)

    urlFor: (route) ->
      route = '/' unless route?
      return route if route.match(/^http:|https:/)
      route = "/#{ route }" if route.slice(0) isnt '/'
      route = "#{ route }/" if route.slice(-1) isnt '/'
      route = route.replace(/\/\//g, '/')
      route

    currentPath: ->
      @urlFor Backbone.history.fragment