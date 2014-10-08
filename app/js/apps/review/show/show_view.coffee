@PullRequestsReviews.module 'ReviewApp.Show', (Show, App, Backbone, Marionette, $, _) ->
  class Show.Layout extends Marionette.LayoutView
    template: 'review/show/layout'
    regions:
      fooRegion: '.foo'

  class Show.FileView extends Marionette.ItemView
    template: 'review/show/file'

  class Show.FilesView extends Marionette.CollectionView
    childView: Show.FileView