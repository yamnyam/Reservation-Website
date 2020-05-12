<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
	</head>
	<body>
		<script type="text/javascript">
			var msg = '${msg}';
			var returnUrl = '${url}';
			alert(msg);
			document.location.href = returnUrl;
		</script>
	</body>
</html>