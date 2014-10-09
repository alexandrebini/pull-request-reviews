@PullRequestsReviews.module 'PullRequestsApp.List', (List, App, Backbone, Marionette, $, _) ->
  class List.Layout extends Marionette.LayoutView
    template: 'pull_requests/list/layout'
    regions:
      listRegion: '.pull_requests'

  class List.PullRequestView extends Marionette.ItemView
    template: 'pull_requests/list/pull_request'
    triggers:
      'click': 'pull:request:clicked'

  class List.PullRequestsView extends Marionette.CollectionView
    childView: List.PullRequestView