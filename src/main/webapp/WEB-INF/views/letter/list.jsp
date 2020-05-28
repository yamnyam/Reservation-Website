<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<!DOCTYPE html>
<html>
	<head>
		<title>list</title>
		<script type="text/javascript">
			$(document).ready(function(){
				$("#btnWrite").click(function(){
					location.href = "/letter/writeView";
				});
			});
			
			function listView(let_no) {
				var form = $("#letForm");
				$("#let_no").val(let_no);

				form.submit();
			}
			
// 			function listLetter() {
// 				var form = $("#listForm");
				
// 				form.submit();
// 			}
		</script>
	</head>
	<body>

	</body>
</html>