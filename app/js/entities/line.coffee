@PullRequestsReviews.module 'Entities', (Entities, App, Backbone, Marionette, $, _) ->
  class Entities.Line extends Backbone.Model
    defaults:
      current: false

    mutators:
      reviewed: ->
        @get('reviews').length > 0

      currentDiscuss: ->
        @get('discussions').last()

    parse: (response) ->
      @set
        reviews: new Entities.Reviews(response.reviews, parse: true)
        discussions: new Entities.Discussions(response.discussions, parse: true)

      delete response.reviews
      delete response.discussions

      response

    accept: ->
      @get('reviews').accept()

    reject: ->
      @get('reviews').reject()

  class Entities.Lines extends Backbone.Collection
    model: Entities.Line
