@PullRequestsReviews.module 'ReviewApp.Marker', (Marker, App, Backbone, Marionette, $, _) ->
  class Marker.Maker extends Marionette.CompositeView
    template: false
    tagName: 'span'
    className: ->
      @model.get('type')

  class Marker.Makers extends Marionette.CompositeView
    childView: Marker.Maker
    template: 'markers/layout'
    childViewContainer: '.marker-region'