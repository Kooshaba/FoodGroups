if @Messages.find().count() == 0
  @Messages.insert {
    user_id: 1
    order_id: 1
    body: "What's up, doc?"
  }

  @Messages.insert {
    user_id: 2
    order_id: 1
    body: "Nothin'"
  }