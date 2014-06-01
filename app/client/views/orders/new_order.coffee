Template.newOrder.events
  'submit form': (e) ->
    e.preventDefault()
    name = $('.new-order-input')
    return if /^\s*$/.test name.val()
    console.log name.val()
    Orders.insert
      name: name.val()
      restaurants: restaurants
      owner_id: Meteor.userId()
      members: [{
        user_id: Meteor.userId()
        voted: false
        ready: false
      }]
      receipt: []
      state: 0
    name.val('')



