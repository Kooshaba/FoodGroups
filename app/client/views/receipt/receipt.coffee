Template.receipt.helpers
  receipt: ->
    Orders.findOne(Session.get('order_id')).receipt
  group_total: ->
    order = Orders.findOne(Session.get('order_id'))
    receipt = order.receipt
    total = 0
    for item in receipt
      total += item.price
    total
  personal_total: ->
    order = Orders.findOne(Session.get('order_id'))
    receipt = order.receipt
    total = 0
    for item in receipt
      total += item.price if item.user_id == Meteor.userId()
    total
    
Template.receipt.events
  'click .ready-checkbox': (e) ->
    order = Orders.findOne(Session.get('order_id'))
    for member in order.members
      if member.user_id == Meteor.userId()
        member.ready = $('.ready-checkbox').is(':checked')
        Orders.update order._id, {$set: {members: order.members}}
    all_ready = (members) ->
      for member in members
        return false unless member.ready
      true
    if all_ready(order.members)
      alert "yo everybody is ready!"
