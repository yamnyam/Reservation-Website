<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>보통밥집 : 공지사항</title>
		<script type="text/javascript">
			$(document).ready(function(){
				$("#btnList").click(function(){
					
					document.form.action = "/";
					document.form.submit();
				});
			});
		</script>
		</head>
	<body>
		<!-- Wrap -->
		<div id="wrap">		
			<div class="view">
				<div class="title" style="width: 100%;">${view.notice_title}</div>
				<div class="title_sub"><fmt:formatDate value="${view.notice_date}" pattern="yyyy-MM-dd HH:mm" />  조회수 ${view.notice_hits}</div>
				<div class="content">${view.notice_content}</div>
				<input type="hidden" name="let_no_acc" id="let_no_acc" value="<%= no%>">
			</div>
			<div>
				<a href="/"><input class="btn_global" type="button" id="btnUpdate" value="메인"></a>
			</div>
		</div>
	</body>
</html>