@PullRequestsReviews.module 'Entities', (Entities, App, Backbone, Marionette, $, _) ->
  class Entities.Line extends Backbone.Model
    parse: (response) ->
      @set
        reviews: new Entities.Reviews(response.reviews)
        discussions: new Entities.Discussions(response.discussions)
      delete response.reviews
      delete response.discussions
      response

    review: (type) ->
      @get('reviews').add new Entities.Review(type: type)

  class Entities.Lines extends Backbone.Collection
    model: Entities.Line