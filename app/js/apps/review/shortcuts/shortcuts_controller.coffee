@PullRequestsReviews.module 'ReviewApp.Shortcuts', (Shortcuts, App, Backbone, Marionette, $, _) ->
  class Shortcuts.Controller extends Marionette.Controller
    initialize: (pullRequest) ->
      console.log 'initialize'
      console.log pullRequest