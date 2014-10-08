@PullRequestsReviews.module 'ReviewApp.Show', (Show, App, Backbone, Marionette, $, _) ->
  class Show.Controller extends Marionette.Controller
    initialize: (id) ->
      @layout = @getLayout()
      @pullRequest = App.request 'pull:request:entity', id


      @listenTo @layout, 'show', =>
        App.execute 'when:fetched', @pullRequest, =>
          @pullRequestRegion()

      App.mainRegion.show @layout

    getLayout: ->
      new Show.Layout()

    pullRequestRegion: ->
      filesView = @getFilesView()
      @layout.filesRegion.show filesView

    getFilesView: ->
      new Show.FilesView
        collection: @pullRequest.get('files')