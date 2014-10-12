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
      Mousetrap.bind 'd', (e) => @exec(e, 'reject:line')
      Mousetrap.bind ['command+d', 'ctrl+d'], (e) => @exec(e, 'reject:file')
      Mousetrap.bind '?', (e) => @exec(e, 'start:discussion')
      Mousetrap.bind 'up', (e) => @exec(e, 'previous:line')
      Mousetrap.bind 'down', (e) => @exec(e, 'next:line')
      Mousetrap.bind ['command+up', 'ctrl+up'], (e) => @exec(e, 'previous:file')
      Mousetrap.bind ['command+down', 'ctrl+down'], (e) => @exec(e, 'next:file')

    unbindKeys: ->
      Mousetrap.unbind 'a'
      Mousetrap.unbind ['command+a', 'ctrl+a']
      Mousetrap.unbind 'd'
      Mousetrap.unbind ['command+d', 'ctrl+d']
      Mousetrap.unbind '?'
      Mousetrap.unbind 'up'
      Mousetrap.unbind 'down'
      Mousetrap.unbind ['command+up', 'ctrl+up']
      Mousetrap.unbind ['command+down', 'ctrl+down']

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
        when 'next:file' then @nextFile()
        when 'previous:file' then @previousFile()

    # press "A"
    acceptLine: ->
      return unless @currentLine?
      @currentLine.accept()
      @nextLine()

    # press "cmd + A"
    acceptFile: ->
      return unless @currentFile?
      @currentFile.accept()
      @nextFile()

    # press "R"
    rejectLine: ->
      return unless @currentLine?
      @currentLine.reject()
      @nextLine()

    # press "cmd + R"
    rejectFile: ->
      return unless @currentFile?
      @currentFile.reject()
      @nextFile()

    # press "?"
    startDiscussion: (e) ->
      App.execute 'line:start:discussion', @currentLine

    # press "dowm"
    nextLine: ->
      @pullRequest.goToNextLine()

    # press "up"
    previousLine: ->
      @pullRequest.goToPreviousLine()

    # press "cmd + dowm"
    nextFile: ->
      @pullRequest.goToNextFile()

    # press "cmd + up"
    previousFile: ->
      @pullRequest.goToPreviousFile()

    onDestroy: ->
      @unbindKeys()