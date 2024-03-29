@Reviwr.module 'ReviewApp.Discussion', (Discussion, App, Backbone, Marionette, $, _) ->
  class Discussion.Controller extends Marionette.Controller
    initialize: (discussions) ->
      @collection = discussions
      @view = @discussionRegion()

    discussionRegion: ->
      return if @collection.isEmpty()

      view = @getDiscussionView()

      @listenTo view, 'childview:editButton:clicked', (child) =>
        child.editMessage()

      @listenTo view, 'childview:form:submit', (child) =>

      @listenTo view, 'childview:cancelButton:clicked', (child) =>
        child.abortEditMessage()

      @listenTo view, 'childview:deleteButton:clicked', (child) =>
        @collection.remove child.model

      view

    getDiscussionView: ->
      new Discussion.DiscussionsView
        collection: @collection

  App.reqres.setHandler 'discussions:wrapper', (discussions) ->
    controller = new Discussion.Controller(discussions)
    controller.view