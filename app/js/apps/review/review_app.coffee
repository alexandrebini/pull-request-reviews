@Reviwr.module 'ReviewApp', (ReviewApp, App, Backbone, Marionette, $, _) ->
  @startWithParent = false

  class ReviewApp.Router extends Marionette.AppRouter
    appRoutes:
      'pull-requests/:id/' : 'show'

  API =
    start: ->
      new ReviewApp.Router
        controller: API

    show: (id) ->
      pullRequest = App.request 'pull:request:entity', id
      @showControler.destroy() if @showControler?
      @showController = new ReviewApp.Show.Controller(pullRequest)
      App.vent.trigger 'pull:request:visited', pullRequest

    shortcuts: (pullRequest) ->
      @shortcutsControler.destroy() if @shortcutsControler?
      @shortcutsController = new ReviewApp.Shortcuts.Controller(pullRequest)

  ReviewApp.on 'start', ->
    API.start()

  App.vent.on 'visit:pull:request', (id) ->
    App.vent.trigger 'visit', path: "/pull-requests/#{ id }/"
    API.show(id)

  App.vent.on 'pull:request:visited', (pullRequest) ->
    API.shortcuts(pullRequest)