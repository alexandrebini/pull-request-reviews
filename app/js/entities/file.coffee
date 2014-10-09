@PullRequestsReviews.module 'Entities', (Entities, App, Backbone, Marionette, $, _) ->
  class Entities.File extends Backbone.Model
    mutators:
      currentLine: ->
        _.find @get('lines').models, (file) ->
          file.get('reviewed') == false

      reviewed: ->
        @get('currentLine') == null

    parse: (response) ->
      @set lines: new Entities.Lines(response.lines, parse: true)
      delete response.lines
      response

    accept: ->
      @review 'accept'

    reject: ->
      @review 'reject'

    review: (type) ->
      @get('lines').each (line) -> line.review(type)

  class Entities.Files extends Backbone.Collection
    model: Entities.File