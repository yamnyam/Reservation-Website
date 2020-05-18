<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<meta charset="UTF-8">
		<title>게시글 작성</title>
		<script type="text/javascript">
			$(document).ready(function(){	
				$("#btnSave").click(function(){
					var title = $("#let_title").val();
					var content = $("#let_content").val();
					var formData = $("#writeForm").serialize();
					
					if(title == "" || title == null){
						alert("제목을 입력하세요.");
						return;
					}
					
					if(content == "" || content == null){
						alert("내용을 입력하세요.");
						return;
					}
					
					ajaxPostAction("/letter/write", formData);
				});
				
				$("#btnList").click(function(){
					var form = document.getElementById('writeForm');
					form.action = "/letter/list";
					form.method = "post";
					form.submit();
				});
				
				$("#btnCancel").click(function(){
					var cancel = confirm("취소하시겠습니까?");
					if(cancel){
						alert("취소되었습니다.");
						var form = document.getElementById('writeForm');
						form.action = "/letter/list";
						form.method = "post";
						form.submit();
					}
				});
			})
		</script>
	</head>
	<body>
		<h2>게시글 작성</h2>
		<form id="writeForm">
			<table>
				<tr>
					<td>제목</td>
					<td><input name="let_title" id="let_title" size="80" placeholder="제목을 입력해주세요." /></td>
				</tr>
				<tr>
					<td>내용</td>
					<td><textarea name="let_content" id="let_content" rows="4" cols="80" placeholder="내용을 입력해주세요."></textarea></td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="hidden" name="let_no_acc" id="let_no_acc" value="<%= no%>">
						<button type="button" id="btnCancel">취소</button>
						<button type="button" id="btnSave">확인</button>
						<button type="button" id="btnList">목록</button>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<a href="/">처음으로</a>
					</td>
				</tr>
			</table>		
		</form>
	</body>
</html>