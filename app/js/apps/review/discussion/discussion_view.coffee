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

    initialize: ->
      $(@ui.form).hide()

    editMessage: ->
      @ui.form.show()
      @ui.message.hide()

    abortEditMessage: ->
      @ui.form.hide()
      @ui.message.show()

  class Discussion.DiscussionsView extends Marionette.CollectionView
    childView: Discussion.DiscussionView
    tagName: 'ul'
    className: 'discussion'