@PullRequestsReviews.module 'ReviewApp.Marker', (Marker, App, Backbone, Marionette, $, _) ->
  class Marker.Controller extends Marionette.Controller
    initialize: (reviews) ->
      console.log reviews
      @collection = reviews
      @view = @markersRegion()

    markersRegion: ->
      @getMarkersView()

    getMarkersView: ->
      new Marker.Makers
        model: @collection.status
        collection: @collection

  App.reqres.setHandler 'markers:wrapper', (reviews) ->
    marker = new Marker.Controller(reviews)
    marker.view