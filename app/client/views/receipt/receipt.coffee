Template.receipt.helpers
  receipt: ->
    Orders.findOne(Session.get('order_id')).receipt