@PullRequestsReviews.module 'Entities', (Entities, App, Backbone, Marionette, $, _) ->
  class Entities.PullRequest extends Backbone.Model
    urlRoot: '/api/pull_requests'
    defaults:
      currentFile: undefined

    parse: (response) ->
      @set files: new Entities.Files(response.files)
      delete response.files
      response

  class Entities.PullRequests extends Backbone.Collection
    url: '/api/pull_requests'
    model: Entities.PullRequest

  API =
    getPullRequest: (id) ->
      pullRequest = new Entities.PullRequest(id: id)
      pullRequest.fetch()
      pullRequest

  App.reqres.setHandler 'pull:request:entity', (id) ->
    API.getPullRequest(id)