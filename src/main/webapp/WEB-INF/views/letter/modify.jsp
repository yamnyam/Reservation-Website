<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>게시물 수정</title>
		<script type="text/javascript">
			$(document).ready(function(){
				$("#btnCancel").click(function(){
					var cancel = confirm("취소하시겠습니까?");
					if(cancel){
						document.form.action = "/letter/list";
						alert("취소되었습니다.");
 						document.form.submit();
					}
				});
			});
		</script>
	</head>
	<body>
		<h2>게시물 수정</h2>
		<form name="form" method="post">
			<div>
				제목<input name="let_title" size="80" value="${view.let_title}" placeholder="제목을 입력해주세요" />
			</div>
			<div>
				내용<textarea name="let_content" rows="4" cols="80">${view.let_content}</textarea>
			</div>
				<input type="hidden" name="let_no_acc" id="let_no_acc" value="<%= no%>">
			<div style="width:650px; text-align: center;">
				<button type="submit">완료</button>
				<button type="button" id="btnCancel">취소</button>
			</div>
		</form>
		
		<ul>
			<li>
				<a href="/letter/list?num=1">게시물 목록</a>
			</li>
		</ul>
	</body>
</html>