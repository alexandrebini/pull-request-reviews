@PullRequestsReviews.module 'ReviewApp.Line', (Line, App, Backbone, Marionette, $, _) ->
  class Line.Layout extends Marionette.LayoutView
    template: 'lines/layout'
    className: 'line'

    regions:
      addDiscussionRegion: '.add-discussion-region'
      numbersRegion: '.numbers-region'
      markersRegion: '.markers-region'
      codeRegion: '.code-region'
      discussionsRegion: '.discussions-region'

  class Line.CodeView extends Marionette.ItemView
    template: 'lines/code'
    modelEvents:
      'change:current': 'render'

  class Line.NumberView extends Marionette.ItemView
    template: 'lines/numbers'

  class Line.AddDiscussionView extends Marionette.ItemView
    template: 'lines/add_discussion'
    tagName: 'a'
    className: '.add_discussion'

    triggers:
      'click' : 'addButton:clicked'