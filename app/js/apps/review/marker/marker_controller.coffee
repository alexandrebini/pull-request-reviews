@Reviwr.module 'ReviewApp.Marker', (Marker, App, Backbone, Marionette, $, _) ->
  class Marker.Controller extends Marionette.Controller
    initialize: (review) ->
      @collection = review
      @view = @markersRegion()

    markersRegion: ->
      view = @getMarkersView()

      @listenTo view, 'childview:review:changed', (args) ->
        view.modelAdded()

      view

    getMarkersView: ->
      new Marker.Makers
        collection: @collection

  App.reqres.setHandler 'markers:wrapper', (reviews) ->
    marker = new Marker.Controller(reviews)
    marker.view