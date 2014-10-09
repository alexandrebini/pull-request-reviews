@PullRequestsReviews.module 'ReviewApp.Discussion', (Discussion, App, Backbone, Marionette, $, _) ->
  class Discussion.DiscussionView extends Marionette.ItemView
    template: 'discussion/show'
    tagName: 'li'

  class Discussion.DiscussionsView extends Marionette.CollectionView
    childView: Discussion.DiscussionView
    tagNmae: 'ul'