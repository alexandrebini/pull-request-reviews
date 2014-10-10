@PullRequestsReviews.module 'ReviewApp.Discussion', (Discussion, App, Backbone, Marionette, $, _) ->
  class Discussion.DiscussionView extends Marionette.ItemView
    template: 'discussion/show'
    tagName: 'li'
    ui:
      cancelButton: 'a.cancel'
      sendButton: 'a.send'
      deleteButton: 'a.delete'
      message: 'p.message'
      form: 'form'
    triggers:
      'click @ui.cancelButton' : 'cancelButton:clicked'
      'click @ui.sendButton' : 'sendButton:clicked'
      'click @ui.deleteButton' : 'deleteButton:clicked'

  class Discussion.DiscussionsView extends Marionette.CollectionView
    childView: Discussion.DiscussionView
    tagName: 'ul'
    className: 'discussion'