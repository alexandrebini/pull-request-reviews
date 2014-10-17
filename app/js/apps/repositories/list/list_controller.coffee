@Reviwr.module 'RepositoriesApp.List', (List, App, Backbone, Marionette, $, _) ->
  class List.Controller extends Marionette.Controller
    initialize: ->
      @layout = @getLayout()
      @repositories = App.request 'repository:entities'

      console.log @repositories

      # @listenTo @layout, 'show', =>
      #   App.execute 'when:fetched', @repositories, =>
      #     @repositoriesRegion()

      App.mainRegion.show @layout

    repositoriesRegion: ->
      repositoriesView = @getRepositoriesView()
      @layout.listRegion.show repositoriesView

    getLayout: ->
      new List.Layout()

    getRepositoriesView: ->
      new List.RepositoriesView
        collection: @repositories