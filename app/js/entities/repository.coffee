@PullRequestsReviews.module 'Entities', (Entities, App, Backbone, Marionette, $, _) ->
  class Entities.Repository extends Backbone.Model

  class Entities.Repositories extends Backbone.Collection
    model: Entities.Repository