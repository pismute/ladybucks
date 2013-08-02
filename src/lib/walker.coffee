agrchk(document.getElementById('agree1')) if document.getElementById('agree1')

agrchk(document.getElementById('agree2')) if document.getElementById('agree2')

setTimeout( ()->
  userNm = document.getElementById('userNm').value
  userNo1 = document.getElementById('userNo1').value
  userNo2 = document.getElementById('userNo2').value
  return if !userNm || !userNo1 || !userNo2

  goIDCheck() if typeof goIDCheck == 'function'

  goAct() if typeof goAct == 'function'
, 500) #setTimeout
