Template.message.helpers
  username: ->
    Meteor.users.findOne({_id: @user_id}).username