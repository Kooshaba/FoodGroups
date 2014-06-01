Template.ordersList.helpers {
  orders: () ->
    Orders.find({ members: { $elemMatch: {user_id: 2} } })
  create: (name, owner_id, members) ->
    Orders.insert {
      name: name
      owner_id: owner_id
      members: members
    }
}