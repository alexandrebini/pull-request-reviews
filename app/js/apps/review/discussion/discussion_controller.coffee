@PullRequestsReviews.module 'ReviewApp.Discussion', (Discussion, App, Backbone, Marionette, $, _) ->
  class Discussion.Controller extends Marionette.Controller
    initialize: (lineNumber) ->
      @collection = App.request 'discussions:entity', lineNumber
      @view = @discussionRegion()

    discussionRegion: ->
      view = @discussionView()
      view

    discussionView: ->
      new Discussion.DiscussionsView
        collection: @collection

  App.reqres.setHandler 'discussion:wrapper', (lineNumber) ->
    controller = new Discussion.Controller(lineNumber)
    controller.view