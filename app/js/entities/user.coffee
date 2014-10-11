@PullRequestsReviews.module 'Entities', (Entities, App, Backbone, Marionette, $, _) ->
  class Entities.User extends Backbone.Model

  class Entities.Users extends Backbone.Collection
    url: '/api/users'
    model: Entities.User

  API =
    getCurrentUser: ->
      unless @currentUser?
        @currentUser = new Entities.User()
        @currentUser.fetch
          url: '/api/users/current.json'
      @currentUser

  App.reqres.setHandler 'current:user', ->
    API.getCurrentUser()