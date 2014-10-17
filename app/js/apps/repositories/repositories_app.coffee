@Reviwr.module 'RepositoriesApp', (RepositoriesApp, App, Backbone, Marionette, $, _) ->
  @startWithParent = false

  class RepositoriesApp.Router extends Marionette.AppRouter
    appRoutes:
      '' : 'list'

  API =
    start: ->
      new RepositoriesApp.Router
        controller: API

    list: ->
      new RepositoriesApp.List.Controller()

  RepositoriesApp.on 'start', ->
    API.start()