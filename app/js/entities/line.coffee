@PullRequestsReviews.module 'Entities', (Entities, App, Backbone, Marionette, $, _) ->
  class Entities.Line extends Backbone.Model
    parse: (response) ->
      @set
        reviews: new Entities.Reviews(response.reviews, parse: true)
        discussions: new Entities.Discussions(response.discussions, parse: true)

      delete response.reviews
      delete response.discussions

      response

  class Entities.Lines extends Backbone.Collection
    model: Entities.Line
