<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>게시글 작성</title>
		<script type="text/javascript">
		$(document).ready(function(){	
			$("#btnSave").click(function(){
				var title = $("#let_title").val();
				var content = $("#let_content").val();
				if(title == "" || title == null){
					alert("제목을 입력하세요.");
					return;
				}
				if(content == "" || content == null){
					alert("내용을 입력하세요.");
					return;
				}
				document.form.action="/letter/write";
				document.form.submit();
			});
		})
		</script>
	</head>
	<body>
		<h2>게시글 작성</h2>
		<form name="form" method="post">
			<div>
				제목<input name="let_title" id="let_title" size="80" placeholder="제목을 입력해주세요.">
			</div>
			<div>
				내용<textarea name="let_content" id="let_content" rows="4" cols="80" placeholder="내용을 입력해주세요."></textarea>
			</div>
			<div>
				<input type="hidden" name="let_no_acc" id="let_no_acc" value="<%= no%>">
			</div>
			<div style="width:650px; text-align: center;">
				<button type="button" id="btnSave">확인</button>
				<button type="reset">취소</button>
			</div>
		</form>
		
		<ul>
			<li>
				<a href="/letter/list">게시물 목록</a>
			</li>
		</ul>
	</body>
</html>