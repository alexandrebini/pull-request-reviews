@PullRequestsReviews.module 'ReviewApp', (ReviewApp, App, Backbone, Marionette, $, _) ->
  @startWithParent = false

  class ReviewApp.Router extends Marionette.AppRouter
    appRoutes:
      '/pull-requests/:id/' : 'show'

  API =
    start: ->
      new ReviewApp.Router
        controller: API

    show: (id) ->
      @pullRequest = App.request 'pull:request:entity', id
      @showControler.destroy() if @controller?
      @showController = new ReviewApp.Show.Controller(@pullRequest)
      App.vent.trigger 'pull:request:visited', @pullRequest

    shortcuts: (pullRequest) ->
      @shortcutsControler.destroy() if @controller?
      @shortcutsController = new ReviewApp.Shortcuts.Controller(@pullRequest)

  ReviewApp.on 'start', ->
    API.start()

  App.vent.on 'pull:request:visited', (pullRequest) ->
    console.log 'pul request visited'