Meteor.publish 'messages', ->
  Messages.find()
  
Meteor.publish 'users', ->
  Meteor.users.find({}, {fields: {username: 1}})
  
Meteor.publish 'orders', (user_id) ->
  Orders.find({ members: { $elemMatch: {user_id: user_id} } } )
  
# Meteor.publish 'order', (order_id) ->
#   Orders.findOne({_id: order_id})