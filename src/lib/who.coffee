Who=Backbone.Model.extend
  defaults: {name:'', jumin1:'', jumin2:''}
  localStorage: new Store('ladybucks')
  validate: (attrs) ->
    _.isNumber( attrs.jumin1 ) && _.isNumber( attrs.jumin2 )
