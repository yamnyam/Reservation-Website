// Ajax Post
function ajaxPostAction(url, formData) {
	$.ajax({
        url: url,
        type: "POST",
        data: formData,
        dataType: "json",
        processData: false,
        contentType: false,
        success: function(data) {
        	/**
        	 * data[0] : success message
        	 * data[1] : redirect action
        	 * data[2] : redirect parameter 
        	 */
        	alert(data[0]);
        	callbackPage(data[1], data[2]);
        },
        error: function(data) {
            alert("오류가 발생했습니다.\n잠시후 다시 시도하세요.");
        }
    });
}

// CallBack 화면 이동
function callbackPage(url, data) {
	if (url == null || url == undefined)
		return;
	
	var form = document.createElement('form');
	form.setAttribute('method', "post");
	form.setAttribute('action', url);
	
	for (var key in data) {
		if (data.hasOwnProperty(key)) {
			var hiddenField = document.createElement('input');
            hiddenField.setAttribute('type', 'hidden');
            hiddenField.setAttribute('name', key);
            hiddenField.setAttribute('value', data[key]);
            
            form.appendChild(hiddenField);
		}
	}
	
	document.body.appendChild(form);
    form.submit();
}

function listLetter(acc_no) {
    
	if (acc_no == undefined) {
   		alert("로그인한 후 이용가능합니다.");
   		return;
	}

	var form = $("#letterForm");
	form.submit();
	}