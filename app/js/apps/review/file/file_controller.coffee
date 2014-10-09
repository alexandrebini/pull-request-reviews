@PullRequestsReviews.module 'ReviewApp.File', (File, App, Backbone, Marionette, $, _) ->
  class File.Controller extends Marionette.Controller
    initialize: (file) ->
      @model = file
      @collection = file.get('lines')

      @view = @fileRegion()

    fileRegion: ->
      fileView = @getFileView()

      _buildChildView = fileView.buildChildView
      fileView.buildChildView = (child, ChildViewClass, childViewOptions) ->
        if _.isEqual(File.EmptyView, ChildViewClass)
          _buildChildView(child, ChildViewClass, childViewOptions)
        else
          console.log child
          App.request 'line:wrapper', child

      fileView

    getFileView: ->
      new File.FileView
        model: @model
        collection: @collection

  App.reqres.setHandler 'file:wrapper', (file) ->
    controller = new File.Controller(file)
    controller.view