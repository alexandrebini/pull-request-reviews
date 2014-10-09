@PullRequestsReviews.module 'Entities', (Entities, App, Backbone, Marionette, $, _) ->
  class Entities.Line extends Backbone.Model
    mutators:
      reviewed: ->
        @get('reviews').length > 0

    parse: (response) ->
      @set
        reviews: new Entities.Reviews(response.reviews, parse: true)
        discussions: new Entities.Discussions(response.discussions, parse: true)

      delete response.reviews
      delete response.discussions

      response

    accept: ->
      @review 'accept'

    reject: ->
      @review 'reject'

    review: (type) ->
      console.log 'line review', type, @get('text')
      @get('reviews').add new Entities.Review(type: type)

  class Entities.Lines extends Backbone.Collection
    model: Entities.Line
