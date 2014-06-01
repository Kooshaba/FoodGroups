Template.orderShow.helpers 
  voting: ->
    @state == 0
  selecting: ->
    @state == 1
  incomplete: ->
    @state < 2
  owner: ->
    Meteor.userId() == @owner_id
  notice: ->
    Session.get 'notice'
    
Template.orderShow.events
  'submit .add-member': (e) ->
    e.preventDefault()
    name = $(".new-username").val()
    $(".new-username").val('')
    order = Orders.findOne({_id: Session.get('order_id')})
    user = Meteor.users.findOne({username: name})
    unless user
      Session.set 'notice', 'User not found.'
      return
    new_members = order.members
    new_id = {
      user_id: user._id
      voted: false
    }
    for member in new_members
      if new_id.user_id == member.user_id 
        Session.set 'notice', 'User already in group'
        return
    new_members.push new_id
    Session.set 'notice', 'User added to group.'
    Orders.update order._id, {$set: {members: new_members}}, (error) ->
      if error
        console.log error
