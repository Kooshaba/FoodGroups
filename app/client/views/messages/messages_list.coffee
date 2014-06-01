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
      body: message
      order_id: Session.get('order_id')
    
    $('.new-message-input').val ''
    $('.messages').animate { scrollTop: $('.messages')[0].scrollHeight}, 100
