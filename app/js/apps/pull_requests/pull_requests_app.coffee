@PullRequestsReviews.module 'PullRequestsApp', (PullRequestsApp, App, Backbone, Marionette, $, _) ->
  @startWithParent = false

  class PullRequestsApp.Router extends Marionette.AppRouter
    appRoutes:
      '' : 'list'

  API =
    start: ->
      new PullRequestsApp.Router
        controller: API

    list: ->
      new PullRequestsApp.List.Controller()

  PullRequestsApp.on 'start', ->
    API.start()

  App.vent.on 'visit:pull:request', (id) ->
    App.vent.trigger 'visit', path: "/pull-requests/#{ id }/"
    App.vent.trigger 'pull:request:visited'