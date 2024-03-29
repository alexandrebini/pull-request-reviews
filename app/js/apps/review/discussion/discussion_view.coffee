@Reviwr.module 'ReviewApp.Discussion', (Discussion, App, Backbone, Marionette, $, _) ->
  class Discussion.DiscussionView extends Marionette.ItemView
    template: 'discussion/show'
    tagName: 'li'
    ui:
      cancelButton: 'a.discussion-link--cancel'
      editButton: 'a.discussion-link--edit'
      deleteButton: 'a.discussion-link--delete'
      message: 'p.discussion-message'
      form: 'form'
    triggers:
      'click @ui.cancelButton' : 'cancelButton:clicked'
      'click @ui.editButton' : 'editButton:clicked'
      'click @ui.deleteButton' : 'deleteButton:clicked'
      'submit' : 'form:submit'
    modelEvents:
      'change isChangeable': 'onChangeableChanged'

    editMessage: ->
      @ui.form.show()
      @ui.message.hide()
      @ui.cancelButton.show()

    abortEditMessage: ->
      @ui.form.hide()
      @ui.message.show()
      @ui.cancelButton.hide()

    onShow: ->
      @ui.cancelButton.hide()
      @ui.editButton.hide()
      @ui.deleteButton.hide()
      if @model.get('message')
        @ui.form.hide()

    onChangeableChanged: ->
      if @model.get('isChangeable')
        @ui.editButton.show()
        @ui.deleteButton.show()

  class Discussion.DiscussionsView extends Marionette.CollectionView
    childView: Discussion.DiscussionView
    tagName: 'ul'
    className: 'discussion'