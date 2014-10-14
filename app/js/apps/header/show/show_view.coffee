@PullRequestsReviews.module 'HeaderApp.Show', (Show, App, Backbone, Marionette, $, _) ->
  class Show.Layout extends Marionette.LayoutView
    template: 'header/layout'
    className: 'container'
    regions:
      logoRegion: '.logo-region'
      currentUserRegion: '.current-user-region'

  class Show.LogoView extends Marionette.ItemView
    template: 'header/logo'
    tagName: 'a'
    className: 'logo'
    triggers:
      'click': 'logo:clicked'

  class Show.CurrentUserView extends Marionette.ItemView
    template: 'header/current_user'
    className: 'current-user'