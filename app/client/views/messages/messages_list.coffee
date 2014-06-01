Template.messagesList.helpers
  messages: ->
    Messages.find()

Template.messagesList.events
  'submit form': (e) ->
    e.preventDefault()
    
    message = $('.new-message-input').val()
    
    return if /^\s*$/.test message
    
    Messages.insert 
      user_id: Meteor.userId()
      user:  Meteor.user()['username']
      body: message
      order_id: 1
    
    $('.new-message-input').val ''
    $('.messages').animate { scrollTop: $('.messages')[0].scrollHeight}, 100
