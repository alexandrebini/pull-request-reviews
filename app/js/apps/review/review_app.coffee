@PullRequestsReviews.module 'ReviewApp', (ReviewApp, App, Backbone, Marionette, $, _) ->
  @startWithParent = false

  class ReviewApp.Router extends Marionette.AppRouter
    appRoutes:
      'pull-requests/:id/' : 'show'

  API =
    start: ->
      new ReviewApp.Router
        controller: API

    show: (id) ->
      new ReviewApp.Show.Controller(id)

  ReviewApp.on 'start', ->
    API.start()