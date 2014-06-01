done_voting = (members) ->
  console.log "done voting called"
  for member in members
    return false unless member.voted
  true

Template.restaurants.helpers
  restaurants: ->
    order = Orders.findOne(_id: Session.get('order_id'))
    order.restaurants
  not_voted: ->
    for member in Orders.findOne(Session.get('order_id')).members
      if Meteor.userId() == member.user_id
        return !member.voted
        
Template.restaurants.events
  'submit .restaurant-vote': (e) ->
    e.preventDefault()
    order = Orders.findOne(Session.get('order_id'))
    new_restaurants = order.restaurants
    data_id = $('input[name=vote]:checked').data('id')
    members = order.members
    for restaurant in new_restaurants
      console.log restaurant
      if restaurant._id == data_id.toString()
        restaurant.votes++
    for member in members
      if Meteor.userId() == member.user_id
        member.voted = true
    Orders.update(order._id, {$set: {restaurants: new_restaurants} })
    Orders.update(order._id, {$set: {members: members}})
    if done_voting(members)
      console.log "done voting"
      Orders.update(order._id, {$inc: {state: 1}} )
    $('.' + data_id).addClass('bold')
