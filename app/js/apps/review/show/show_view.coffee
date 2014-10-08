@PullRequestsReviews.module 'ReviewApp.Show', (Show, App, Backbone, Marionette, $, _) ->
  class Show.Layout extends Marionette.LayoutView
    template: 'review/show/layout'
    regions:
      filesRegion: '.files'

  class Show.FileView extends Marionette.CompositeView
    template: 'review/show/file_layout'
    childViewContainer: 'lines_content'

  class Show.FilesView extends Marionette.CollectionView
    childView: Show.FileView