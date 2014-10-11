@PullRequestsReviews.module 'ReviewApp.Marker', (Marker, App, Backbone, Marionette, $, _) ->
  class Marker.Maker extends Marionette.ItemView
    template: 'markers/marker'
    tagName: 'span'
    className: -> @model.get('type')

  class Marker.Makers extends Marionette.CompositeView
    childView: Marker.Maker
    template: 'markers/layout'
    childViewContainer: '.markers'

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