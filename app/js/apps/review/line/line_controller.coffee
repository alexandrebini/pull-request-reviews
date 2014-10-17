@Reviwr.module 'ReviewApp.Line', (Line, App, Backbone, Marionette, $, _) ->
  class Line.Controller extends Marionette.Controller
    initialize: (line) ->
      @model = line
      @layout = @getLayout()

      @listenTo @layout, 'show', =>
        @addDiscussionRegion()
        @markersRegion()
        @codeRegion()
        @discussionRegion()
        @numbersRegion()

    getLayout: ->
      layout = new Line.Layout(model: @model)
      @listenTo layout, 'line:clicked', (args) =>
        @model.set current: true
      layout

    addDiscussionRegion: ->
      view = @getAddDiscussionView()

      @listenTo view, 'addButton:clicked', (args) =>
        App.execute 'line:start:discussion', @model

      @layout.addDiscussionRegion.show view

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

    getAddDiscussionView: ->
      new Line.AddDiscussionView()

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
    #if currentLine.get('currentDiscuss') && currentLine.get('currentDiscuss').get('hasMessage')