if (document.getElementById('agree1')) {
	agrchk(document.getElementById('agree1'));
}

if (document.getElementById('agree2')) {
	agrchk(document.getElementById('agree2'));
}

var confirmGoAct = function() {
	var userNm = document.getElementById('userNm').value;
	var userNo1 = document.getElementById('userNo1').value;
	var userNo2 = document.getElementById('userNo2').value;
	if(!userNm || !userNo1 || !userNo2) {
		return;
	}

	if (typeof goIDCheck == 'function') {
		goIDCheck();
	}

	if (typeof goAct == 'function') {
		goAct();
	}
};

setTimeout(confirmGoAct, 500);
