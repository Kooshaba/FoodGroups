Router.configure
  layoutTemplate: 'layout'

Router.map -> 
  @route 'ordersList', {
    path: '/'
    waitOn: ->
      Meteor.subscribe 'orders', Meteor.userId()
  }
  @route 'messagesList', {
    path: '/messages'
    waitOn: ->
      Meteor.subscribe 'messages'
      Meteor.subscribe 'users'
  }
  @route 'orderShow', {
    path: '/order/:_id'
    Session.set('order_id', @params._id)
    data: ->
      Orders.findOne({_id: @params._id})
    waitOn: ->
      Meteor.subscribe 'orders', Meteor.userId()
      Meteor.subscribe 'messages', Session.get('order_id')
      Meteor.subscribe 'users'
  }
