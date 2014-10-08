@PullRequestsReviews.module 'Entities', (Entities, App, Backbone, Marionette, $, _) ->
  class Entities.Review extends Backbone.Model
    parse: (response) ->
      @set user: new Entities.User(id: response.user_id)
      delete response.user
      response

  class Entities.Reviews extends Backbone.Collection
    model: Entities.Review