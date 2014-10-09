@PullRequestsReviews.module 'ReviewApp.Shortcuts', (Shortcuts, App, Backbone, Marionette, $, _) ->
  class Shortcuts.Controller extends Marionette.Controller
    initialize: (pullRequest) ->
      @pullRequest = pullRequest

      App.execute 'when:fetched', @pullRequest, =>
        @bindKeys()

    bindKeys: ->
      Mousetrap.bind 'a', (e) => @acceptLine(e)
      Mousetrap.bind ['command+a', 'ctrl+a'], (e) => @acceptFile(e)
      Mousetrap.bind 'r', (e) => @rejectLine(e)
      Mousetrap.bind ['command+r', 'ctrl+r'], (e) => @rejectFile(e)
      Mousetrap.bind '?', (e) => @startDiscussion(e)

    unbindKeys: ->
      Mousetrap.unbind 'a'
      Mousetrap.unbind ['command+a', 'ctrl+a']
      Mousetrap.unbind 'r'
      Mousetrap.unbind ['command+r', 'ctrl+r']
      Mousetrap.unbind '?'

    # press "A"
    acceptLine: (e) ->
      e.preventDefault() if e && e.preventDefault
      console.log 'accept line'
      console.log 'currentFile', @pullRequest.get('currentFile')
      console.log 'currentLine', @pullRequest.get('currentFile').get('currentLine')

    # press "cmd + A"
    acceptFile: (e) ->
      e.preventDefault() if e && e.preventDefault
      console.log 'accept file'

    # press "R"
    rejectLine: (e) ->
      e.preventDefault() if e && e.preventDefault
      console.log 'reject line'

    # press "cmd + R"
    rejectFile: (e) ->
      e.preventDefault() if e && e.preventDefault
      console.log 'reject file'

    # press "?"
    startDiscussion: (e) ->
      e.preventDefault() if e && e.preventDefault
      console.log 'start discussion'
      # @model.currentFile.currentLine.discussion.add new Discussion()

    onDestroy: ->
      @unbindKeys()