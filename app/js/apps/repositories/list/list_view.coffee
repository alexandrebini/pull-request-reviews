@Reviwr.module 'RepositoriesApp.List', (List, App, Backbone, Marionette, $, _) ->
  class List.Layout extends Marionette.LayoutView
    template: 'repositories/layout'
    regions:
      listRegion: '.repositories'

  class List.RepositoryView extends Marionette.ItemView
    template: 'repositories/show'

  class List.RepositoriesView extends Marionette.CollectionView
    childView: List.RepositoryView