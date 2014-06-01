Template.item.events
  'click .add-item': (e) ->
    e.preventDefault()
    order = Orders.findOne(Session.get('order_id'))
    receipt = order.receipt
    item_id = $(e.currentTarget).data 'item-id' # == the id of the item whose button was clicked
    name = $(e.currentTarget).data 'name'
    price = $(e.currentTarget).data('price')
    receipt.push
      user_id: Meteor.userId()
      username: Meteor.user().username
      name: name
      price: price
      item_id: item_id
    Orders.update order._id, {$set: {receipt: receipt}}