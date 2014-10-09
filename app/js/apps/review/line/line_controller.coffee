@PullRequestsReviews.module 'ReviewApp.Line', (Line, App, Backbone, Marionette, $, _) ->
  class Line.Controller extends Marionette.Controller
    initialize: (line) ->
      @model = line
      @layout = @getLayout()

      @listenTo @layout, 'show', =>
        @reviewRegion()
        @codeRegion()
        @discussionRegion()

    getLayout: ->
      new Line.Layout()

    reviewRegion: ->
      @getReviewView()

    codeRegion: ->
      view = @getCodeView()
      @layout.codeRegion.show view

    discussionRegion: ->
      @getDiscussionView()

    getReviewView: ->
      console.log 'chamar aqui o review'

    getCodeView: ->
      new Line.CodeView
        model: @model

    getDiscussionView: ->
      console.log 'chamar aqui a discussão'

  App.reqres.setHandler 'line:wrapper', (line) ->
    controller = new Line.Controller(line)
    controller.layout