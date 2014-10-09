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

      _buildChildView = filesView.buildChildView
      filesView.buildChildView = (child, ChildViewClass, childViewOptions) ->
        if _.isEqual(Show.EmptyView, ChildViewClass)
          _buildChildView(child, ChildViewClass, childViewOptions)
        else
          App.request 'file:wrapper', child

      @layout.filesRegion.show filesView

    getFilesView: ->
      new Show.FilesView
        collection: @pullRequest.get('files')
