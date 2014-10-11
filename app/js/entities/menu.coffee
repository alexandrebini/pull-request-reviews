@PullRequestsReviews.module 'Entities', (Entities, App, Backbone, Marionette, $, _) ->
  class Entities.MenuItem extends Backbone.Model
    defaults:
      isSelected: false

  class Entities.Menu extends Backbone.Collection
    model: Entities.MenuItem

    select: (item) ->
      @each (model) ->
        model.set isSelected: model == item

  API =
    getMenu: ->
      items = [
        { name: 'Code', isSelected: true }
        { name: 'Description' }
      ]

      menu = new Entities.Menu(items)
      menu

  App.reqres.setHandler 'review:menu:entities', ->
    API.getMenu()