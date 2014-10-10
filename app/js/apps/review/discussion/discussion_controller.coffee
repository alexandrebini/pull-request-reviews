@PullRequestsReviews.module 'ReviewApp.Discussion', (Discussion, App, Backbone, Marionette, $, _) ->
  class Discussion.Controller extends Marionette.Controller
    initialize: (discussions) ->
      @collection = discussions
      @view = @discussionView()

      @listenTo @view, 'childview:cancelButton:clicked', (child) =>
        console.log child

      @listenTo @view, 'childview:deleteButton:clicked', (child) =>
        child.destroy()

      @listenTo @view, 'childview:sendButton:clicked', (child) =>
        console.log child

    discussionView: ->
      new Discussion.DiscussionsView
        collection: @collection

  App.reqres.setHandler 'discussions:wrapper', (discussions) ->
    controller = new Discussion.Controller(discussions)
    controller.view