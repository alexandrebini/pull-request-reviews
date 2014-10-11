@PullRequestsReviews.module 'ReviewApp.Line', (Line, App, Backbone, Marionette, $, _) ->
  class Line.Controller extends Marionette.Controller
    initialize: (line) ->
      @model = line
      @layout = @getLayout()

      @listenTo @layout, 'show', =>
        @markersRegion()
        @codeRegion()
        # @discussionRegion()
        @numbersRegion()

    getLayout: ->
      new Line.Layout()

    numbersRegion: ->
      view = @getNumberView()
      @layout.numbersRegion.show view

    markersRegion: ->
      view = @getMarkersView()
      @layout.markersRegion.show view

    codeRegion: ->
      view = @getCodeView()
      @layout.codeRegion.show view

    discussionRegion: ->
      view = @getDiscussionView()
      @layout.discussionsRegion.show view

    getMarkersView: ->
      App.request 'markers:wrapper', @model.get('reviews')

    getCodeView: ->
      new Line.CodeView
        model: @model

    getNumberView: ->
      new Line.NumberView
        model: @model

    getDiscussionView: ->
      App.request 'discussions:wrapper', @model.get('discussions')


  App.reqres.setHandler 'line:wrapper', (line) ->
    controller = new Line.Controller(line)
    controller.layout

  App.commands.setHandler 'line:start:discussion', (currentLine) ->
    currentLine.get('discussions').add new App.Entities.Discussion()
