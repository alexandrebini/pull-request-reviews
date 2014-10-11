@PullRequestsReviews.module 'ReviewApp.Line', (Line, App, Backbone, Marionette, $, _) ->
  class Line.Layout extends Marionette.LayoutView
    template: 'lines/layout'
    className: 'file-line'

    regions:
      addDiscussionRegion: '.add-discussion-region'
      numbersRegion: '.numbers-region'
      markersRegion: '.markers-region'
      codeRegion: '.code-region'
      discussionsRegion: '.discussions-region'

  class Line.CodeView extends Marionette.ItemView
    template: 'lines/code'
    className: 'file-line-code'
    modelEvents:
      'change:current': 'render onChangeCurrent'

    onChangeCurrent: ->
      if @model.get('current') && !@isVisible()
        $(window).scrollTop(@$el.offset().top)

    isVisible: ->
      documentViewTop = $(window).scrollTop()
      documentViewBottom = documentViewTop + $(window).height()
      elementTop = @$el.offset().top
      elementBottom = elementTop + @$el.height()
      (elementBottom <= documentViewBottom) && (elementTop >= documentViewTop)

  class Line.NumberView extends Marionette.ItemView
    template: 'lines/numbers'
    className: 'file-line-numbers'

  class Line.AddDiscussionView extends Marionette.ItemView
    template: 'lines/add_discussion'
    tagName: 'a'
    className: '.add_discussion'

    triggers:
      'click' : 'addButton:clicked'