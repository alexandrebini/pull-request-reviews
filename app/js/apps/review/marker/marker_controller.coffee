@PullRequestsReviews.module 'ReviewApp.Marker', (Marker, App, Backbone, Marionette, $, _) ->
  class Marker.Controller extends Marionette.Controller
    initialize: (review) ->
      console.log review
      @collection = review
      @view = @markersRegion()

    markersRegion: ->
      @getMarkersView()

    getMarkersView: ->
      new Marker.Makers
        collection: @collection

  App.reqres.setHandler 'markers:wrapper', (review) ->
    marker = new Marker.Controller(review)
    marker.view