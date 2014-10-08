@PullRequestsReviews.module 'ReviewApp.Show', (Show, App, Backbone, Marionette, $, _) ->
  class Show.Controller extends Marionette.Controller
    initialize: (id) ->
      @layout = @getLayout()
      @pullRequest = App.request 'pull:request:entity', id

      App.execute 'when:fetched', @pullRequest, =>
        console.log 'pullRequest ', @pullRequest

      @listenTo @layout, 'show', ->
        console.log 'mimimimimimi'

      App.mainRegion.show @layout

    pullRequestRegion: ->
      filesView = @getFilesView()
      @layout.filesRegion.show filesView

    getLayout: ->
      new Show.Layout()

    getFilesView: ->
      new Show.FilesView
        collection: @pullRequest.get('files')