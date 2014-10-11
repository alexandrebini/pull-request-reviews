@PullRequestsReviews.module 'ReviewApp.Show', (Show, App, Backbone, Marionette, $, _) ->
  class Show.Layout extends Marionette.LayoutView
    template: 'reviews/layout'
    regions:
      filesRegion: '.review_show'
      menuRegion: '.menu'

  class Show.FilesView extends Marionette.CollectionView
    childView: Marionette.ItemView
    className: 'files'

  class Show.DescriptionView extends Marionette.ItemView
    template: 'reviews/description'

  class Show.MenuItemView extends Marionette.ItemView
    template: 'reviews/menu_item'
    tagName: 'li'
    className: -> if @model.get('isSelected') then 'selected'
    modelEvents:
      'change:isSelected': 'render'
    triggers:
      'click': 'item:clicked'

  class Show.MenuView extends Marionette.CollectionView
    childView: Show.MenuItemView
    tagName: 'ul'