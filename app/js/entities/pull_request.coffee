@PullRequestsReviews.module 'Entities', (Entities, App, Backbone, Marionette, $, _) ->
  class Entities.PullRequest extends Backbone.Model
    urlRoot: '/api/pull_requests'

    mutators:
      currentFile: ->
        _.find @get('files').models, (line) ->
          line.get('reviewed') == false

    parse: (response) ->
      @set files: new Entities.Files(response.files, parse: true)
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

    getPullRequests: ->
      pullRequests = new Entities.PullRequests()
      pullRequests.fetch()
      pullRequests

  App.reqres.setHandler 'pull:request:entity', (id) ->
    API.getPullRequest(id)

  App.reqres.setHandler 'pull:request:entities', ->
    API.getPullRequests()
