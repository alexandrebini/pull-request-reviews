@PullRequestsReviews.module 'ReviewApp.Marker', (Marker, App, Backbone, Marionette, $, _) ->
  class Marker.Maker extends Marionette.ItemView
    template: 'markers/marker'
    modelEvents:
      'change:type': 'render'

    setClassName: ->
      baseClass = 'file-line-marker'
      @$el.attr class: switch
        when @model.get('type') == 'accept' then "#{ baseClass } is-accepted"
        when @model.get('type') == 'reject' then "#{ baseClass } is-rejected"
        else baseClass

    onRender: ->
      @trigger 'review:changed'
      @setClassName()

  class Marker.Makers extends Marionette.CompositeView
    childView: Marker.Maker
    template: 'markers/layout'
    childViewContainer: 'div'

    className: ->
      "#{ @collection.className() } file-line-markers"

    collectionEvents:
      'add': 'modelAdded'

    modelAdded: ->
      @$el.removeAttr 'class'
      @$el.addClass @className()