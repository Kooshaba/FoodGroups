Template.orderShow.helpers 
  voting: ->
    @state == 0
  selecting: ->
    @state == 1
  incomplete: ->
    @state < 2


Template.orderShow.events
  'submit .add-member': (e) ->
    e.preventDefault()
    name = $(".new-username").val()
    $(".new-username").val('')
    order = Orders.findOne({_id: Session.get('order_id')})
    user = Meteor.users.findOne({username: name})
    unless user
      alert "Could not find that user"
      return
    new_members = order.members
    new_id = {user_id: user._id}
    for member in new_members
      if new_id.user_id == member.user_id 
        console.log "found match"
        return
    console.log 'pushing!'
    new_members.push new_id
    Orders.update order._id, {$set: {members: new_members}}, (error) ->
      if error
        console.log error
