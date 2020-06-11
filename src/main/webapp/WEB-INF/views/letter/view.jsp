<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>보통밥집 : 마음의 편지</title>
		<script type="text/javascript">
			$(document).ready(function(){
				
				$("#btnDelete").click(function(){
					var delConfirm = confirm("삭제하시겠습니까?");
					if(delConfirm){
						var formData = $("#viewForm").serialize();
						ajaxPostAction("/letter/delete", formData);
					}else{
						alert("삭제가 취소되었습니다.");
					}
				});
				
				$("#btnUpdate").click(function(){
					
					viewForm.action = "/letter/modify";
					viewForm.submit();
					
				});
				
				$("#btnList").click(function(){
					
					viewForm.action = "/letter/list";
					viewForm.submit();
					
				});
			});
		</script>
	</head>
	<body>		
		<!-- Wrap -->
		<div id="wrap">		
			<div class="view">
				<div class="title" style="width: 100%;">${view.let_title}</div>
				<div class="title_sub"><fmt:formatDate value="${view.let_date}" pattern="yyyy-MM-dd HH:mm" />  조회수 ${view.let_viewCnt}</div>
				<div class="content">${view.let_content}</div>
				<input type="hidden" name="let_no_acc" id="let_no_acc" value="<%= no%>">
			</div>
			<div>
				<input class="btn_global" type="button" id="btnUpdate" value="수정">
				<input class="btn_global" type="button" id="btnDelete" value="삭제">
				<input class="btn_global" type="button" id="btnList" value="게시물 목록">
			</div>
		</div>
		<form id="viewForm" name="viewForm" method="post">
		   	<input type="hidden" id="let_no" name="let_no" value="${view.let_no}"/>
		   	<input type="hidden" name="let_no_acc" id="let_no_acc" value="<%= no%>">
		</form>	
	</body>
</html>