@PullRequestsReviews.module 'Entities', (Entities, App, Backbone, Marionette, $, _) ->
  class Entities.PullRequest extends Backbone.Model
    initialize: ->
      @get('files').on 'change:current:line', (currentLine, options) =>
        @onChangeCurrentFile(currentLine)

    urlRoot: '/api/pull_requests'

    mutators:
      files: ->
        @files ?= new Entities.Files()

      currentFile: ->
        if files = @get('files')
          _.find files.models, (file) ->
            file.get('currentLine')?

      nextFile: ->
        if currentFile = @get('currentFile')
          @get('files').at @get('files').indexOf(currentFile) + 1

      previousFile: ->
        if currentFile = @get('currentFile')
          @get('files').at @get('files').indexOf(currentFile) - 1

      nextFileToReview: ->
        if files = @get('files')
          _.find files.models, (file) ->
            file.get('nextLineToReview')

      href: ->
        "/pull-requests/#{ @get('id') }/"

    parse: (response) ->
      @get('files').reset(response.files, parse: true)
      delete response.files
      response

    selectFirstFile: ->
      if nextFileToReview = @get('nextFileToReview')
        nextFileToReview.selectFirstLine()

    onChangeCurrentFile: (currentLine) ->
      @get('files').each (file) ->
        file.onChangeCurrentLine(currentLine)

    goToNextLine: ->
      currentFile = @get('currentFile')

      if nextLine = currentFile.get('nextLine')
        nextLine.set(current: true)
      else
        @goToNextFile()

    goToPreviousLine: ->
      currentFile = @get('currentFile')

      if previousLine = currentFile.get('previousLine')
        previousLine.set(current: true)
      else
        @goToPreviousFile()

    goToNextFile: ->
      if nextFile = @get('nextFile')
        nextFile.selectFirstLine()

    goToPreviousFile: ->
      if previousFile = @get('previousFile')
        previousFile.selectLastLine()

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