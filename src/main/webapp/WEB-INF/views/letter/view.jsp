<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>게시물 조회</title>
		<script src="http://code.jquery.com/jquery-latest.js"></script>
		<script type="text/javascript">
			$(document).ready(function(){
				$("#btnDelete").click(function(){
					var delConfirm = confirm("삭제하시겠습니까?")
					if(delConfirm){
						document.form.action = "/letter/delete?let_no=${view.let_no}";
						alert("삭제되었습니다.");
						document.form.submit();
					}else{
						alert("삭제가 취소되었습니다.");
					}
				});
			});
			
			$(document).ready(function(){
				$("#btnUpdate").click(function(){
					document.form.action = "/letter/modify?let_no=${view.let_no}";
					document.form.submit();
				});
			})
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
			
			<div style="width:650px;">
				<button type="button" id="btnUpdate">수정</button>
				<button type="button" id="btnDelete">삭제</button>
			</div>
		</form>
		
		<div>
			<a href="/letter/modify?let_no=${view.let_no}">게시물 수정</a>, <a href="/letter/delete?let_no=${view.let_no}">게시물 삭제</a>
		</div>

		<ul>
			<li>
				<a href="/letter/listPage?num=1">게시물 목록</a>
			</li>
		</ul>
	</body>
</html>