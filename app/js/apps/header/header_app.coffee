@Reviwr.module 'HeaderApp', (HeaderApp, App, Backbone, Marionette, $, _) ->
  @startWithParent = false

  API =
    show: ->
      new HeaderApp.Show.Controller()

  HeaderApp.on 'start', ->
    API.show()

  App.vent.on 'vist:home', ->
    App.vent.trigger 'visit', path: '/', trigger: true