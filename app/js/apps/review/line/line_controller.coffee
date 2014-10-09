@PullRequestsReviews.module 'ReviewApp.Line', (Line, App, Backbone, Marionette, $, _) ->
  class Line.Controller extends Marionette.Controller
    initialize: (line) ->
      @model = line
      @layout = @getLayout()

      @listenTo @layout, 'show', =>
        #@reviewRegion()
        #@codeRegion()
        #@discussionRegion()

    getLayout: ->
      new Line.Layout()

    reviewRegion: ->
      @getReviewView()

    codeRegion: ->
      view = @getCodeView()
      @layout.codeRegion.show view

    discussionRegion: ->
      view = @getDiscussionView()
      @layout.discussionsRegion.show view

    getReviewView: ->
      # console.log 'chamar aqui o review'

    getCodeView: ->
      new Line.CodeView
        model: @model

    getDiscussionView: ->
      console.log @model.get('discussions').first()
      #App.request 'discussions:wrapper', @model.get('discussions').first()

  App.reqres.setHandler 'line:wrapper', (line) ->
    controller = new Line.Controller(line)
    controller.layout

  App.commands.setHandler 'line:start:discussion', (currentLine) ->
    currentLine.get('discussions').add new App.Entities.Discussion()
