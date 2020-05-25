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
				
				$("#btnList").click(function(){
					document.form.action = "/letter/list";
					document.form.submit();
				});
				
				$("#btnModify").click(function(){
					var formData = $("#modifyForm").serialize();
					ajaxPostAction("/letter/postModify", formData);
				});
			});
		</script>
	</head>
	<body>
		<h2>게시물 수정</h2>
		<form id="modifyForm" name="modifyForm" action="post">
			<div>
				제목<input name="let_title" size="80" value="${view.let_title}" placeholder="제목을 입력해주세요" />
			</div>
			<div>
				내용<textarea name="let_content" rows="4" cols="80">${view.let_content}</textarea>
			</div>
				<input type="hidden" id="let_no" name="let_no" value="${view.let_no}"/>
				<input type="hidden" name="let_no_acc" id="let_no_acc" value="<%= no%>">
			<div style="width:650px; text-align: center;">
				<button type="button" id="btnModify">완료</button>
				<button type="button" id="btnCancel">취소</button>
				<button type="button" id="btnList">게시글 목록</button>
			</div>
		</form>
	</body>
</html>