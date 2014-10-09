@PullRequestsReviews.module 'ReviewApp.Show', (Show, App, Backbone, Marionette, $, _) ->
  class Show.Controller extends Marionette.Controller
    initialize: (pullRequest) ->
      @layout = @getLayout()
      @pullRequest = pullRequest

      @listenTo @layout, 'show', =>
        App.execute 'when:fetched', @pullRequest, =>
          @filesRegion()

      App.mainRegion.show @layout

    getLayout: ->
      new Show.Layout()

    filesRegion: ->
      filesView = @getFilesView()

      filesView.buildChildView = (child, ChildViewClass, childViewOptions) ->
        App.request 'file:wrapper', child

      @layout.filesRegion.show filesView

    getFilesView: ->
      new Show.FilesView
        collection: @pullRequest.get('files')
