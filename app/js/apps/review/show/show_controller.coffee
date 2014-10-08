@PullRequestsReviews.module 'ReviewApp.Show', (Show, App, Backbone, Marionette, $, _) ->
  class Show.Controller extends Marionette.Controller
    initialize: (pullRequest) ->
      @layout = @getLayout()
      @pullRequest = pullRequest


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