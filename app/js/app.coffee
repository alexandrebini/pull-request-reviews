@Reviwr = do (Backbone, Marionette) ->
  App = new Marionette.Application

  App.on 'before:start', ->
    App.urlOptions = {}

  App.addRegions
    mainRegion: 'main'
    headerRegion: 'header'

  App.on 'start', (options) ->
    @startHistory()

  App.addInitializer ->
    App.module('HeaderApp').start()
    App.module('RepositoriesApp').start()
    App.module('PullRequestsApp').start()
    App.module('ReviewApp').start()

  App.commands.setHandler 'register:instance', (instance, id) ->
    App.register instance, id if App.environment is 'development'

  App.commands.setHandler 'unregister:instance', (instance, id) ->
    App.unregister instance, id if App.environment is 'development'

  App

$(document).ready ->
  Reviwr.start()