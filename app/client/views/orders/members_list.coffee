Template.membersList.helpers
#   members: ->
#     order = Orders.findOne({_id: Session.get('order_id')})
#     console.log order
#     members = []
#     for member in order.members
#       members.push username: Meteor.users.findOne({_id: member.user_id}).username
#     console.log 'Members:'
#     console.log members
#     members