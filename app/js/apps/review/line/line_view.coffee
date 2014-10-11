@PullRequestsReviews.module 'ReviewApp.Line', (Line, App, Backbone, Marionette, $, _) ->
  class Line.Layout extends Marionette.LayoutView
    template: 'lines/layout'
    className: 'file-line'

    regions:
      numbersRegion: '.numbers-region'
      markersRegion: '.markers-region'
      codeRegion: '.code-region'
      discussionsRegion: '.discussions-region'

  class Line.CodeView extends Marionette.ItemView
    template: 'lines/code'
    className: 'file-line-code'
    modelEvents:
      'change:current': 'render'

  class Line.NumberView extends Marionette.ItemView
    template: 'lines/numbers'
    className: 'file-line-numbers'