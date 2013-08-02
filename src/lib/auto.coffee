WhoView=Backbone.View.extend
  el: $('.login')
  initialize: ->
    @model.on('change:name', @updateViewName, @)
    @model.on('change:jumin1', @updateViewJumin1, @)
    @model.on('change:jumin2', @updateViewJumin2, @)
  render: ->
    @updateViewName()
    @updateViewJumin1()
    @updateViewJumin2()
  updateViewName: ->
    @$('selector') == $('selector', @el)
    @$("#userNm").val( @model.get('name') )
  updateViewJumin1: ->
    @$("#userNo1").val( @model.get('jumin1') )
  updateViewJumin2: ->
    @$("#userNo2").val( @model.get('jumin2') )

who= new Who( { id:'who' } )
whoView=new WhoView({model: who})
whoView.render()

# Backgound 페이지와 객체를 주고 받을 때 serialize & deserialized 되는 것 같음
# Backbone Model을 넘겨도 serialize되기 때문에 Model 객체 자체가 넘어가지 않고
# 프로퍼티만 추출되서 넘어감.
chrome.extension.sendRequest {id: who.get('id') }, (resp)->
  if( !resp || (resp.hasOwnProperty('data') && !resp.data ) )
    return

  who.set( resp.data )

newElement = document.createElement('script')
newElement.src = chrome.extension.getURL('walker.js')
newElement.charset = 'utf-8'
document.body.appendChild(newElement)
