factory =
  name: ->
    names = window.names
    names[ Math.floor( Math.random()*1000000 ) % names.length ]
  email: ->
    id = Math.random().toString(36)
    id = id.substring(2, Math.floor(Math.random() * 100) % 8 + 8)
    """#{id}@naver.com"""
  carrier: ->
    which = [ 'kt', 'sk', 'lg' ]
    i = Math.floor(Math.random() * 10) % 3
    which[i]
  phone1: -> '010'
  phone2: -> Math.floor( ( Math.random() * 10000 ) )
  phone3: -> Math.floor( ( Math.random() * 10000 ) )

$('#agree1, #agree2').prop('checked', true)
$('input[name=userNm]').val( factory.name() )
$('input[name=cust_email_addr]').val( factory.email() )
$("input[name=cust_hp_cp][value=#{factory.carrier()}]").prop('checked', true)
$('input[name=phone1]').val( factory.phone1() )
$('input[name=phone2]').val( factory.phone2() )
$('input[name=phone3]').val( factory.phone3() )

$('form[name=pageForm]')
  .prop('target', 'actFrm')
  .prop('action', 'loginAct.jsp')
  .submit()

