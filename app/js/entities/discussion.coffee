@PullRequestsReviews.module 'Entities', (Entities, App, Backbone, Marionette, $, _) ->
  class Entities.Discussion extends Backbone.Model
    defaults:
      isChangeable: false

    initialize: ->
      @withCurrentUser (currentUser) =>
        if @get('user').get('id') == currentUser.get('id')
          @set isChangeable: true

    parse: (response) ->
      @set user: new Entities.User(id: response.user_id)
      delete response.user
      response

    mutators:
      hasMessage: ->
        @get('message')?

    withCurrentUser: (callback) ->
      currentUser = App.request 'current:user'
      App.execute 'when:fetched', currentUser, =>
        callback currentUser

  class Entities.Discussions extends Backbone.Collection
    model: Entities.Discussion