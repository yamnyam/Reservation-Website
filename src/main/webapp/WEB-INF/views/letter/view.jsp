<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>게시물 조회</title>
		<script type="text/javascript">
			$(document).ready(function(){
				$("#btnDelete").click(function(){
					var delConfirm = confirm("삭제하시겠습니까?");
					if(delConfirm){
						document.form.action = "/letter/delete?let_no=${view.let_no}";
						alert("삭제되었습니다.");
						document.form.submit();
					}else{
						alert("삭제가 취소되었습니다.");
					}
				});
				
				$("#btnUpdate").click(function(){
					location.href = "/letter/modify?let_no=${view.let_no}";
				});
				
				$("#btnList").click(function(){
					
					document.form.action = "/letter/list";
					document.form.submit();
					
				});
			});
			
		</script>
	</head>
	<body>
		<h2>게시물 보기</h2>
		<form name="form" method="post">
			<div>
				작성일자 : <fmt:formatDate value="${view.let_date}" pattern="yyyy-MM-dd a HH:mm:ss" />
			</div>
			<div>
				조회수 : ${view.let_viewCnt}
			</div>
			<div>
				제목 : ${view.let_title} 
			</div>
			<div>
				내용 : ${view.let_content} 
			</div>
			<div>
				<input type="hidden" name="let_no_acc" id="let_no_acc" value="<%= no%>">
			</div>
			<div style="width:650px;">
				<button type="button" id="btnUpdate">수정</button>
				<button type="button" id="btnDelete">삭제</button>
				<button type="button" id="btnList">게시물 목록</button>
			</div>
		</form>
	</body>
</html>