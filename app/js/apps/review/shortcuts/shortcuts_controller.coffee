@PullRequestsReviews.module 'ReviewApp.Shortcuts', (Shortcuts, App, Backbone, Marionette, $, _) ->
  class Shortcuts.Controller extends Marionette.Controller
    initialize: (pullRequest) ->
      @pullRequest = pullRequest

      App.execute 'when:fetched', @pullRequest, =>
        @bindKeys()
        @pullRequest.selectFirstFile()

    bindKeys: ->
      Mousetrap.bind 'a', (e) => @exec(e, 'accept:line')
      Mousetrap.bind ['command+a', 'ctrl+a'], (e) => @exec(e, 'accept:file')
      Mousetrap.bind 'r', (e) => @exec(e, 'reject:line')
      Mousetrap.bind ['command+r', 'ctrl+r'], (e) => @exec(e, 'reject:file')
      Mousetrap.bind '?', (e) => @exec(e, 'start:discussion')
      Mousetrap.bind 'up', (e) => @exec(e, 'previous:line')
      Mousetrap.bind 'down', (e) => @exec(e, 'next:line')

    unbindKeys: ->
      Mousetrap.unbind 'a'
      Mousetrap.unbind ['command+a', 'ctrl+a']
      Mousetrap.unbind 'r'
      Mousetrap.unbind ['command+r', 'ctrl+r']
      Mousetrap.unbind '?'
      Mousetrap.unbind 'up'
      Mousetrap.unbind 'down'

    exec: (e, type) ->
      e.preventDefault() if e && e.preventDefault
      @currentFile = @pullRequest.get('currentFile')
      @currentLine = if @currentFile
        @currentFile.get('currentLine')
      else
        null

      switch type
        when 'accept:line' then @acceptLine()
        when 'accept:file' then @acceptFile()
        when 'reject:line' then @rejectLine()
        when 'reject:file' then @rejectFile()
        when 'start:discussion' then @startDiscussion()
        when 'next:line' then @nextLine()
        when 'previous:line' then @previousLine()

    # press "A"
    acceptLine: ->
      @currentLine.accept() if @currentLine?

    # press "cmd + A"
    acceptFile: ->
      @currentFile.accept() if @currentFile?

    # press "R"
    rejectLine: ->
      @currentLine.reject() if @currentLine?

    # press "cmd + R"
    rejectFile: ->
      @currentFile.reject() if @currentFile?

    # press "?"
    startDiscussion: ->
      console.log 'start discussion'
      # @model.currentFile.currentLine.discussion.add new Discussion()

    # press "dowm"
    nextLine: ->
      @pullRequest.goToNextLine()

    # press "up"
    previousLine: ->
      @pullRequest.goToPreviousLine()

    onDestroy: ->
      @unbindKeys()