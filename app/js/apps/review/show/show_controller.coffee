@PullRequestsReviews.module 'ReviewApp.Show', (Show, App, Backbone, Marionette, $, _) ->
  class Show.Controller extends Marionette.Controller
    initialize: (pullRequest) ->
      @layout = @getLayout()
      @pullRequest = pullRequest
      @menu = App.request 'review:menu:entities'

      @listenTo @layout, 'show', =>
        App.execute 'when:fetched', @pullRequest, =>
          @menuRegion()
          @filesRegion()

      App.mainRegion.show @layout

    getLayout: ->
      new Show.Layout()

    menuRegion: ->
      menuView = @getMenuView()

      @listenTo menuView, 'childview:item:clicked', (child) ->
        model = child.model
        model.set(isSelected: true)

        if child.model.get('name') is 'Code'
          @filesRegion()
        else
          @descriptionRegion()

      @layout.menuRegion.show menuView

    filesRegion: ->
      filesView = @getFilesView()

      filesView.buildChildView = (child, ChildViewClass, childViewOptions) ->
        App.request 'file:wrapper', child

      @layout.filesRegion.show filesView

    descriptionRegion: ->
      descriptionView = @getDescriptionView()
      @layout.filesRegion.show descriptionView

    getMenuView: ->
      new Show.MenuView
        collection: @menu

    getFilesView: ->
      new Show.FilesView
        collection: @pullRequest.get('files')

    getDescriptionView: ->
      new Show.DescriptionView
        model: @pullRequest