@Reviwr.module 'HeaderApp.Show', (Show, App, Backbone, Marionette, $, _) ->
  class Show.Controller extends Marionette.Controller
    initialize: ->
      @currentUser = App.request 'current:user'
      @layout = @getLayout()

      @listenTo @layout, 'show', =>
        App.execute 'when:fetched', @currentUser, =>
          @currentUserRegion()

        @logoRegion()

      App.headerRegion.show @layout

    logoRegion: ->
      logoView = @getLogoView()

      @listenTo logoView, 'logo:clicked', ->
        App.vent.trigger 'vist:home'

      @layout.logoRegion.show logoView

    currentUserRegion: ->
      currentUserView = @getCurrentUserView()
      @layout.currentUserRegion.show currentUserView

    getLayout: ->
      new Show.Layout()

    getLogoView: ->
      new Show.LogoView()

    getCurrentUserView: ->
      new Show.CurrentUserView
        model: @currentUser