@PullRequestsReviews.module 'ReviewApp.Line', (Line, App, Backbone, Marionette, $, _) ->
  class Line.Layout extends Marionette.LayoutView
    template: 'lines/layout'
    className: 'line'

    regions:
      numbersRegion: '.numbers-region'
      markersRegion: '.markers-region'
      codeRegion: '.code-region'
      discussionsRegion: '.discussions-region'

  class Line.CodeView extends Marionette.ItemView
    template: 'lines/code'

  class Line.NumberView extends Marionette.ItemView
    template: 'lines/numbers'