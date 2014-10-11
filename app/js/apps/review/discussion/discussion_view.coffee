@PullRequestsReviews.module 'ReviewApp.Discussion', (Discussion, App, Backbone, Marionette, $, _) ->
  class Discussion.DiscussionView extends Marionette.ItemView
    template: 'discussion/show'
    tagName: 'li'
    ui:
      cancelButton: 'a.cancel'
      editButton: 'a.edit'
      deleteButton: 'a.delete'
      message: 'p.message'
      form: 'form'

    triggers:
      'click @ui.cancelButton' : 'cancelButton:clicked'
      'click @ui.editButton' : 'editButton:clicked'
      'click @ui.deleteButton' : 'deleteButton:clicked'
      'submit' : 'form:submit'

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
      if @model.get('message')
        @ui.form.hide()

  class Discussion.DiscussionsView extends Marionette.CollectionView
    childView: Discussion.DiscussionView
    tagName: 'ul'
    className: 'discussion'