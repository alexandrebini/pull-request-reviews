@PullRequestsReviews.module 'ReviewApp.Show', (Show, App, Backbone, Marionette, $, _) ->
  class Show.Controller extends Marionette.Controller
    initialize: (pullRequest) ->
      @layout = @getLayout()
      @pullRequest = pullRequest
      @menu = App.request 'review:menu:entities'

      @listenTo @layout, 'show', =>
        App.execute 'when:fetched', @pullRequest, =>
          @menuRegion()
          @nameRegion()
          @filesRegion()

          @repository = App.request 'repository:entity', pullRequest
          App.execute 'when:fetched', @repository, =>
            @repositoryRegion()

      App.mainRegion.show @layout

    nameRegion: ->
      nameView = @getNameView()
      @layout.nameRegion.show nameView

    repositoryRegion: ->
      repositoryView = @getRepositoryView()
      @layout.repositoryRegion.show repositoryView

    menuRegion: ->
      menuView = @getMenuView()

      @listenTo menuView, 'childview:item:clicked', (child) ->
        model = child.model
        @menu.select(model)

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

    getLayout: ->
      new Show.Layout()

    getMenuView: ->
      new Show.MenuView
        collection: @menu

    getFilesView: ->
      new Show.FilesView
        collection: @pullRequest.get('files')

    getDescriptionView: ->
      new Show.DescriptionView
        model: @pullRequest

    getNameView: ->
      new Show.NameView
        model: @pullRequest

    getRepositoryView: ->
      new Show.RepositoryView
        model: @repository