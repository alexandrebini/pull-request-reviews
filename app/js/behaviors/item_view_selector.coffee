@PullRequestsReviews.module 'Behaviors', (Behaviors, App, Backbone, Marionette, $, _) ->
  class Behaviors.ItemViewSelector extends Marionette.Behavior
    modelEvents:
      'change:isSelected' : 'onChangeSelected'

    onChangeSelected: ->
      if @view.model.get('isSelected')
        @$el.addClass 'selected'
      else
        @$el.removeClass 'selected'