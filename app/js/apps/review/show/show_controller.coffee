@PullRequestsReviews.module 'ReviewApp.Show', (Show, App, Backbone, Marionette, $, _) ->
  class Show.Controller extends Marionette.Controller
    initialize: (id) ->
      @layout = @getLayout()

      @listenTo @layout, 'show', ->
        console.log 'mimimimimimi'

      App.mainRegion.show @layout

    getLayout: ->
      new Show.Layout()