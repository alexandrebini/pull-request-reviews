@PullRequestsReviews.module 'ReviewApp.File', (File, App, Backbone, Marionette, $, _) ->
  class File.EmptyView extends Marionette.ItemView
    template: 'files/empty'

  class File.FileView extends Marionette.CompositeView
    childView: Marionette.ItemView
    template: 'files/show'
    childViewContainer: '.file-lines-container'
    tagName: 'section'
    className: 'file'