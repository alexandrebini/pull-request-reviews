@PullRequestsReviews.module 'PullRequestsApp.List', (List, App, Backbone, Marionette, $, _) ->
  class List.Controller extends Marionette.Controller
    initialize: ->
      @layout = @getLayout()
      @pullRequests = App.request 'pull:request:entities'

      @listenTo @layout, 'show', =>
        App.execute 'when:fetched', @pullRequests, =>
          @pullRequestsRegion()

      App.mainRegion.show @layout

    pullRequestsRegion: ->
      pullRequestsView = @getPullRequestsView()

      @listenTo pullRequestsView, 'childview:pull:request:clicked', (child) =>
        App.vent.trigger 'visit:pull:request', child.model.get('id')

      @layout.listRegion.show pullRequestsView

    getLayout: ->
      new List.Layout()

    getPullRequestsView: ->
      new List.PullRequestsView
        collection: @pullRequests