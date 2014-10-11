@PullRequestsReviews.module 'ReviewApp.Marker', (Marker, App, Backbone, Marionette, $, _) ->
  class Marker.Maker extends Marionette.CompositeView
    template: 'markers/marker'
    tagName: 'li'
    modelEvents:
      'change:type': 'render'
    className: -> @model.get('type')

  class Marker.Makers extends Marionette.CompositeView
    childView: Marker.Maker
    template: 'markers/layout'
    childViewContainer: 'ul'