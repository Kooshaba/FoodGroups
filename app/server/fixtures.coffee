if Orders.find().count() == 0
  Orders.insert
    name: 'Lunch Order'
    owner_id: 1
    members: [{user_id: 1}, {user_id: 2}, {user_id: 3}]

  Orders.insert
    name: 'Another Lunch Order'
    owner_id: 2
    members: [{user_id: 3}, {user_id: 4}, {user_id: 5}]