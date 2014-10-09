@PullRequestsReviews.module 'PageChanger', (PageChanger, App, Backbone, Marionette, $, _) ->
  class PageChanger.Changer
    @getInstance: -> @_instance ?= new @(arguments...)

    navigate: (route, options = {}) ->
      @lastPath = route unless options.replace
      route = App.Helpers.Url.getInstance().urlFor(route)
      Backbone.history.navigate route, options

    back: ->
      route = if _.isUndefined(@lastPath)
        '/'
      else
        @lastPath

      @navigate route, replace: true

  API =
    navigate: (options) ->
      PageChanger.Changer.getInstance().navigate(options.path, options)

    back: ->
      PageChanger.Changer.getInstance().back()

  App.vent.on 'visit', (options) ->
    API.navigate(options)