@PullRequestsReviews.module 'Entities', (Entities, App, Backbone, Marionette, $, _) ->
  class Entities.File extends Backbone.Model
    parse: (response) ->
      @set lines: new Entities.Lines(response.lines)
      delete response.lines
      response

    rewiew: (type) ->
      @get('lines').each (line) -> line.review(type)

  class Entities.Files extends Backbone.Collection
    model: Entities.File