# @PullRequestsReviews.module 'ReviewApp.Discussion', (Discussion, App, Backbone, Marionette, $, _) ->
#   class Discussion.Controller extends Marionette.Controller
#     initialize: (discussion)->
#       #@collection = discussions
#       #@view = @discussionView()
#       # @model = discussion
#       # @layout = @getLayout()
#       # @listenTo @layout, 'show', =>
#       #   @discussionRegion()

#     getLayout: ->
#       new Discussion.Layout()

#     discussionRegion: ->
#       view = @getDiscussionView()
#       @layout.messageRegion.show view

#     getDiscussionView: ->
#       # new Discussion.DiscussionsView
#       #   collection: @collection
#       new Discussion.DiscussionView
#         model: @model

#   App.reqres.setHandler 'discussions:wrapper', (discussion) ->
#     controller = new Discussion.Controller(discussion)
#     controller.layout