@PullRequestsReviews.module 'ReviewApp.Show', (Show, App, Backbone, Marionette, $, _) ->
  class Show.Layout extends Marionette.LayoutView
    template: 'reviews/layout'
    regions:
      filesRegion: '.review_show'

  class Show.FilesView extends Marionette.CollectionView
    childView: Marionette.ItemView