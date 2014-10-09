@PullRequestsReviews.module 'Entities', (Entities, App, Backbone, Marionette, $, _) ->
  class Entities.Discussion extends Backbone.Model
    parse: (response) ->
      @set user: new Entities.User(id: response.user_id)
      delete response.user
      response

  class Entities.Discussions extends Backbone.Collection
    url: '/api/discussions/1/'
    model: Entities.Discussion

  API =
    getDiscussions: (lineNumber) ->
      discussions = new Entities.Discussions(lineNumber: lineNumber)
      discussions.fetch()
      discussions

  App.reqres.setHandler 'discussions:entity', (lineNumber) ->
    API.getDiscussions(lineNumber)