@PullRequestsReviews.module 'Entities', (Entities, App, Backbone, Marionette, $, _) ->
  class Entities.File extends Backbone.Model
    initialize: ->
      @get('lines').on 'change', (model) =>
        if model.changed.current == true
          @trigger 'change:current:line', model

    mutators:
      lines: ->
        @lines ?= new Entities.Lines()

      currentLine: ->
        _.find @get('lines').models, (line) ->
          line.get('current')

      nextLine: ->
        if currentLine = @get('currentLine')
          @get('lines').at @get('lines').indexOf(currentLine) + 1

      previousLine: ->
        if currentLine = @get('currentLine')
          @get('lines').at @get('lines').indexOf(currentLine) - 1

      nextLineToReview: ->
        _.find @get('lines').models, (line) ->
          line.get('reviewed') == false

      reviewed: ->
        @get('currentLine') == null

    parse: (response) ->
      @get('lines').reset(response.lines, parse: true)
      delete response.lines
      response

    accept: ->
      @review 'accept'

    reject: ->
      @review 'reject'

    review: (type) ->
      @get('lines').each (line) -> line.review(type)

    selectFirstLine: ->
      if firstLine = @get('lines').first()
        firstLine.set(current: true)

    selectLastLine: ->
      if lastLine = @get('lines').last()
        lastLine.set(current: true)

    onChangeCurrentLine: (currentLine) ->
      @get('lines').each (line) ->
        line.set(current: false) if currentLine != line

  class Entities.Files extends Backbone.Collection
    model: Entities.File