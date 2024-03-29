@Reviwr.module 'ReviewApp.Line', (Line, App, Backbone, Marionette, $, _) ->
  class Line.Layout extends Marionette.LayoutView
    template: 'lines/layout'
    triggers:
      'click' : 'line:clicked'
    modelEvents:
      'change:current': 'onChangeCurrent'
    className: =>
      baseClass = 'line'
      switch @model.get('type')
        when 'addition' then "#{ baseClass} #{ baseClass }--addition"
        when 'deletion' then "#{ baseClass} #{ baseClass }--deletion"
        else baseClass

    regions:
      addDiscussionRegion: '.add-discussion-region'
      numbersRegion: '.numbers-region'
      markersRegion: '.markers-region'
      codeRegion: '.code-region'
      discussionsRegion: '.discussions-region'

    onChangeCurrent: ->
      if @model.get('current')
        @$el.addClass 'is-current'
      else
        @$el.removeClass 'is-current'

  class Line.CodeView extends Marionette.ItemView
    template: 'lines/code'
    className: 'line-code'
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
    className: 'line-numbers'

  class Line.AddDiscussionView extends Marionette.ItemView
    template: false
    tagName: 'a'
    className: 'add_discussion'

    triggers:
      'click' : 'addButton:clicked'