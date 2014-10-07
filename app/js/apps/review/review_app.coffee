@PullRequestsReviews.module 'ReviewApp', (ReviewApp, App, Backbone, Marionette, $, _) ->
  @startWithParent = false

  class ReviewApp.Router extends Marionette.AppRouter
    appRoutes:
      'pull-requests' : 'show'

  API =
    start: ->
      @route = new ReviewApp.Router
        controller: API

  ReviewApp.on 'start', ->
    API.start()