Template.messagesList.helpers {
  messages: ->
    Messages.find()
}

Template.messagesList.events {
  'submit form': (e) ->
    e.preventDefault()
    
    Messages.insert {
      user_id: Meteor.userId()
      user:  Meteor.user()['username']
      body: $('.new-message-input').val()
      order_id: 1
    }

    $('.new-message-input').val('')
}