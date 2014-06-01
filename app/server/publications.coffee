Meteor.publish 'messages', (order_id) ->
  Messages.find({order_id: order_id})
  
Meteor.publish 'users', ->
  Meteor.users.find({}, {fields: {username: 1}})
  
Meteor.publish 'orders', (user_id) ->
  Orders.find({ members: { $elemMatch: {user_id: user_id} } } )
  
# Meteor.publish 'order', (order_id) ->
#   Orders.findOne({_id: order_id})