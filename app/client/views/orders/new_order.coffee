Template.newOrder.events
  'submit form': (e) ->
    e.preventDefault()
    name = $('.new-order-input')
    console.log name.val()
    Orders.insert
      name: name.val()
      owner_id: Meteor.userId()
      members: [{user_id: Meteor.userId()}]
      state: 0
    name.val('')



