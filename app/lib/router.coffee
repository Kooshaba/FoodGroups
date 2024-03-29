Router.configure
  layoutTemplate: 'layout'

Router.map -> 
  @route 'ordersList', {
    path: '/'
    waitOn: ->
      Meteor.subscribe 'orders', Meteor.userId()
  }
  @route 'orderShow', {
    path: '/order/:_id'
    data: ->
      Orders.findOne _id: @params._id
    waitOn: ->
      Meteor.subscribe 'orders', Meteor.userId()
      Meteor.subscribe 'messages', @params._id
      Meteor.subscribe 'users'
      Session.set 'order_id', @params._id
      Session.set 'notice', ''
  }
