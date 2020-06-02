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
			
			function foodlist() {
				var form = $("#foodlistForm");

				form.submit();
			}
// 			function modify(let_no) {
// 				var modifyForm = $("#modifyForm");
// 				$("#let_no").val(let_no);
// 				modifyForm.submit();
// 			}
			
		</script>
		<meta name="viewport" content="width=device-width, initial-scale=1" />
	</head>
	<body>
		
		<!-- Header -->
		<header id="header">
			<nav class="left">
				<a href="#menu"><span>Menu</span></a>
			</nav>
			<a href="/"><img class="logo" src="/resources/images/home.png"></a>
			<nav class="right">	
				<% if (no == null || no == "") { %>
					<a href="/member/login" class="button alt">Login</a>
				<% } else { %>
					<a href="/member/logout" class="button alt">Logout</a>
				<% } %>
			</nav>
		</header>
		
		
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
		
		<!-- Bottom_bar -->

		<div id="bottom_bar">
			<ul>
				<li onclick="location.href='/'"><img src="/resources/images/bar_home.png" alt="HOME">HOME</li>
				<li onclick="javascript:foodlist()"><img src="/resources/images/bar_food.png" alt="내주변밥집">내주변밥집</li>
				<li onclick="location.href='#'"><img src="/resources/images/bar_hash.png" alt="해시태그">해시태그</li>
				<li onclick="javascript:listLetter(<%= no %>)"><img src="/resources/images/bar_food2.png" alt="기능4">마음의편지</li>
		    </ul>
		</div>
		
		<!-- Hidden Form -->
		<form id="viewForm" name="viewForm" method="post">
	    	<input type="hidden" id="let_no" name="let_no" value="${view.let_no}"/>
	    	<input type="hidden" name="let_no_acc" id="let_no_acc" value="<%= no%>">
		</form>
		
		<form id="foodlistForm" action="/foodlist/foodView" method="post">
	    	<input type="hidden" id="gps_x" name="gps_x" value="37.322843"/>
	    	<input type="hidden" id="gps_y" name="gps_y" value="127.127846"/>
		</form>
	</body>
</html>