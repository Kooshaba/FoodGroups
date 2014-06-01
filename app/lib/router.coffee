Router.configure
  layoutTemplate: 'layout'

Router.map -> 
  @route 'ordersList', path: '/'
  @route 'messagesList', path: '/messages'