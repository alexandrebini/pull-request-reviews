@PullRequestsReviews.module 'Entities', (Entities, App, Backbone, Marionette, $, _) ->
  class Entities.User extends Backbone.Model

  class Entities.Users extends Backbone.Collection
    url: '/api/users'
    model: Entities.User