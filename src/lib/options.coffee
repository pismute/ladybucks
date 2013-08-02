$ ->
  WhoView=Backbone.View.extend
    el: $('#who-form')
    initialize: ->
      @model.on('change:name', @updateViewName, @)
      @model.on('change:jumin1', @updateViewJumin1, @)
      @model.on('change:jumin2', @updateViewJumin2, @)
    render: ->
      @updateViewName()
      @updateViewJumin1()
      @updateViewJumin2()
    updateViewName: ->
      # @$('selector') == $('selector', @el)
      @$("#name").val( @model.get('name') )
    updateViewJumin1: ->
      @$("#jumin1").val( @model.get('jumin1') )
    updateViewJumin2: ->
      @$("#jumin2").val( @model.get('jumin2') )
    events:
      'change #name': 'changeName'
      'change #jumin1': 'changeJumin1'
      'change #jumin2': 'changeJumin2'
    changeName: ->
      @model.set( { name: @$('#name').val() } )
      @model.save()
    changeJumin1: ->
      @model.set( { jumin1: @$('#jumin1').val() } )
      @model.save()
    changeJumin2: ->
      @model.set( { jumin2: @$('#jumin2').val() } )
      @model.save()

  who= new Who({id:'who'})

  Backbone.sync 'read', who,
    success: (data) ->
      who.set('name', data.name)
      who.set('jumin1', data.jumin1)
      who.set('jumin2', data.jumin2)
    error: (msg) ->
      # ignoring record not found
      # alert( msg )

  whoView = new WhoView({model: who})
  whoView.render()
