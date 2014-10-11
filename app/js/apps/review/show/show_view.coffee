@PullRequestsReviews.module 'ReviewApp.Show', (Show, App, Backbone, Marionette, $, _) ->
  class Show.Layout extends Marionette.LayoutView
    template: 'reviews/layout'
    regions:
      filesRegion: '.files_region'
      menuRegion: '.menu_region'
      nameRegion: '.name_region'
      repositoryRegion: '.repository_region'

  class Show.FilesView extends Marionette.CollectionView
    childView: Marionette.ItemView
    className: 'files'

  class Show.DescriptionView extends Marionette.ItemView
    template: 'reviews/description'

  class Show.MenuItemView extends Marionette.ItemView
    template: 'reviews/menu_item'
    tagName: 'li'
    className: -> if @model.get('isSelected') then 'selected'
    behaviors:
      ItemViewSelector: {}
    triggers:
      'click': 'item:clicked'

  class Show.MenuView extends Marionette.CollectionView
    childView: Show.MenuItemView
    tagName: 'ul'

  class Show.NameView extends Marionette.ItemView
    template: 'reviews/name'
    className: '.name'

  class Show.RepositoryView extends Marionette.ItemView
    template: 'reviews/name'
    className: '.repository'