@Reviwr.module 'Entities', (Entities, App, Backbone, Marionette, $, _) ->
  class Entities.Review extends Backbone.Model
    urlRoot: '/api/reviews'

    parse: (response) ->
      @set user: new Entities.User(id: response.user_id)
      delete response.user
      response

  class Entities.Reviews extends Backbone.Collection
    model: Entities.Review

    className: ->
      @getClassName @countBy (review) ->
        if review.get('type') == 'accept' then 'accept' else 'reject'

    getClassName: (types) ->
      if !_.isUndefined(types)
        className = _.map types, (value, key) ->
          if value > 1
            "strong_#{ key }"
          else
            key
        .join(' ')
      else
        ''

    accept: ->
      @findOrInitialize (review) =>
        if review.get('type') != 'accept'
          review.set type: 'accept'
          review.save()

    reject: ->
      @findOrInitialize (review) =>
        if review.get('type') != 'reject'
          review.set type: 'reject'
          review.save()

    findOrInitialize: (callback) ->
      @withCurrentUser (currentUser) =>
        review = @findWhere({ user_id: currentUser.get('id') })
        review = @add({ user_id: currentUser.get('id') }) unless review?
        callback review

    withCurrentUser: (callback) ->
      currentUser = App.request 'current:user'
      App.execute 'when:fetched', currentUser, =>
        callback currentUser