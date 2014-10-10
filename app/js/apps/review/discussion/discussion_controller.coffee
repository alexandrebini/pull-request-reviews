@PullRequestsReviews.module 'ReviewApp.Discussion', (Discussion, App, Backbone, Marionette, $, _) ->
  class Discussion.Controller extends Marionette.Controller
    initialize: (discussions) ->
      @collection = discussions
      @view = @discussionView()

    discussionView: ->
      new Discussion.DiscussionsView
        collection: @collection

  App.reqres.setHandler 'discussions:wrapper', (discussions) ->
    controller = new Discussion.Controller(discussions)
    controller.view