@PullRequestsReviews.module 'Entities', (Entities, App, Backbone, Marionette, $, _) ->
  class Entities.Review extends Backbone.Model
    parse: (response) ->
      @set user: new Entities.User(id: response.user_id)
      delete response.user
      response

  class Entities.Reviews extends Backbone.Collection
    model: Entities.Review
    status: new Backbone.Model({ className: '' })

    checkClassName: ->
      @setClassName @countBy (review) ->
        if review.get('type') == 'accept' then 'accept' else 'reject'

    setClassName: (types) ->
      if !_.isUndefined(types)
        className = _.map types, (value, key) ->
          if value > 1
            "strong_#{ key }"
          else
            key
        .join(' ')

        @status.set(className: className)