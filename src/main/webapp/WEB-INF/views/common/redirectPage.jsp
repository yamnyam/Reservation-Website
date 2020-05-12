<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
	</head>
	<body>
		<script type="text/javascript">
		 	var form = document.createElement('form');
		    form.setAttribute('method', "post");
		    form.setAttribute('action', "/letter/list");
		    
		    var paramMap = Object.keys(${paramMap});

		    for (var key in paramMap) {
		        if (paramMap.hasOwnProperty(key)) {
		            var hiddenField = document.createElement('input');
		            hiddenField.setAttribute('type', 'hidden');
		            hiddenField.setAttribute('name', key);
		            hiddenField.setAttribute('value', paramMap[key]);

		            form.appendChild(hiddenField);
		        }
		    }
		    
		    document.body.appendChild(form);
// 		    form.submit();
		</script>
	</body>
</html>