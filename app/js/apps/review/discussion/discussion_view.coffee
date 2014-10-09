@PullRequestsReviews.module 'ReviewApp.Discussion', (Discussion, App, Backbone, Marionette, $, _) ->
  class Discussion.Layout extends Marionette.Layout
    template: 'discussions/layout'
    className: 'discussion'

    regions:
      formRegion: '.form-region'
      messageRegion: '.message-region'

  class Discussion.DiscussionView extends Marionette.ItemView
    template: 'discussion/show'
    tagName: 'li'

  class Discussion.DiscussionsView extends Marionette.CollectionView
    childView: Discussion.DiscussionView
    tagName: 'ul'
    className: 'discussion'