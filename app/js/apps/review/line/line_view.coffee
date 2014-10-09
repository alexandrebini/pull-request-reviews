@PullRequestsReviews.module 'ReviewApp.Line', (Line, App, Backbone, Marionette, $, _) ->
  class Line.Layout extends Marionette.LayoutView
    template: 'lines/layout'

    regions:
      reviewRegion: '.review-region'
      codeRegion: '.code-region'
      discussionsRegion: '.discussions-region'

  class Line.CodeView extends Marionette.ItemView
    template: 'lines/code'
