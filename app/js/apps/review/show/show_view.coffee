@PullRequestsReviews.module 'ReviewApp.Show', (Show, App, Backbone, Marionette, $, _) ->
  class Show.Layout extends Marionette.LayoutView
    template: 'review/show/layout'
    regions:
      fooRegion: '.foo'