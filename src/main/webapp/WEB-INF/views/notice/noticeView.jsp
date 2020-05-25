<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>공지사항 조회</title>
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
		<h2>공지사항</h2>
			<form name="form">
				<div>
					작성일자 : <fmt:formatDate value="${view.notice_date}" pattern="yyyy-MM-dd a HH:mm:ss" />
				</div>
				<div>
					조회수 : ${view.notice_hits}
				</div>
				<div>
					제목 : ${view.notice_title} 
				</div>
				<div>
					내용 : ${view.notice_content} 
				</div>
				<div style="width:650px;">
<!-- 					<button type="button" id="btnUpdate">수정</button> -->
<!-- 					<button type="button" id="btnDelete">삭제</button> -->
<!-- 					<button type="button" id="btnList">메인</button> -->
					<a href="/" class="button alt">메인</a>
					
				</div>
			</form>
	</body>
</html>