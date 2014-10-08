@PullRequestsReviews = do (Backbone, Marionette) ->
  App = new Marionette.Application

  App.on 'before:start', ->
    App.urlOptions = {}

  App.addRegions
    mainRegion: 'main'

  App.on 'start', (options) ->
    @startHistory()

  App.addInitializer ->
    App.module('ReviewApp').start()

  App.commands.setHandler 'register:instance', (instance, id) ->
    App.register instance, id if App.environment is 'development'

  App.commands.setHandler 'unregister:instance', (instance, id) ->
    App.unregister instance, id if App.environment is 'development'

  App