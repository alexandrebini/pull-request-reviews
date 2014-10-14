@PullRequestsReviews.module 'ReviewApp.Marker', (Marker, App, Backbone, Marionette, $, _) ->
  class Marker.Maker extends Marionette.ItemView
    template: 'markers/marker'
    modelEvents:
      'change:type': 'render'

    setClassName: ->
      baseClass = 'line-marker'
      @$el.attr class: switch
        when @model.get('type') == 'accept' then "#{ baseClass } is-accepted"
        when @model.get('type') == 'reject' then "#{ baseClass } is-rejected"
        else baseClass

    onRender: ->
      @setClassName()

  class Marker.Makers extends Marionette.CompositeView
    childView: Marker.Maker
    template: 'markers/layout'
    className: 'line-markers'
    childViewContainer: 'div'

    initialize: ->
      @collection.checkClassName()

    ui:
      span: 'span'

    modelEvents:
      'change:className': 'changeClassAttributes'

    collectionEvents:
      'add': 'modelAdded'

    changeClassAttributes: ->
      @ui.span.removeAttr 'class'
      @ui.span.addClass @model.get('className')

    modelAdded: ->
      @collection.checkClassName()