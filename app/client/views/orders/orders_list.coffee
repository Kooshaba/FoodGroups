Template.ordersList.helpers
  orders: () ->
    Orders.find()

Template.ordersList.events
  'click #new-order': ->
    @_id = Orders.insert
      owner_id: Meteor.userId