@PullRequestsReviews = do (Backbone, Marionette) ->
  App = new Marionette.Application

  App.addRegions
    mainRegion: 'main'

  App.on 'start', (options) ->
    @startHistory()

  App.addInitializer ->
    console.log 'fooooooo'

  App.commands.setHandler 'register:instance', (instance, id) ->
    App.register instance, id if App.environment is 'development'

  App.commands.setHandler 'unregister:instance', (instance, id) ->
    App.unregister instance, id if App.environment is 'development'

  App