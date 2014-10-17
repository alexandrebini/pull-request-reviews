@Reviwr.module 'Entities', (Entities, App, Backbone, Marionette, $, _) ->
  class Entities.Repository extends Backbone.Model
    urlRoot: '/api/repositories'

  class Entities.Repositories extends Backbone.Collection
    model: Entities.Repository

  API =
    getRepositories: ->
      repositories = new Entities.Repositories()
      repositories.fetch()
      repositories

    getRepository: (pullRequest) ->
      repository = pullRequest.get('repository')
      repository.fetch()
      repository

  App.reqres.setHandler 'repository:entities' ->
    API.getRepositories()

  App.reqres.setHandler 'repository:entity', (pullRequest) ->
    API.getRepository(pullRequest)