Accounts.ui.config {
  passwordSignupFields: 'USERNAME_AND_EMAIL'
}

Meteor.subscribe 'foodItems'

Messages.find().observeChanges {
  added: (item) ->
    $('.messages').animate({ scrollTop: $('.messages')[0].scrollHeight}, 100)
}
